//====================================================================================
//                        ------->  Revision History  <------
//====================================================================================
//
//   Date     Who   Ver  Changes
//====================================================================================
// 18-Nov-26  DWW     1  Initial creation
//====================================================================================

/*
    When triggered, this module:
       (1) Resets the output FIFO
       (2) Captures the number of LIQI samples defined in "max_samples"
       (3) Stuffs each sample into a FIFO

    When writing samples to the FIFO, we intentionally do not check for signal
    "fifo_in_tready".   Instead, if the FIFO is not ready to accept new data,
    the "fifo_overflow" flag will be asserted.
*/
module uw_liqi_capture # (parameter FIFO_DEPTH = 8192)
(
    input clk,
    input resetn,

    input [11:0] liqi_adc,
    input        liqi_valid_stb,
    input        trigger_stb,
    input [31:0] max_samples,

    // The FIFO output interface
    output [15:0] fifo_out_tdata,
    output        fifo_out_tvalid,
    input         fifo_out_tready,

    // The number of samples in the FIFO
    output reg [31:0] fifo_count,
    
    // This is high when FIFO overflow detected
    output reg        fifo_overflow,

    // When this is high, the FIFO overflow flag is cleared.
    input             clear_ovr_stb,

    // Always contains the most recent LIQI ADC value.
    output reg [11:0] liqi_out   
);


// The input interface to the FIFO
reg[15:0] fifo_in_tdata;
reg       fifo_in_tvalid;
wire      fifo_in_tready;

//=============================================================================
// liqi_out always holds the most recent liqi ADC value
//=============================================================================
always @(posedge clk) begin
    if (resetn == 0)
        liqi_out <= 0;
    else if (liqi_valid_stb)
        liqi_out <= liqi_adc;
end
//=============================================================================


//=============================================================================
// The main state machine - When triggered, we reset the FIFO and capture
// "max_samples" samples of LIQI data.
//=============================================================================
reg[ 1:0] fsm_state;
reg[31:0] sample_count;
reg       fifo_resetn;
reg[ 5:0] delay;
//-----------------------------------------------------------------------------
always @(posedge clk) begin

    fifo_in_tvalid <= 0;

    if (resetn == 0) begin
        fsm_state   <= 0;
        fifo_resetn <= 0;
    end

    else case(fsm_state)

        // Wait for the FIFO to come out of reset
        1:  if (delay == 0) begin
                sample_count <= 1;
                fifo_resetn  <= 1;
                if (fifo_in_tready)
                    fsm_state <= (max_samples == 0) ? 0 : 2;
            end

        // On every new incoming LIQI sample, push it into the FIFO.
        // When we reach the maximum number of samples, go back to
        // waiting for a trigger.
        2:  if (liqi_valid_stb) begin
                fifo_in_tdata  <= {4'b0,liqi_adc};
                fifo_in_tvalid <= 1;
                if (sample_count < max_samples)
                    sample_count <= sample_count + 1;
                else
                    fsm_state    <= 0;
            end

        // In any other state we do nothing at all
        default: fsm_state <= 0;

    endcase

    // We allow the state-machine to be retriggered at any point
    if (resetn == 1 && trigger_stb) begin
        fifo_resetn    <= 0;
        delay          <= 16;
        fsm_state      <= 1;
        fifo_in_tvalid <= 0;
    end else if (delay)
        delay <= delay - 1;

end
//=============================================================================


//=============================================================================
// Keep track of the occupancy of the FIFO
//=============================================================================
wire data_in  = (fifo_in_tvalid  & fifo_in_tready);
wire data_out = (fifo_out_tvalid & fifo_out_tready);
//-----------------------------------------------------------------------------
always @(posedge clk) begin
    if (fifo_resetn == 0)
        fifo_count <= 0;
    else begin
        fifo_count <= fifo_count + data_in - data_out;
    end
end
//=============================================================================


//=============================================================================
// Manage the "fifo_overflow" flag
//=============================================================================
always @(posedge clk) begin
    if (resetn == 0)
        fifo_overflow <= 0;
    else if (clear_ovr_stb)
        fifo_overflow <= 0;
    else if (fifo_in_tvalid & ~fifo_in_tready)
        fifo_overflow <= 1;
end
//=============================================================================


//=============================================================================
// This FIFO holds samples from the LIQI ADC
//=============================================================================
xpm_fifo_axis #
(
   .FIFO_DEPTH      (FIFO_DEPTH),
   .TDATA_WIDTH     (16),
   .FIFO_MEMORY_TYPE("auto"),
   .PACKET_FIFO     ("false"),
   .USE_ADV_FEATURES("0000"),
   .CLOCKING_MODE   ("common_clock")
)
i_liqi_fifo
(
     // Clock and reset
    .s_aclk   (clk        ),
    .m_aclk   (clk        ),
    .s_aresetn(fifo_resetn),

    // This input bus of the FIFO
    .s_axis_tdata (fifo_in_tdata ),
    .s_axis_tvalid(fifo_in_tvalid),
    .s_axis_tready(fifo_in_tready),

    // The output bus of the FIFO
    .m_axis_tdata (fifo_out_tdata ),
    .m_axis_tvalid(fifo_out_tvalid),
    .m_axis_tready(fifo_out_tready),

    // Unused input stream signals
    .s_axis_tuser(),
    .s_axis_tlast(),
    .s_axis_tdest(),
    .s_axis_tid  (),
    .s_axis_tstrb(),
    .s_axis_tkeep(),

    // Unused output stream signals
    .m_axis_tuser(),
    .m_axis_tlast(),
    .m_axis_tdest(),
    .m_axis_tid  (),
    .m_axis_tstrb(),
    .m_axis_tkeep(),

    // Other unused signals
    .almost_empty_axis(),
    .almost_full_axis(),
    .dbiterr_axis(),
    .prog_empty_axis(),
    .prog_full_axis(),
    .rd_data_count_axis(),
    .sbiterr_axis(),
    .wr_data_count_axis(),
    .injectdbiterr_axis(),
    .injectsbiterr_axis()
);
//=============================================================================


endmodule