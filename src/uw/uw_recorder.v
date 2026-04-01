//=============================================================================
//                   ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 28-Mar-26  DWW     1  Initial creation
//=============================================================================

/*
     This captures the output of a userwave, collects the userwave output
     into 64-byte data-records, and writes those records to host-RAM
*/


module uw_recorder # (parameter DW=512, AW=64, IW=4)
(

    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF M_AXI, ASSOCIATED_RESET resetn" *)
    input clk,
    input resetn,

    // When this strobes high, it's time to record input data
    input           tick_stb,

    // Recordable outputs from the userwave engine
    input[ 15:0]    tick_count,
    input           liq_sw,
    input           vpretop_sw,
    input           vprebot_sw,
    input           refp_sw,
    input           refn_sw,
    input           glb_pre_sw,
    input           rs0, rs256,
    input           pre0, pre256,
    input           spi_csld,
    input           spi_sck,
    input           spi_mosi0, spi_mosi1,

    // The simulated DAC outputs are convenient for debugging
    output[127:0]    sim_dac_values_0, sim_dac_values_1,

    //==================  This is an AXI4-master interface  ===================

    // "Specify write address"              -- Master --    -- Slave --
    output reg [AW-1:0]                     M_AXI_AWADDR,
    output                                  M_AXI_AWVALID,
    output reg [7:0]                        M_AXI_AWLEN,
    output     [2:0]                        M_AXI_AWSIZE,
    output     [IW-1:0]                     M_AXI_AWID,
    output     [1:0]                        M_AXI_AWBURST,
    output                                  M_AXI_AWLOCK,
    output     [3:0]                        M_AXI_AWCACHE,
    output     [3:0]                        M_AXI_AWQOS,
    output     [2:0]                        M_AXI_AWPROT,
    input                                                   M_AXI_AWREADY,

    // "Write Data"                         -- Master --    -- Slave --
    output     [DW-1:0]                     M_AXI_WDATA,
    output     [(DW/8)-1:0]                 M_AXI_WSTRB,
    output                                  M_AXI_WVALID,
    output                                  M_AXI_WLAST,
    input                                                   M_AXI_WREADY,

    // "Send Write Response"                -- Master --    -- Slave --
    input[1:0]                                              M_AXI_BRESP,
    input[IW-1:0]                                           M_AXI_BID,
    input                                                   M_AXI_BVALID,
    output                                  M_AXI_BREADY,

    // "Specify read address"               -- Master --    -- Slave --
    output     [AW-1:0]                     M_AXI_ARADDR,
    output                                  M_AXI_ARVALID,
    output     [2:0]                        M_AXI_ARPROT,
    output                                  M_AXI_ARLOCK,
    output     [IW-1:0]                     M_AXI_ARID,
    output     [2:0]                        M_AXI_ARSIZE,
    output     [7:0]                        M_AXI_ARLEN,
    output     [1:0]                        M_AXI_ARBURST,
    output     [3:0]                        M_AXI_ARCACHE,
    output     [3:0]                        M_AXI_ARQOS,
    input                                                   M_AXI_ARREADY,

    // "Read data back to master"           -- Master --    -- Slave --
    input[DW-1:0]                                           M_AXI_RDATA,
    input[IW-1:0]                                           M_AXI_RID,
    input                                                   M_AXI_RVALID,
    input[1:0]                                              M_AXI_RRESP,
    input                                                   M_AXI_RLAST,
    output                                  M_AXI_RREADY
    //=========================================================================
);

 
//=============================================================================
// Input and output bus for the fifo that holds M_AXI AW-channel data
//=============================================================================
reg [63:0] aw_fifo_in_tdata;
reg [ 7:0] aw_fifo_in_tuser;
reg        aw_fifo_in_tvalid;
wire       aw_fifo_in_tready;

wire[63:0] aw_fifo_out_tdata;
wire[ 7:0] aw_fifo_out_tuser;
wire       aw_fifo_out_tvalid;
wire       aw_fifo_out_tready;
//=============================================================================


