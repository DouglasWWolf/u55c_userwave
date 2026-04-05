//=============================================================================
//                   ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 28-Mar-26  DWW     1  Initial creation
//=============================================================================

/*
    The userwave execution engine
*/


module uw_engine
(
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF axis_in0:axis_in1:md_out, ASSOCIATED_RESET resetn" *)
    input   clk,
    input   resetn,
    
    // This will be true when the input FIFO has enough data in 
    // it that we are very unlikely to underflow
    input   fifo0_ready,
    input   fifo1_ready,

    // One of the CTL_XXX commands
    input[2:0] ctl_command,

    // This is derived from the "row_period" pulse that is output
    // by the sensor chip.  Theoretically, we will see a rising edge
    // every 256 clock cycles.
    input   row_pulse,

    // This is for debugging.  This strobes high in unison with the changing
    // of the output switches.  It only strobes high on "real" userwave
    // commands, and not on the artifical "no-op" UWCs that this module 
    // generates internally.
    output reg row_tick_stb,

    // The count of ticks thus far in the currently executing UWC
    output reg[15:0] tick_count,

    // Error strobes
    output reg underflow_stb,  // Ran out of input data too early
    output reg short_uwc_stb,  // A UWC had a duration less than 4
    output reg md_stall_stb,   // Meta data output stream is stalled

    // This will be asserted when a halt-request has been satisfied
    output reg halted,

    // This keeps track of which input queue is currently selected
    output reg q_select,

    // Switches that control the sensor-chip
    output reg liq_sw,
    output reg vpretop_sw,
    output reg vprebot_sw,
    output reg refp_sw,
    output reg refn_sw,
    output reg glb_pre_sw,

    // The rolling precharge signals, sampled by the sensor-chip at rising edge
    // of "row_pulse".
    output reg pre0, pre256,

    // Signals that start a chip-read, sampled by the sensor-chip at rising edge
    // of "row_pulse"
    output reg rs0, rs256,

    // When this is asserted, it is safe for other modules to update SMEM on
    // the sensor-hip
    output smem_access_enable,

    //=========================================================================
    // This the SPI bus to a pair of LTC-2656 DACs
    //=========================================================================
    output spi_csld,
    output spi_sck,
    output spi_mosi0,
    output spi_mosi1,
    //=========================================================================

    //=========================================================================
    // This is the stream of userwave commands that gets fed to us by the
    // userwave fetcher
    //=========================================================================
    input [511:0]   axis_in0_tdata,
    input           axis_in0_tvalid,
    output          axis_in0_tready,
    //=========================================================================


    //=========================================================================
    // This is the stream of userwave commands that gets fed to us by the
    // userwave fetcher
    //=========================================================================
    input [511:0]   axis_in1_tdata,
    input           axis_in1_tvalid,
    output          axis_in1_tready,
    //=========================================================================


    //=========================================================================
    // This is an output stream for writing records that will be used as
    // meta-data to be transmitted to downstream processes
    //=========================================================================
    output reg[511:0] md_out_tdata,
    output reg        md_out_tvalid,
    input             md_out_tready
    //=========================================================================

);

// The legal values of "ctl_command"
localparam CTL_REQ_UNSAFE_HALT   = 0;
localparam CTL_REQ_SAFE_HALT     = 1;
localparam CTL_REQ_SAFE_RUN_Q0   = 2;
localparam CTL_REQ_SAFE_RUN_Q1   = 3;
localparam CTL_REQ_UNSAFE_RUN_Q0 = 4;
localparam CTL_REQ_UNSAFE_RUN_Q1 = 5;


// No UWC is allowed to be shorter than 4 ticks because it takes that long to
// program the DACs
localparam MINIMUM_UWC_DURATION = 4;

