//=============================================================================
//                    ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 15-Nov-26  DWW    1  Initial
//=============================================================================

/*
    This performs the CDC for a for the metadata stream

    Input --> Slice --> CDC FIFO --> Output
*/


module uw_md_cdc # (parameter DW = 512)
(
    // The userwave clock
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axis, ASSOCIATED_RESET resetn" *)
    input   clk,
    input   resetn,

    // Input stream
    input [DW-1:0]     s_axis_tdata,
    input              s_axis_tvalid,
    output             s_axis_tready,

    // The mindy-core clock
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 mc_clk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axis" *)
    input   mc_clk,

    // Output stream
    output[DW-1:0]     m_axis_tdata,
    output             m_axis_tvalid,
    input              m_axis_tready
);


// Wires between modules
wire [DW-1:0] slice_tdata ;
wire          slice_tvalid;
wire          slice_tready;

//=============================================================================
// AXI stream register slice on the input
//=============================================================================
axis_slice #
(
    .DATA_WIDTH     (DW),
    .LAST_ENABLE    (0),
    .USER_ENABLE    (0),
    .USER_WIDTH     (1)
)
i_slice
(
    .clk          (clk),
    .rst          (~resetn),

    .s_axis_tdata (s_axis_tdata ),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tready(s_axis_tready),
    .s_axis_tkeep (0),
    .s_axis_tlast (0),
    .s_axis_tuser (0),
    .s_axis_tid   (0),
    .s_axis_tdest (0),

    .m_axis_tdata (slice_tdata ),
    .m_axis_tvalid(slice_tvalid),
    .m_axis_tready(slice_tready),
    .m_axis_tkeep (),
    .m_axis_tlast (),
    .m_axis_tuser (),
    .m_axis_tid   (),
    .m_axis_tdest ()
);
//=============================================================================






//=============================================================================
// This is the clock-crossing FIFO
//=============================================================================
xpm_fifo_axis #
(
   .TDATA_WIDTH     (DW),
   .FIFO_DEPTH      (16),
   .FIFO_MEMORY_TYPE("auto"),
   .PACKET_FIFO     ("false"),
   .USE_ADV_FEATURES("0000"),
   .CLOCKING_MODE   ("independent_clock")
)
i_cdc_fifo
(
    // Clock and reset
    .s_aclk   (clk   ),
    .m_aclk   (mc_clk),
    .s_aresetn(resetn),

    // The input bus of the FIFO
    .s_axis_tdata (slice_tdata ),
    .s_axis_tvalid(slice_tvalid),
    .s_axis_tready(slice_tready),

    // The output bus of the FIFO
    .m_axis_tdata (m_axis_tdata),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tready(m_axis_tready),

    // Unused input stream signals
    .s_axis_tkeep(),
    .s_axis_tlast(),
    .s_axis_tuser(),
    .s_axis_tdest(),
    .s_axis_tid  (),
    .s_axis_tstrb(),

    // Unused output stream signals
    .m_axis_tkeep(),
    .m_axis_tlast(),
    .m_axis_tuser(),
    .m_axis_tdest(),
    .m_axis_tid  (),
    .m_axis_tstrb(),

    // Other unused signals
    .almost_empty_axis (),
    .almost_full_axis  (),
    .dbiterr_axis      (),
    .prog_empty_axis   (),
    .prog_full_axis    (),
    .rd_data_count_axis(),
    .sbiterr_axis      (),
    .wr_data_count_axis(),
    .injectdbiterr_axis(),
    .injectsbiterr_axis()
);
//=============================================================================


endmodule