//=============================================================================
// Input and output bus for the fifo that holds M_AXI W-channel data
//=============================================================================
reg [511:0] w_fifo_in_tdata;
reg         w_fifo_in_tlast;
reg         w_fifo_in_tvalid;
wire        w_fifo_in_tready;

wire[511:0] w_fifo_out_tdata;
wire        w_fifo_out_tlast;
wire        w_fifo_out_tvalid;
wire        w_fifo_out_tready;
//=============================================================================

//=============================================================================
// We're not going to be reading from M_AXI
//=============================================================================
assign M_AXI_ARADDR  = 0;  
assign M_AXI_ARVALID = 0;  
assign M_AXI_ARPROT  = 0;  
assign M_AXI_ARLOCK  = 0;  
assign M_AXI_ARID    = 0;
assign M_AXI_ARSIZE  = 0;  
assign M_AXI_ARLEN   = 0; 
assign M_AXI_ARBURST = 0;   
assign M_AXI_ARCACHE = 0;
assign M_AXI_RREADY  = 0; 
//=============================================================================



//=============================================================================
// Constant values for the AW, W, and B channels
//=============================================================================
assign M_AXI_AWSIZE  = $clog2(DW/8);  
assign M_AXI_AWBURST = 1;   
assign M_AXI_AWID    = 0; 
assign M_AXI_AWLOCK  = 0;   
assign M_AXI_AWCACHE = 0;   
assign M_AXI_AWQOS   = 0; 
assign M_AXI_AWPROT  = 0;   
assign M_AXI_WDATA   = w_fifo_out_tdata;
assign M_AXI_WLAST   = w_fifo_out_tlast;
assign M_AXI_WSTRB   = -1;
assign M_AXI_BREADY  = 1;
//=============================================================================

//=============================================================================
// A 16-bit word that contains the userwave switches
//=============================================================================
wire[15:0] uw_flags = 
{
    5'b0,
    pre256,
    pre0,
    rs256,
    rs0,
    glb_pre_sw,
    refn_sw,
    refp_sw,
    vprebot_sw,
    vpretop_sw,
    liq_sw,
    1'b0        // 1 = This is the last record    
};
//=============================================================================


//=============================================================================
// This is the data that represents a state of the userwave outputs
//=============================================================================
wire[DATA_LENGTH-1:0] data = 
{
    uw_flags,          //  2 bytes
    sim_dac_values_1,  // 16 bytes
    sim_dac_values_0   // 16 bytes
};
//=============================================================================