//=============================================================================
// Decode "ctl_command" into discrete signals
//=============================================================================
reg req_run;
reg req_unsafe;
reg req_q;
//-----------------------------------------------------------------------------
always @* begin

    case (ctl_command)
        
        CTL_REQ_UNSAFE_HALT:
            begin
                req_run    = 0;
                req_unsafe = 1;
                req_q      = 0; // Doesn't matter
            end

        CTL_REQ_SAFE_HALT:
            begin
                req_run    = 0;
                req_unsafe = 0;
                req_q      = 0; // Doesn't matter
            end

        CTL_REQ_SAFE_RUN_Q0:
            begin
                req_run    = 1;
                req_unsafe = 0;
                req_q      = 0;
            end

        CTL_REQ_SAFE_RUN_Q1:
            begin
                req_run    = 1;
                req_unsafe = 0;
                req_q      = 1;
            end

        CTL_REQ_UNSAFE_RUN_Q0:
            begin
                req_run    = 1;
                req_unsafe = 1;
                req_q      = 0;
            end

        CTL_REQ_UNSAFE_RUN_Q1:
            begin
                req_run    = 1;
                req_unsafe = 1;
                req_q      = 1;
            end

        // Any illegal command is "unsafe halt"
        default:
            begin
                req_run    = 0;
                req_unsafe = 1;
                req_q      = 0; // Doesn't matter
            end

    endcase

end
//=============================================================================

//=============================================================================
// Build a switch between the two input streams
//=============================================================================
wire[511:0] axis_in_tdata;
wire        axis_in_tvalid;
wire        axis_in_tready;
//-----------------------------------------------------------------------------
assign axis_in_tdata  = q_select ? axis_in1_tdata  : axis_in0_tdata ;
assign axis_in_tvalid = q_select ? axis_in1_tvalid : axis_in0_tvalid;
assign axis_in0_tready = (axis_in_tready & q_select == 0);
assign axis_in1_tready = (axis_in_tready & q_select == 1);
//-------------------------------------------------------------------------------
wire   fifo_ready[0:1];
assign fifo_ready[0] = fifo0_ready;
assign fifo_ready[1] = fifo1_ready;
//=============================================================================



//=============================================================================
// These fields are the currently executing userwave command
//=============================================================================
wire[15:0]    uwc_glb_pre_start;
wire[15:0]    uwc_glb_pre_duration;
wire[15:0]    uwc_roll_pre_bot_start;
wire[15:0]    uwc_roll_pre_bot_duration;
wire[15:0]    uwc_roll_pre_top_start;
wire[15:0]    uwc_roll_pre_top_duration;
wire          uwc_liq_sw;
wire          uwc_refn_sw;
wire          uwc_refp_sw;
wire          uwc_vprebot_sw;
wire          uwc_vpretop_sw;
wire[15:0]    uwc_liq_sw_delay;
wire[15:0]    uwc_liq_b;
wire[15:0]    uwc_liq_a;
wire[15:0]    uwc_refn_sw_delay;
wire[15:0]    uwc_refn_b;
wire[15:0]    uwc_refn_a;
wire[15:0]    uwc_refp_sw_delay;
wire[15:0]    uwc_refp_b;
wire[15:0]    uwc_refp_a;
wire[15:0]    uwc_vprebot_sw_delay;
wire[15:0]    uwc_vprebot_b;
wire[15:0]    uwc_vprebot_a;
wire[15:0]    uwc_vpretop_sw_delay;
wire[15:0]    uwc_vpretop_b;
wire[15:0]    uwc_vpretop_a;
wire[15:0]    uwc_read_data_type;
wire[15:0]    uwc_read_characterization_id;
wire[15:0]    uwc_read_start_time;
wire          uwc_read_generated_flag;
wire          uwc_read_safe_halting_point;
wire          uwc_read_bright_flag;
wire          uwc_read_phase;
wire          uwc_read_en;
wire[15:0]    uwc_cmd_duration;
wire[31:0]    uwc_cmd_index;
//=============================================================================


//=============================================================================
// Let's derive some handy values from the userwave command
//=============================================================================
wire[15:0] uwc_last_tick        = uwc_cmd_duration - 1;
wire[15:0] uwc_glb_pre_end      = uwc_glb_pre_start + uwc_glb_pre_duration;
wire[15:0] uwc_roll_pre_bot_end = uwc_roll_pre_bot_start + uwc_roll_pre_bot_duration;
wire[15:0] uwc_roll_pre_top_end = uwc_roll_pre_top_start + uwc_roll_pre_top_duration;
//=============================================================================

//=============================================================================
// These are our interface with the DAC driver module that programs the DACS
//=============================================================================
wire[127:0] dac_values_0 = 
{
    16'b0,          // DAC pin DAC_H
    16'b0,          // DAC pin DAC_G
    16'b0,          // DAC pin DAC_F
    16'b0,          // DAC pin DAC_E
    uwc_liq_b,      // DAC pin DAC_D
    uwc_liq_a,      // DAC pin DAC_C
    uwc_vpretop_b,  // DAC pin DAC_B
    uwc_vpretop_a   // DAC pin DAC_A
};

