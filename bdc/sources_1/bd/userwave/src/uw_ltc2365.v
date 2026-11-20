//====================================================================================
//                        ------->  Revision History  <------
//====================================================================================
//
//   Date     Who   Ver  Changes
//====================================================================================
// 18-Nov-26  DWW     1  Initial creation
//====================================================================================

/*
    This module drives an LTC2365 ADC.  This is a simple 1 channel ADC.

    In accordance with the LTC2365 datasheet:
      (1) We intentionally leave SCK high at the end of a conversion.

      (2) We intentionally shift 13 bits into the 12-bit "shifter".  We only need
          the last 12 bits of the 13 bits that we shift in.

      (3) We intentionally do not clock in a bit on the 14th rising edge of SCK.

      (4) Do not clock this module any faster than 200 MHz, or various timing
          requirements of the ADC may be violated
*/


module uw_ltc2365 # (parameter HALF_SCK=10, FREQ = 192000000, INIT_DELAY = 10000)
(
    input clk,

    output reg        sck = 1,
    output reg        csn = 1,
    input             sdo,
    input      [15:0] sample_period_us,
    output reg [11:0] adc_value = 0,
    output reg        sample_valid_stb = 0 
);


// The number of clocks per microsecond
localparam CLOCKS_PER_USEC = FREQ / 1000000;

// The number of synchronization flip-flops on "sdo"
localparam SYNC_FLOPS = 2;

//====================================================================================
// The "sample_period_us" input port is in microseconds.  Convert that to clock-
// cycles.  "sample_period_us" must never be less than 2.
//====================================================================================
reg[31:0] sample_period_clks;
//------------------------------------------------------------------------------------
always @(posedge clk) begin
    if (sample_period_us < 2)
        sample_period_clks <= 2 * CLOCKS_PER_USEC;
    else
        sample_period_clks <= sample_period_us * CLOCKS_PER_USEC;
end
//====================================================================================


// This is port "sdo", synchronized into the "clk" domain. 
wire sync_sdo;

localparam FSM_INIT       = 0;
localparam FSM_START_CONV = 1;
localparam FSM_WAIT_T2    = 2;
localparam FSM_BIT_LOOP   = 3;
localparam FSM_FINAL      = 4;
reg[ 2:0] fsm_state = FSM_INIT;

reg[15:0] delay;
reg[31:0] sampling_timer;
reg[11:0] shifter;
reg[ 3:0] sck_num;
reg[ 7:0] sample_sdo_timer = 0;

always @(posedge clk) begin
    
    // This strobes high for exactly 1 clock cycle
    sample_valid_stb <= 0;

    // Always count the sample period timer down to zero
    if (sampling_timer) sampling_timer <= sampling_timer - 1;

    // Always count down this delay timer to zero
    if (delay) delay <= delay - 1;

    // We sample the sync'd sdo input when this timer == 1
    if (sample_sdo_timer) sample_sdo_timer <= sample_sdo_timer - 1;

    case(fsm_state)

        // We wait a moment before beginning the conversion loop to 
        // ensure that "sample_period_clks" contains a valid value
        FSM_INIT:
            begin
                sck            <= 1;
                csn            <= 1;
                sampling_timer <= INIT_DELAY;
                fsm_state      <= FSM_START_CONV;
            end

        // Here we start a conversion
        FSM_START_CONV:
            if (sampling_timer == 0) begin
                csn            <= 0;
                sck_num        <= 1;
                sampling_timer <= sample_period_clks - 1;
                delay          <= HALF_SCK - 1;
                fsm_state      <= FSM_WAIT_T2;
            end

        // Wait for 1 half of an SPI clk, then lower SCK
        FSM_WAIT_T2:
            if (delay == 0) begin
                sck       <= 0;
                delay     <= HALF_SCK - 1;
                fsm_state <= FSM_BIT_LOOP;      
            end

        // Clock in 13-bits of data.  Because we're clocking into a 12-bit
        // wide shifter, the first bit we clock in is intentionally thrown away
        FSM_BIT_LOOP:
            if (delay == 0) begin

                // If SCK is low and about to go high...
                if (sck == 0) begin
                    if (sck_num < 14) begin
                        sample_sdo_timer <= SYNC_FLOPS + 1;
                        sck_num          <= sck_num + 1;
                    end
                    else begin
                        adc_value        <= shifter;
                        sample_valid_stb <= 1;
                        fsm_state        <= FSM_FINAL;
                    end 
                    sck <= 1;
                end 

                // If SCK is high and about to go low...
                else begin
                    sck <= 0;
                end                

                // And wait for the next half-SCK period
                delay <= HALF_SCK - 1;
              end

        // Wait for one HALF_SCK time, then drive chip-select high
        FSM_FINAL:
            if (delay == 0) begin
                csn <= 1;
                fsm_state <= FSM_START_CONV;
            end

        default:
            fsm_state <= FSM_INIT;

    endcase
end

//=============================================================================


//=============================================================================
// We read the sdo pin a couple of clock cycles after the rising edge of sck
//
// We do this so that we are reading a value of "sdo" that entered the 
// synchronizer *after* the rising edge of sck
//=============================================================================
always @(posedge clk) begin
    if (sample_sdo_timer == 1)
        shifter <= {shifter[10:0], sync_sdo};
end
//=============================================================================


//=============================================================================
// Synchronize "sdo" into "sync_sdo"
//=============================================================================
xpm_cdc_single #
(
    .DEST_SYNC_FF  (SYNC_FLOPS),
    .INIT_SYNC_FF  (0),
    .SIM_ASSERT_CHK(0),
    .SRC_INPUT_REG (0)
)
i_sync_sdo
(
    .src_clk (1'b0    ),
    .src_in  (sdo     ),
    .dest_clk(clk     ),
    .dest_out(sync_sdo)
);
//=============================================================================




endmodule
