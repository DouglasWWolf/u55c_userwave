//=============================================================================
//                   ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 28-Mar-26  DWW     1  Initial creation
//=============================================================================

/*
    This provides extra flip-flops between the output of the userwave engine
    and the physical pins of the FPGA.  We do this because the logic for the
    userwave engine may be in the center of the FPGA fabric, and its easier
    to close timing if we allow a couple of clock cycles for those signals
    to make it to the pins at the edge of the FPGA
*/

module uw_extra_flops # (parameter EXTRA_FLOPS = 2)
(
    input        clk,
    input        resetn,

    input        liq_sw,
    input        vpretop_sw,
    input        vprebot_sw,
    input        refp_sw,
    input        refn_sw,
    input        glb_pre_sw,
    input        pre0,
    input        pre256,
    input        rs0,
    input        rs256,
    input        spi_csld,
    input        spi_sck,
    input        spi_mosi0,
    input        spi_mosi1,

    output       pin_liq_sw,
    output       pin_vpretop_sw,
    output       pin_vprebot_sw,
    output       pin_refp_sw,
    output       pin_refn_sw,
    output       pin_glb_pre_sw,
    output       pin_pre0,
    output       pin_pre256,
    output       pin_rs0,
    output       pin_rs256,
    output       pin_spi_csld,
    output       pin_spi_sck,
    output       pin_spi_mosi0,
    output       pin_spi_mosi1
);
genvar i;

// This is the number of input signal bits we have
localparam SIGNAL_COUNT = 14;

// This is the last index in the chain
localparam LAST_INDEX = EXTRA_FLOPS - 1;

// This is the chain of flip-flops, one chain per signal bit
(* dont_touch = "true" *) reg[SIGNAL_COUNT-1:0] flop[0:LAST_INDEX];

//=============================================================================
// Build a word consisting of all the input signals
//=============================================================================
wire[SIGNAL_COUNT-1:0] input_word = 
{
    liq_sw,
    vpretop_sw,
    vprebot_sw,
    refp_sw,
    refn_sw,
    glb_pre_sw,
    pre0,
    pre256,
    rs0,
    rs256,
    spi_csld,
    spi_sck,
    spi_mosi0,
    spi_mosi1
};
//=============================================================================


//=============================================================================
// The last flop in the chain is our output signals
//=============================================================================
assign
{
    pin_liq_sw,
    pin_vpretop_sw,
    pin_vprebot_sw,
    pin_refp_sw,
    pin_refn_sw,
    pin_glb_pre_sw,
    pin_pre0,
    pin_pre256,
    pin_rs0,
    pin_rs256,
    pin_spi_csld,
    pin_spi_sck,
    pin_spi_mosi0,
    pin_spi_mosi1
} = flop[LAST_INDEX];
//=============================================================================



//=============================================================================
// Feed our input pins to the first flop in the chain
//=============================================================================
always @(posedge clk) begin
    flop[0] <= (resetn == 1) ? input_word : 0;
end
//=============================================================================


//=============================================================================
// If there are two or more extra flops, copy each flop to the next one
//=============================================================================
if (EXTRA_FLOPS > 1) begin
    for (i=1; i<EXTRA_FLOPS; i=i+1) begin
        always @(posedge clk) begin
            flop[i] <= (resetn == 1) ? flop[i-1] : 0;
        end
    end
end
//=============================================================================


endmodule