//=============================================================================
// This is the 64-byte data record we write to the FIFO and send to host RAM
//=============================================================================
wire[511:0] record =
{
    {20{8'b0}},  // 20 bytes
    data,        // 34 bytes
    tick_count,  //  2 bytes
    timestamp    //  8 bytes
};
//=============================================================================

// If we see no userwave ticks for this many cycles, the userwave is done
localparam TICK_TIMEOUT = 16 * 256;

// This is the length in bits of the userwave data we capture
localparam DATA_LENGTH  = 34 * 8;

reg[63:0] host_buff_addr = 64'h2_0000_0000;
reg[63:0] host_buff_size = 64'h1_0000_0000;

//=============================================================================
// This state machine captures userwave outputs and writes them into a FIFO.
// TLAST is set on every 64th packet and on the final cycle of the final packet.
//=============================================================================
localparam RSM_IDLE          = 0;
localparam RSM_WAIT_FOR_TICK = 1;
localparam RSM_CAPTURE_DATA  = 2;
localparam RSM_WRITE_FINAL   = 3;
reg [ 1:0] rsm_state;
reg [63:0] host_buff_offset;
wire[63:0] last_host_addr = host_buff_size - 4096;
reg [ 7:0] beat;
reg [15:0] tick_timeout;
reg [63:0] timestamp;
reg [DATA_LENGTH-1:0] previous_data;
//-----------------------------------------------------------------------------
always @(posedge clk) begin

    // These strobe high for a single cycle at a time
     w_fifo_in_tvalid <= 0;
    aw_fifo_in_tvalid <= 0;

    // Count down the number of cycles since the last tick.
    // If this value reaches zero, we assume the recording
    // session is over.
    if (tick_timeout) tick_timeout <= tick_timeout - 1;

    if (resetn == 0) begin
        rsm_state <= RSM_IDLE;
    end

    else case(rsm_state)

        // When we see a tick come in, go start capturing data!
        RSM_IDLE:
            if (tick_stb) begin
                timestamp        <= 0;
                previous_data    <= -1;
                host_buff_offset <= 0;
                beat             <= 1;
                tick_timeout     <= TICK_TIMEOUT;
                rsm_state        <= RSM_CAPTURE_DATA;
            end

        RSM_WAIT_FOR_TICK:
            if (tick_stb) begin
                timestamp    <= timestamp + 1;
                tick_timeout <= TICK_TIMEOUT;
                if (host_buff_offset < last_host_addr) begin
                    rsm_state <= RSM_CAPTURE_DATA;
                end
            end else if (tick_timeout == 0)
                rsm_state <= RSM_WRITE_FINAL;

        // Write this record to the w_fifo.   If this is the 64th record
        // we've written to the w_fifo, write a record to the aw_fifo to
        // tell the other state-machine "hey, there's a packet here for 
        // you to send to host-RAM"
        RSM_CAPTURE_DATA:
            begin
                previous_data    <= data;
                w_fifo_in_tdata  <= record;
                w_fifo_in_tlast  <= (beat == 64);
                w_fifo_in_tvalid <= 1;

                if (beat == 64) begin
                    aw_fifo_in_tdata  <= host_buff_addr + host_buff_offset;
                    aw_fifo_in_tuser  <= beat;
                    aw_fifo_in_tvalid <= 1;
                    host_buff_offset  <= host_buff_offset + 4096;
                    beat              <= 1;
                end else begin
                    beat              <= beat + 1;
                end

                rsm_state <= RSM_WAIT_FOR_TICK;
            end

        // Here we write a final record with the "this is the last record" bit
        // (and every other bit) set.  We also write a record to the aw_fifo
        // to tell the other state machine "Send this packet to host RAM"
        RSM_WRITE_FINAL:
            begin
                w_fifo_in_tdata   <= -1;
                w_fifo_in_tlast   <= 1;
                w_fifo_in_tvalid  <= 1;

                aw_fifo_in_tdata  <= host_buff_addr + host_buff_offset;
                aw_fifo_in_tuser  <= beat;
                aw_fifo_in_tvalid <= 1;
                rsm_state         <= RSM_IDLE;
            end

    endcase

end
//=============================================================================


//=============================================================================
// This state machine reads the FIFOs and writes that data to host RAM
//=============================================================================
reg[1:0] fsm_state;
always @(posedge clk) begin

    if (resetn == 0)
        fsm_state <= 0;
    
    else case(fsm_state)

        // Wait for aw_fifo to tell us that we have a packet of data 
        // to write to host RAM.  When it does, request a write
        0:  if (aw_fifo_out_tvalid & aw_fifo_out_tready) begin
                M_AXI_AWADDR <= aw_fifo_out_tdata;
                M_AXI_AWLEN  <= aw_fifo_out_tuser - 1;
                fsm_state    <= 1;
            end

        // When that write on M_AXI_AW* is accepted, go write
        // the data from the FIFO to M_AXI_W*
        1:  if (M_AXI_AWVALID & M_AXI_AWREADY) begin
                fsm_state  <= 2;
            end

        // Keep writing data from w_fifo to the M_AXI_W* until we
        // encounter the last beat of the packet
        2:  if (M_AXI_WVALID & M_AXI_WREADY & M_AXI_WLAST) begin
                fsm_state <= 0;
            end
    endcase
end
//-----------------------------------------------------------------------------
assign aw_fifo_out_tready = (fsm_state == 0);
assign M_AXI_AWVALID      = (fsm_state == 1);
assign M_AXI_WVALID       = (fsm_state == 2) & w_fifo_out_tvalid;
assign w_fifo_out_tready  = (fsm_state == 2) & M_AXI_WREADY;
//=============================================================================


//=============================================================================
// Simulators for userwave DACs
//=============================================================================
uw_sim_ltc2656 i_dac0
(
    .clk            (clk),
    .resetn         (resetn),
    .spi_csld       (spi_csld),
    .spi_sck        (spi_sck),
    .spi_mosi       (spi_mosi0),
    .dac_output     (sim_dac_values_0),
    .internal_vref  ()
);

uw_sim_ltc2656 i_dac1
(
    .clk            (clk),
    .resetn         (resetn),
    .spi_csld       (spi_csld),
    .spi_sck        (spi_sck),
    .spi_mosi       (spi_mosi1),
    .dac_output     (sim_dac_values_1),
    .internal_vref  ()
);
//=============================================================================



//=============================================================================
// This FIFO holds host addresses and packet lengths
//=============================================================================
xpm_fifo_axis #
(
   .FIFO_DEPTH      (16),
   .TDATA_WIDTH     (64),
   .TUSER_WIDTH     (8),
   .FIFO_MEMORY_TYPE("auto"),
   .PACKET_FIFO     ("false"),
   .USE_ADV_FEATURES("0000"),
   .CDC_SYNC_STAGES (3),
   .CLOCKING_MODE   ("common_clock")
)
aw_fifo
(
     // Clock and reset
    .s_aclk         (clk   ),
    .m_aclk         (clk   ),
    .s_aresetn      (resetn),

    // This input bus of the FIFO
    .s_axis_tdata   (aw_fifo_in_tdata ),
    .s_axis_tuser   (aw_fifo_in_tuser ),
    .s_axis_tvalid  (aw_fifo_in_tvalid),
    .s_axis_tready  (aw_fifo_in_tready),

    // The output bus of the FIFO
    .m_axis_tdata   (aw_fifo_out_tdata ),
    .m_axis_tuser   (aw_fifo_out_tuser ),
    .m_axis_tvalid  (aw_fifo_out_tvalid),
    .m_axis_tready  (aw_fifo_out_tready),

    // Unused input stream signals
    .s_axis_tlast(),
    .s_axis_tdest(),
    .s_axis_tid  (),
    .s_axis_tstrb(),
    .s_axis_tkeep(),

    // Unused output stream signals
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



//=============================================================================
// This FIFO holds the recorded userwave data
//=============================================================================
xpm_fifo_axis #
(
   .FIFO_DEPTH      (128),
   .TDATA_WIDTH     (DW),
   .FIFO_MEMORY_TYPE("auto"),
   .PACKET_FIFO     ("false"),
   .USE_ADV_FEATURES("0000"),
   .CDC_SYNC_STAGES (3),
   .CLOCKING_MODE   ("common_clock")
)
w_fifo
(
     // Clock and reset
    .s_aclk         (clk   ),
    .m_aclk         (clk   ),
    .s_aresetn      (resetn),

    // This input bus of the FIFO
    .s_axis_tdata   (w_fifo_in_tdata ),
    .s_axis_tlast   (w_fifo_in_tlast ),
    .s_axis_tvalid  (w_fifo_in_tvalid),
    .s_axis_tready  (w_fifo_in_tready),

    // The output bus of the FIFO
    .m_axis_tdata   (w_fifo_out_tdata ),
    .m_axis_tlast   (w_fifo_out_tlast ),
    .m_axis_tvalid  (w_fifo_out_tvalid),
    .m_axis_tready  (w_fifo_out_tready),

    // Unused input stream signals
    .s_axis_tuser(),
    .s_axis_tdest(),
    .s_axis_tid  (),
    .s_axis_tstrb(),
    .s_axis_tkeep(),

    // Unused output stream signals
    .m_axis_tuser(),
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
