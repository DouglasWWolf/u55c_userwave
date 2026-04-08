//=============================================================================
//                   ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 28-Mar-26  DWW     1  Initial creation
//=============================================================================

/*

    Converts the incoming pa_sync signal to an output waveform.

    In the perfect case:

        Our output row_pulse will rise two clock cycles prior to the
        rise of the pa_sync input pin.

    Because the timing of "pa_sync" can hypothetically jitter around by 1 or 2
    clock cycles, we will not always meet the timing of our perfect case, but
    we will be very close.  (In practice, pa_sync doesn't appear to jitter at
    all, but it is safer to assume that it occasionally does)

    Our output "row_pulse" falls exactly 128 clock cycles after it rises.  This
    signals the downstream logic that it is safe to set up new values for
    rs0, rs256, pre0, and pre256

    The downstream userwave-engine logic:
      (1) Updates rs0 and rs256 well before the rising edge of row_pulse
      (2) Updates switch and DAC values on the rising edge of row_pulse
      (3) De-asserts rs0 and rs256 on the falling edge of row_pulse
      (4) After de-asserting rs0/rs256, it sets up for the next pulse

*/

module uw_pulse # (parameter PERIOD = 256, EXTRA_FLOPS = 2)
(
    input  clk,
    input  pa_sync,

    output reg row_pulse
);

// This is "pa_sync" synchronized to our clock
wire pa_sync_sync;

// We'll adjust counter such that pa_sync happens on or near this count
localparam PULSE_POINT = PERIOD / 2;

// These are the upper and lower bounds of our hysteresis
localparam LB = PULSE_POINT - 2;
localparam UB = PULSE_POINT + 2;

// This is the number of cycles before the rising edge of "pa_sync_sync"
// that we want to drive row_pulse high.  The goal is for "row_pulse" to 
// fire 2 clock-cycles prior to "pa_sync" (or as close as we can)
localparam EARLY = 2            // We fire row_pulse 2 clock before pa_sync
                 + 2            // Account for the 2 flops in the synchronizer
                 + EXTRA_FLOPS; // Account for flops between our output and the pin

// This the the value of the counter when row_pulse rises
localparam RISING_COUNT = PULSE_POINT - EARLY;

// This is the value of the counter when row_pulse falls
localparam FALLING_COUNT = RISING_COUNT + PERIOD / 2;

//=============================================================================
// Perform edge detection on pa_sync_sync
//=============================================================================
reg prior_pa_sync_sync;
always @(posedge clk) prior_pa_sync_sync <= pa_sync_sync;
wire rising_pa_sync = (prior_pa_sync_sync == 0) & (pa_sync_sync == 1);
//=============================================================================


//=============================================================================
// This state machine attempts to ensure that row_pulse rises as closely as
// possible to two clock cycles before the rising edge of pa_sync
//=============================================================================
reg[$clog2(PERIOD)-1:0] counter;
reg                     resync;
//-----------------------------------------------------------------------------
always @(posedge clk) begin

    // The timing of rising edge of pa_sync is allowed to jitter around
    // between our upper and lower bounds.   If it exceeds those bounds,
    // we adjust our counter such that the rising edge happens exactly
    // half-way between our lower and upper bounds
    if (rising_pa_sync & (counter < LB || counter > UB)) begin
        counter <= PULSE_POINT + 1;
        resync  <= 1;
    end else
        counter <= counter + 1;

    // We want "row_pulse" go high as close as possible to two cycles prior
    // to the rising edge of "pa_sync".  If the counter/ was recently adjusted,
    // we suppress this pulse.
    if (counter == RISING_COUNT - 1) begin
        row_pulse <= !resync;
        resync   <= 0;
    end

    // The pulse ends 1/2 period after it rises
    if (counter == FALLING_COUNT - 1)
        row_pulse <= 0;

end
//=============================================================================


//=============================================================================
// Synchronize "pa_sync" into "pa_sync_sync"
//=============================================================================
xpm_cdc_single #
(
    .DEST_SYNC_FF  (2),
    .INIT_SYNC_FF  (0),
    .SIM_ASSERT_CHK(0),
    .SRC_INPUT_REG (0)
)
sync_pa_sync
(
    .src_clk (            ),
    .src_in  (pa_sync     ),
    .dest_clk(clk         ),
    .dest_out(pa_sync_sync)
);
//=============================================================================



endmodule