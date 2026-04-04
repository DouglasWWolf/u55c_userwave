//=============================================================================
//                   ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 28-Mar-26  DWW     1  Initial creation
//=============================================================================

/*
    This module provides an output signal that is delayed by some number
    of clock-cycles
*/

module uw_delay #(parameter WIDTH = 1, DELAY = 2, RESET_ACTIVE = 1)
(
    input clk,

    input reset,

    input  [WIDTH-1:0] signal_in,

    output [WIDTH-1:0] signal_out
);


genvar i;

// This is the last index in the chain
localparam LAST_INDEX = DELAY - 1;

// This is the chain of flip-flops, one chain per signal bit
(* dont_touch = "true" *) reg[WIDTH-1:0] flop[0:LAST_INDEX];

// Our output is the last flop in the chain
assign signal_out = flop[LAST_INDEX];

//=============================================================================
// Feed our input signal to the first flop in the chain
//=============================================================================
always @(posedge clk) begin
    flop[0] <= (reset == !RESET_ACTIVE) ? signal_in : 0;
end
//=============================================================================


//=============================================================================
// If two or more extra clock-cycles of delay, copy each flop to the next one
//=============================================================================
if (DELAY > 1) begin
    for (i=1; i<DELAY; i=i+1) begin
        always @(posedge clk) begin
            flop[i] <= (reset == !RESET_ACTIVE) ? flop[i-1] : 0;
        end
    end
end
//=============================================================================


endmodule