wire[127:0] dac_values_1 = 
{
    uwc_refn_b,     // DAC pin DAC_H
    uwc_refn_a,     // DAC pin DAC_G
    16'b0,          // DAC pin DAC_F
    uwc_refp_b,     // DAC pin DAC_E
    uwc_refp_a,     // DAC pin DAC_D
    uwc_vprebot_b,  // DAC pin DAC_C
    uwc_vprebot_a,  // DAC pin DAC_B
    16'b0           // DAC pin DAC_A
};

// We strobe this high to program the DACs
reg pgm_dacs_stb;

// This is high when DAC programming is complete
wire pgm_dacs_complete;
//=============================================================================


//=============================================================================
// Here we detect rising edges of "row_pulse".
//=============================================================================
reg prior_row_pulse;
always @(posedge clk) begin
    if (resetn == 0)
        prior_row_pulse <= 0;
    else
        prior_row_pulse <= row_pulse;
end

// Perform edge detection on "row_pulse"
wire row_pulse_rising = (prior_row_pulse == 0) & (row_pulse == 1);
//=============================================================================


// We always have two userwave commands that we're processing.  We program
// the DAC voltages from uwc[0] and set the state out of the output switches
// from uwc[1]
reg[511:0] uwc[0:1];

// A no-op userwave command
wire[511:0] uwc_nop;

// The next state of the output switches
reg next_liq_sw;
reg next_vpretop_sw; 
reg next_vprebot_sw; 
reg next_refp_sw;
reg next_refn_sw;
reg next_glb_pre_sw;


