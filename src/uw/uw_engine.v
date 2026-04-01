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
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF axis_in, ASSOCIATED_RESET resetn" *)
    input   clk,
    input   resetn,

    // Our engine starts running when this strobes high
    input   start_stb,

    // This will be high while the userwave fetcher is running
    input   fetcher_busy,

    // This is derived from the "row_period" pulse that is output
    // by the sensor chip.  Theoretically, we will see a rising edge
    // every 256 clock cycles.
    input   row_pulse,

    // This is for debugging.  This strobes high in unison with the
    // changing of the output switches
    output reg row_tick_stb,

    // The count of ticks thus far in the currently executing UWC
    output reg[15:0] tick_count,

    // This strobes high every time we don't have input available
    output reg underflow_stb,

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
    input [511:0]   axis_in_tdata,
    input           axis_in_tvalid,
    output          axis_in_tready
    //=========================================================================
);


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
reg[1:0]   uwc_valid;

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
localparam FSM_IDLE             = 0;
localparam FSM_FETCH_1ST_UWC    = 1;
localparam FSM_WAIT_DAC_IDLE    = 2;
localparam FSM_NEXT_UWC         = 3;
localparam FSM_SETUP_SWITCHES   = 4;
localparam FSM_WAIT_FOR_TICK    = 5;
localparam FSM_WAIT_UNTIL_SAFE  = 6;
reg[8:0]   smem_access_counter;
//-----------------------------------------------------------------------------
always @(posedge clk) begin

    // These strobe high for a single cycle at a time
    underflow_stb <= 0;
    pgm_dacs_stb  <= 0;
    row_tick_stb  <= 0;

    // This counts down ticks.  When it's zero, it is safe for
    // other modules to update sensor-chip SMEM
    if (smem_access_counter && row_pulse_rising)
        smem_access_counter <= smem_access_counter - 1;

    if (resetn == 0) begin
        fsm_state           <= FSM_IDLE;
        smem_access_counter <= 0;
    end

    else case(fsm_state)

        // We're idle.  If we're told to start, go fetch a userwave command
        FSM_IDLE:
            begin
                uwc_valid       <= 0;
                pre0            <= 0;
                pre256          <= 0;
                rs0             <= 0;
                rs256           <= 0;
                if (start_stb) begin
                    next_liq_sw     <= 0;   
                    next_vpretop_sw <= 0;   
                    next_vprebot_sw <= 0;   
                    next_refp_sw    <= 0; 
                    next_refn_sw    <= 0; 
                    next_glb_pre_sw <= 0;  
                    fsm_state       <= FSM_FETCH_1ST_UWC;
                end
            end

        // Fetch the first UWC and program the DAC with the values it contains.
        // The values won't be driven to the DAC pins until the *next* time we
        // program DAC voltages
        FSM_FETCH_1ST_UWC:
            if (axis_in_tready & axis_in_tvalid) begin
                uwc[0]       <= axis_in_tdata;
                uwc_valid[0] <= 1;
                pgm_dacs_stb <= 1;
                fsm_state    <= FSM_WAIT_DAC_IDLE;
            end

        // Here we wait for the DAC programming to complete, and for
        // the rising edge of the row_pulse.  We wait for that rising edge
        // because we want state FSM_NEXT_UWC to start at the very beginning
        // of a tick period
        FSM_WAIT_DAC_IDLE:
            if (pgm_dacs_complete & row_pulse_rising) begin
                fsm_state <= FSM_NEXT_UWC;
            end

        // Copy uwc[0] into uwc[1] and fetch a new UWC into uwc[0].
        // uwc[0] contains the voltages we program into the DAC
        // uwc[1] contains all other UWC settings
        FSM_NEXT_UWC:
            begin
                tick_count <= 0;

                if (axis_in_tready & axis_in_tvalid) begin
                    uwc[1]       <= uwc[0];
                    uwc[0]       <= axis_in_tdata;
                    uwc_valid[1] <= uwc_valid[0];
                    uwc_valid[0] <= 1;
                    fsm_state    <= FSM_SETUP_SWITCHES;
                end
                
                else if (fetcher_busy)
                    underflow_stb <= 1;
                
                else if (uwc_valid[0]) begin
                    uwc[1]       <= uwc[0];
                    uwc_valid[1] <= uwc_valid[0];
                    uwc_valid[0] <= 0;
                    fsm_state    <= FSM_SETUP_SWITCHES;
                end

                else fsm_state <= FSM_IDLE;
            end
            

        // Here we configure all of the new switch settings that we want to
        // take effect when the next tick happens.  We also set up the rs0,
        // rs256, pre0, and pre256 signals, which take effect immediately.
        FSM_SETUP_SWITCHES:
            begin

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
                end
                //-------------------------------------------------------------

                fsm_state <= FSM_WAIT_FOR_TICK;
            end


        // Wait for a tick to happen, then drive the DACs and switches 
        // to their new output values
        FSM_WAIT_FOR_TICK:
            if (row_pulse_rising) begin
                row_tick_stb <= 1;
                pgm_dacs_stb <= (tick_count == 0);
                liq_sw       <= next_liq_sw    ;   
                vpretop_sw   <= next_vpretop_sw;   
                vprebot_sw   <= next_vprebot_sw;   
                refp_sw      <= next_refp_sw   ; 
                refn_sw      <= next_refn_sw   ; 
                glb_pre_sw   <= next_glb_pre_sw;  
                fsm_state    <= FSM_WAIT_UNTIL_SAFE;
            end

        // Wait until the row_pulse tells us that it's safe to proceed to
        // the next tick. When it does, decide whether we are going to fetch
        // a new UWC or whether we are still executing the current UWC.
        FSM_WAIT_UNTIL_SAFE:
            if (row_pulse == 0) begin
                rs0   <= 0;
                rs256 <= 0;

                if (tick_count == uwc_last_tick) begin
                    pre0       <= 0; // In case a faulty UWC left it on
                    pre256     <= 0; // In case a faulty UWC left it on
                    fsm_state  <= FSM_NEXT_UWC;
                end
               
                else begin
                    tick_count <= tick_count + 1;
                    fsm_state  <= FSM_SETUP_SWITCHES;
                end
            end
    endcase
end

// These are the two states in which we fetch data from the input stream
assign axis_in_tready = (fsm_state == FSM_FETCH_1ST_UWC)
                      | (fsm_state == FSM_NEXT_UWC     );

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



endmodule