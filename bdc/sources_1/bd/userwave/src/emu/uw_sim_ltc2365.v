//====================================================================================
//                        ------->  Revision History  <------
//====================================================================================
//
//   Date     Who   Ver  Changes
//====================================================================================
// 18-Nov-26  DWW     1  Initial creation
//====================================================================================

/*
    This module emulates an LTC2365 ADC.

    The LTC2365 requires 14 clock cycles for a conversion, but clocks data
    on only the first 13 falling edges of SCK.  The first bit of the 13 is
    a dummy bit, which we throw away.
*/


module uw_sim_ltc2365 
(
    input clk,

    input        sck,
    input        csn,
    output reg   sdo = 0
);

reg prior_csn = 1;
reg prior_sck = 0;

// This is the ADC value that we will return to the master.
reg[11:0] adc_value = 1;

// This is a shift register
reg[12:0] shifter;

// Always keep track of the prior state of chip select.
always @(posedge clk) begin
    prior_sck <= sck; 
    prior_csn <= csn;
end

always @(posedge clk) begin

    // On the falling edge of chip-select, copy our ADC value into the shifter.
    if (csn == 0 && prior_csn == 1) begin
        shifter   <= {1'b0, adc_value};
        adc_value <= adc_value + 1;
    end

    // On the falling edge of the clock, shift out the data.
    if (sck == 0 && prior_sck == 1) begin
        sdo     <= shifter[12];
        shifter <= {shifter[11:0], 1'b0};
    end
    
end

endmodule