//=============================================================================
// This state machine fetches userwave commands and executes them
//
// This state machine pre-programs the DACs with the output voltages but does
// not instruct the DACS to drive those voltages to the DACs pin until the
// *next* time we program DAC voltages
//=============================================================================
reg[2:0]   fsm_state;
localparam FSM_NEXT_UWC       = 0;
localparam FSM_SETUP_SWITCHES = 1;
localparam FSM_OUTPUT_MD1     = 2;
localparam FSM_OUTPUT_MD2     = 3;
localparam FSM_WAIT_FOR_TICK  = 4;
localparam FSM_WAIT_TICK_END  = 5;
reg[8:0]   smem_access_counter;
reg[63:0]  md_timestamp; // Timestamp for meta-data output
//-----------------------------------------------------------------------------
always @(posedge clk) begin

    // These strobe high for a single cycle at a time
    underflow_stb <= 0;
    short_uwc_stb <= 0;
    pgm_dacs_stb  <= 0;
    row_tick_stb  <= 0;
    md_stall_stb  <= 0;
    md_out_tvalid <= 0;

    // Keep a free-running timestamp that will be used by metadata output
    md_timestamp <= (halted) ? 0: md_timestamp + 1;

    // This counts down ticks.  When it's zero, it is safe for
    // other modules to update sensor-chip SMEM
    if (smem_access_counter && row_pulse_rising)
        smem_access_counter <= smem_access_counter - 1;

    if (resetn == 0) begin
        fsm_state           <= FSM_NEXT_UWC;
        pre0                <= 0;
        pre256              <= 0;
        rs0                 <= 0;
        rs256               <= 0;
        next_liq_sw         <= 0;   
        next_vpretop_sw     <= 0;   
        next_vprebot_sw     <= 0;   
        next_refp_sw        <= 0; 
        next_refn_sw        <= 0; 
        next_glb_pre_sw     <= 0;  
        smem_access_counter <= 0;
        halted              <= 1;
        q_select            <= 0;
        uwc[0]              <= uwc_nop;
        uwc[1]              <= uwc_nop;
    end

    else case(fsm_state)

        // Copy uwc[0] into uwc[1] and fetch a new UWC into uwc[0].
        // uwc[0] contains the voltages we program into the DAC
        // uwc[1] contains all other UWC settings
        FSM_NEXT_UWC:
            begin
                if (halted) begin
                    uwc[1] <= uwc[0];
                    uwc[0] <= uwc_nop;
                end

                else if (axis_in_tready & axis_in_tvalid) begin
                    uwc[1] <= uwc[0];
                    uwc[0] <= axis_in_tdata;
                end
                
                else begin
                    underflow_stb <= 1;
                    uwc[1] <= uwc[0];
                    uwc[0] <= uwc_nop;
                end

                tick_count <= 0;
                fsm_state  <= FSM_SETUP_SWITCHES;

            end
            

        // Here we configure all of the new switch settings that we want to
        // take effect when the next tick happens.  We also set up the rs0,
        // rs256, pre0, and pre256 signals, which take effect immediately.
        FSM_SETUP_SWITCHES:
            begin
                
                // Tell the world we saw a UWC with an invalid duration
                short_uwc_stb <= (uwc_cmd_duration < MINIMUM_UWC_DURATION);

                //-------------------------------------------------------------
                // Do we need to change any switch settings at the next tick?
                //-------------------------------------------------------------
                if (uwc_liq_sw_delay == tick_count)
                    next_liq_sw <= uwc_liq_sw;

                if (uwc_vpretop_sw_delay == tick_count)
                    next_vpretop_sw <= uwc_vpretop_sw;

                if (uwc_vprebot_sw_delay == tick_count)
                    next_vprebot_sw <= uwc_vprebot_sw;

                if (uwc_refp_sw_delay == tick_count)
                    next_refp_sw <= uwc_refp_sw;

                if (uwc_refn_sw_delay == tick_count)
                    next_refn_sw <= uwc_refn_sw;

                if (uwc_glb_pre_duration && uwc_glb_pre_start == tick_count)
                    next_glb_pre_sw <= 1;
                
                if (uwc_glb_pre_duration && uwc_glb_pre_end == tick_count)
                    next_glb_pre_sw <= 0;
                //-------------------------------------------------------------

                //-------------------------------------------------------------
                // pre0, pre256, rs0, and rs256 take effect immediately, and
                // must already have their values when the tick happens (This
                // is because the sensor-chip starts sampling those signals
                // on the leading edge of the tick)
                //-------------------------------------------------------------
                if (uwc_roll_pre_top_duration && uwc_roll_pre_top_start == tick_count)
                    pre0 <= 1;
                
                if (uwc_roll_pre_top_duration && uwc_roll_pre_top_end == tick_count)
                    pre0 <= 0;

                if (uwc_roll_pre_bot_duration && uwc_roll_pre_bot_start == tick_count)
                    pre256 <= 1;
                
                if (uwc_roll_pre_bot_duration && uwc_roll_pre_bot_end == tick_count)
                    pre256 <= 0;

                // When a sensor-chip read begins, it's not safe for other modules
                // to update sensor-chip SMEM until 256 row_periods have passed 
                // (plus 1 to account for the starting tick)
                if (uwc_read_en && uwc_read_start_time == tick_count) begin
                    smem_access_counter <= 257;
                    rs0                 <= (uwc_read_phase == 0);
                    rs256               <= (uwc_read_phase == 1);
                    fsm_state           <= FSM_OUTPUT_MD1;
                end

                // If we're not about to read the sensor, skip metadata output
                else fsm_state <= FSM_WAIT_FOR_TICK;
            end

        // Output the 1st clock cycle of meta-data.  If the output stream
        // is stalled, strobe the "md_stall_stb" error bit
        FSM_OUTPUT_MD1:
            begin
                md_out_tdata  <= {uwc[1][447:0], md_timestamp};
                md_out_tvalid <= 1;
                md_stall_stb  <= !md_out_tready;
                fsm_state     <= FSM_OUTPUT_MD2;
            end

        // Output the 2nd clock cycle of meta-data.  If the output stream
        // is stalled, strobe the "md_stall_stb" error bit
        FSM_OUTPUT_MD2:
            begin
                md_out_tdata  <= {uwc[1][511:448]};
                md_out_tvalid <= 1;
                md_stall_stb  <= !md_out_tready;
                fsm_state     <= FSM_WAIT_FOR_TICK;
            end

        // Wait for a tick to happen, then drive the DACs and switches 
        // to their new output values
        FSM_WAIT_FOR_TICK:
            if (row_pulse_rising) begin
                row_tick_stb <= (uwc_read_generated_flag == 0);
                pgm_dacs_stb <= (tick_count == 0);
                liq_sw       <= next_liq_sw    ;   
                vpretop_sw   <= next_vpretop_sw;   
                vprebot_sw   <= next_vprebot_sw;   
                refp_sw      <= next_refp_sw   ; 
                refn_sw      <= next_refn_sw   ; 
                glb_pre_sw   <= next_glb_pre_sw;  
                fsm_state    <= FSM_WAIT_TICK_END;
            end

        // Wait until the row_pulse tells us that it's safe to proceed to
        // the next tick. When it does, decide whether we are going to fetch
        // a new UWC or whether we are still executing the current UWC.
        FSM_WAIT_TICK_END:
            if (row_pulse == 0) begin
                rs0   <= 0;
                rs256 <= 0;

                // If there are more ticks remaining in this userwave command,
                // go set up the switches for the next tick
                if (tick_count < uwc_last_tick) begin
                    tick_count <= tick_count + 1;
                    fsm_state  <= FSM_SETUP_SWITCHES;
                end

                // We've reached the end of the current UWC, check to see
                // if a halt has been requested. 
                else begin
                    pre0   <= 0; 
                    pre256 <= 0; 

                    // Are we switching to "run" mode?
                    if (req_run & fifo_ready[req_q]) begin
                        
                        // If we're not switching queues, just unhalt
                        if (q_select == req_q)
                            halted <= 0;

                        // Switch queues only if we're allowed
                        else if (uwc_read_safe_halting_point | req_unsafe) begin
                            halted   <= 0;
                            q_select <= req_q;
                        end
                    end
                    
                    // Otherwise, we're trying to halt...
                    else begin
                        halted <= (uwc_read_safe_halting_point | req_unsafe);
                    end

                    fsm_state <= FSM_NEXT_UWC;
                end
               
            end
    endcase
end

// We're read to accept a new UWC only when we're not halted
assign axis_in_tready = (fsm_state == FSM_NEXT_UWC && !halted);

// When the counter is zero, it's safe for other modules to access sensor-chip
// SMEM.  We prevent other modules from writing to SMEM during a chip-read
// because it introduces noise into the sensor-chip's internal ADC sampling.
assign smem_access_enable = (smem_access_counter == 0);

//=============================================================================



//=============================================================================
// The dual DAC driver - We feed it DAC values and a "start_stb" signal, and
// it performs the SPI transaction to two LTC-2656 DACs simultaneously
//=============================================================================
uw_dual_ltc2656 i_dual_ltc2656
(
    .clk            (clk),
    .resetn         (resetn),
    .start_stb      (pgm_dacs_stb),
    .idle           (pgm_dacs_complete),
    .dac_values_0   (dac_values_0),
    .dac_values_1   (dac_values_1),
    .spi_csld       (spi_csld),
    .spi_sck        (spi_sck),
    .spi_mosi0      (spi_mosi0),
    .spi_mosi1      (spi_mosi1)
);
//=============================================================================



//=============================================================================
// Extract the DAC values from uwc[0]
//=============================================================================
uw_decode_uwc decode_uwc0
(
    .uwc                      (uwc[0]       ),
    .glb_pre_start            (             ),
    .glb_pre_duration         (             ),
    .roll_pre_bot_start       (             ),
    .roll_pre_bot_duration    (             ),
    .roll_pre_top_start       (             ),
    .roll_pre_top_duration    (             ),
    .liq_sw                   (             ),
    .refn_sw                  (             ),
    .refp_sw                  (             ),
    .vprebot_sw               (             ),
    .vpretop_sw               (             ),
    .liq_sw_delay             (             ),
    .liq_b                    (uwc_liq_b    ),
    .liq_a                    (uwc_liq_a    ),
    .refn_sw_delay            (             ),
    .refn_b                   (uwc_refn_b   ),
    .refn_a                   (uwc_refn_a   ),
    .refp_sw_delay            (             ),
    .refp_b                   (uwc_refp_b   ),
    .refp_a                   (uwc_refp_a   ),
    .vprebot_sw_delay         (             ),
    .vprebot_b                (uwc_vprebot_b),
    .vprebot_a                (uwc_vprebot_a),
    .vpretop_sw_delay         (             ),
    .vpretop_b                (uwc_vpretop_b),
    .vpretop_a                (uwc_vpretop_a),
    .read_data_type           (             ),
    .read_characterization_id (             ),
    .read_start_time          (             ),
    .read_generated_flag      (             ),
    .read_safe_halting_point  (             ),
    .read_bright_flag         (             ),
    .read_phase               (             ),
    .read_en                  (             ),
    .cmd_duration             (             ),
    .cmd_index                (             )
);
//=============================================================================


//=============================================================================
// Extract everything except the DAC values from uwc[1]
//============================================================================= 
uw_decode_uwc decode_uwc1
(
    .uwc                      (uwc[1]                      ),
    .glb_pre_start            (uwc_glb_pre_start           ),
    .glb_pre_duration         (uwc_glb_pre_duration        ),
    .roll_pre_bot_start       (uwc_roll_pre_bot_start      ),
    .roll_pre_bot_duration    (uwc_roll_pre_bot_duration   ),
    .roll_pre_top_start       (uwc_roll_pre_top_start      ),
    .roll_pre_top_duration    (uwc_roll_pre_top_duration   ),
    .liq_sw                   (uwc_liq_sw                  ),
    .refn_sw                  (uwc_refn_sw                 ),
    .refp_sw                  (uwc_refp_sw                 ),
    .vprebot_sw               (uwc_vprebot_sw              ),
    .vpretop_sw               (uwc_vpretop_sw              ),
    .liq_sw_delay             (uwc_liq_sw_delay            ),
    .liq_b                    (                            ),
    .liq_a                    (                            ),
    .refn_sw_delay            (uwc_refn_sw_delay           ),
    .refn_b                   (                            ),
    .refn_a                   (                            ),
    .refp_sw_delay            (uwc_refp_sw_delay           ),
    .refp_b                   (                            ),
    .refp_a                   (                            ),
    .vprebot_sw_delay         (uwc_vprebot_sw_delay        ),
    .vprebot_b                (                            ),
    .vprebot_a                (                            ),
    .vpretop_sw_delay         (uwc_vpretop_sw_delay        ),
    .vpretop_b                (                            ),
    .vpretop_a                (                            ),
    .read_data_type           (uwc_read_data_type          ),
    .read_characterization_id (uwc_read_characterization_id),
    .read_start_time          (uwc_read_start_time         ),
    .read_generated_flag      (uwc_read_generated_flag     ),
    .read_safe_halting_point  (uwc_read_safe_halting_point ),
    .read_bright_flag         (uwc_read_bright_flag        ),
    .read_phase               (uwc_read_phase              ),
    .read_en                  (uwc_read_en                 ), 
    .cmd_duration             (uwc_cmd_duration            ),
    .cmd_index                (uwc_cmd_index               )
);
//=============================================================================



//=============================================================================
// Create a userwave command that serves as a no-op
//
// This holds the voltages and switch states steady, has no read, no pre-charge
// and does nothing else.
//
// The NOP command is a "read_safe_halting_point"
//============================================================================= 
uw_encode_uwc i_nop
(
    .uwc                      (uwc_nop             ),
    .glb_pre_start            (0                   ),
    .glb_pre_duration         (0                   ),
    .roll_pre_bot_start       (0                   ),
    .roll_pre_bot_duration    (0                   ),
    .roll_pre_top_start       (0                   ),
    .roll_pre_top_duration    (0                   ),
    .liq_sw                   (uwc_liq_sw          ),
    .refn_sw                  (uwc_refn_sw         ),
    .refp_sw                  (uwc_refp_sw         ),
    .vprebot_sw               (uwc_vprebot_sw      ),
    .vpretop_sw               (uwc_vpretop_sw      ),
    .liq_sw_delay             (0                   ),
    .liq_b                    (uwc_liq_b           ),
    .liq_a                    (uwc_liq_a           ),
    .refn_sw_delay            (0                   ),
    .refn_b                   (uwc_refn_b          ),
    .refn_a                   (uwc_refn_a          ),
    .refp_sw_delay            (0                   ),
    .refp_b                   (uwc_refp_b          ),
    .refp_a                   (uwc_refp_a          ),
    .vprebot_sw_delay         (0                   ),
    .vprebot_b                (uwc_vprebot_b       ),
    .vprebot_a                (uwc_vprebot_a       ),
    .vpretop_sw_delay         (0                   ),
    .vpretop_b                (uwc_vpretop_b       ),
    .vpretop_a                (uwc_vpretop_a       ),
    .read_data_type           (0                   ),
    .read_characterization_id (0                   ),
    .read_start_time          (0                   ),
    .read_generated_flag      (1                   ),
    .read_safe_halting_point  (1                   ),
    .read_bright_flag         (0                   ),
    .read_phase               (0                   ),
    .read_en                  (0                   ), 
    .cmd_duration             (MINIMUM_UWC_DURATION),
    .cmd_index                (uwc_cmd_index       )
);
//=============================================================================




endmodule