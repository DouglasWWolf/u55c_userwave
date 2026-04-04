//=============================================================================
//                   ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 28-Mar-26  DWW     1  Initial creation
//=============================================================================

/*
    This fetches data from host-RAM and feeds it to the userwave-engine

    Abbreviations in this code:
       uw         = Userwave
       uwc or UWC = Userwave Command

    Userwave commands are buffered in host RAM.   The size of that buffer
    (measured in the number of 64-byte userwave commands that it can hold)
    must be a power of 2.  The buffer is assumed to be a circular buffer.

    The design of this module is such that we never fetch UWC from host
    RAM unless we know that we have room to store it in our output FIFO
*/

module uw_fetcher # (parameter DW = 512, AW=64, IW = 2)
(

    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF M_AXI:axis_out" *)
    input   clk,

    // When this is high, it is effectively a reset
    (* direct_reset = "true" *) input suspend,

    // This will be high for at least one clock cycle when there is 
    // sufficient data in the FIFO that the engine can begin running
    // the userwave without danger of underflow
    output  fifo_ready,

    // The address in host-RAM where the userwave commands reside
    input[63:0] uw_host_addr,

    // Size (in userwave commands) of the userwave-buffer in host-RAM
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // >>>>> Size must be a power of two! <<<<<
    // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    input[31:0] uw_host_capacity,

    // The number the total number of userwave commands that userwave-feeder
    // software has stuffed into host RAM
    input[63:0] uwc_provided,

    // The amount of free space (in userwave commands) in the host RAM buffer
    output[31:0] uw_host_free,

    // This will strobe high if an alignment error occurs
    output reg alignment_err_stb,

    //==================  This is an AXI4-master interface  ===================

    // "Specify write address"              -- Master --    -- Slave --
    output     [AW-1:0]                     M_AXI_AWADDR,
    output                                  M_AXI_AWVALID,
    output     [7:0]                        M_AXI_AWLEN,
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
    output reg [AW-1:0]                     M_AXI_ARADDR,
    output                                  M_AXI_ARVALID,
    output     [2:0]                        M_AXI_ARPROT,
    output                                  M_AXI_ARLOCK,
    output     [IW-1:0]                     M_AXI_ARID,
    output     [2:0]                        M_AXI_ARSIZE,
    output reg [7:0]                        M_AXI_ARLEN,
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
    output                                  M_AXI_RREADY,
    //=========================================================================


    //=========================================================================
    // This is the stream of userwave commands that gets fed to the userwave
    // engine
    //=========================================================================
    output[511:0]   axis_out_tdata,
    output          axis_out_tvalid,
    input           axis_out_tready
    //=========================================================================

);

// A userwave command is 64 bytes long
localparam UWC_BYTES = 64;

// There are up to 64 commands in a UWC "block".   Note that this means
// a block is 4096 bytes, which is a very efficient block size for AXI
// reads from host-RAM
localparam UWC_BLOCK = 64;

// Our output FIFO can hold two entire blocks of UWCs
localparam FIFO_DEPTH = 128;

//=============================================================================
// We're not using the write-side of the M_AXI bus
//=============================================================================
assign M_AXI_AWADDR  = 0;   
assign M_AXI_AWVALID = 0;    
assign M_AXI_AWLEN   = 0;    
assign M_AXI_AWSIZE  = 0;
assign M_AXI_AWID    = 0;   
assign M_AXI_AWBURST = 0;        
assign M_AXI_AWLOCK  = 0;      
assign M_AXI_AWCACHE = 0;         
assign M_AXI_AWQOS   = 0;     
assign M_AXI_AWPROT  = 0;       

assign M_AXI_WDATA   = 0;  
assign M_AXI_WSTRB   = 0;  
assign M_AXI_WVALID  = 0;   
assign M_AXI_WLAST   = 0;  

assign M_AXI_BVALID  = 0;
//=============================================================================


//=============================================================================
// The "AR channel" fields of M_AXI that never change
//=============================================================================
assign M_AXI_ARSIZE  = $clog2(DW/8);   
assign M_AXI_ARBURST = 1;  
assign M_AXI_ARPROT  = 0; 
assign M_AXI_ARLOCK  = 0;  
assign M_AXI_ARID    = 0; 
assign M_AXI_ARCACHE = 0;   
assign M_AXI_ARQOS   = 0; 
//=============================================================================



//=============================================================================
// Input and output bus to/from our FIFO
//=============================================================================
reg [511:0] fifo_in_tdata;
reg         fifo_in_tvalid;
wire        fifo_in_tready;

wire[511:0] fifo_out_tdata;
wire        fifo_out_tvalid;
wire        fifo_out_tready;

// Wire the output side of the FIFO to the "axis_out" stream
assign axis_out_tdata  = fifo_out_tdata;
assign axis_out_tvalid = fifo_out_tvalid;
assign fifo_out_tready = axis_out_tready;
//=============================================================================


// The number of entries in our FIFO
reg[15:0] fifo_entries;

// The total number of userwave commands we have fetched from host RAM and
// stuffed into our FIFO
reg[63:0] uwc_fetched;

// Since the size of userwave buffer in host RAM is always a power of 2, 
// we can create a bit-mask by substracting 1
wire[63:0] uwc_mask = uw_host_capacity - 1;

// How many unfetched commands are in the buffer?
wire[31:0] uwc_unfetched = uwc_provided - uwc_fetched;

// Compute the number of free UWC slots in the host-RAM buffer
assign uw_host_free = uw_host_capacity - uwc_unfetched;

//=============================================================================
// This is the main state machine for this module.   When there is enough
// room in the output FIFO for an entire block of UWC, we fetch a block
// (or however many UWC remain in the userwave) from host-RAM
//=============================================================================
localparam FSM_LOOP            = 0;
localparam FSM_FETCH_BLOCK     = 1;
localparam FSM_WAIT_DATA       = 2;
reg[1:0]   fsm_state;
//-----------------------------------------------------------------------------
always @(posedge clk) begin

    // These strobe high for a single cycle at a time
    fifo_in_tvalid    <= 0;
    alignment_err_stb <= 0;

    if (suspend) begin
        uwc_fetched <= 0;
        fsm_state   <= FSM_LOOP;
    end

    else case(fsm_state)

        FSM_LOOP:

            // If there is room for an entire block of UWC in the FIFO...
            if (fifo_entries <= (FIFO_DEPTH - UWC_BLOCK)) begin    

                // Determine where we're going to read the next burst of data from
                M_AXI_ARADDR <= uw_host_addr + (uwc_fetched & uwc_mask) * UWC_BYTES;

                // If there are enough UWC in the host-RAM buffer to fill
                // an entire block, fetch a whole block
                if (uwc_unfetched >= UWC_BLOCK) begin
                    M_AXI_ARLEN  <= UWC_BLOCK - 1;
                    fsm_state    <= FSM_FETCH_BLOCK;
                end

                // If the host-RAM buffer contains the very last unfetched UWC,
                // fetch all the UWC that remain in the userwave
                else if (uwc_unfetched) begin
                    M_AXI_ARLEN <= uwc_unfetched - 1;
                    fsm_state   <= FSM_FETCH_BLOCK;
                end
            end

        // Issue the read on the AR channel
        FSM_FETCH_BLOCK:
            if (M_AXI_ARVALID & M_AXI_ARREADY) begin
                alignment_err_stb <= (M_AXI_ARADDR[11:0] != 0);
                fsm_state         <= FSM_WAIT_DATA;
            end

        // Wait for the entire packet of data to arrive.  It's safe to blindly
        // write to the FIFO without worrying about back-pressure because we
        // only initiate a write into the FIFO when we know it has room for 
        // our entire incoming packet
        FSM_WAIT_DATA:
            if (M_AXI_RVALID & M_AXI_RREADY) begin
                fifo_in_tdata  <= M_AXI_RDATA;
                fifo_in_tvalid <= 1;        
                if (M_AXI_RLAST) begin
                    uwc_fetched <= uwc_fetched + M_AXI_ARLEN + 1;
                    fsm_state   <= FSM_LOOP;
                end
            end

      endcase
end

// M_AXI_AR* is valid when we're issuing a read-request
assign M_AXI_ARVALID = (fsm_state == FSM_FETCH_BLOCK);

// We're always ready to receive data on M_AXI
assign M_AXI_RREADY  = 1;

//=============================================================================
// Tell the engine when the FIFO has enough data to begin processing
//=============================================================================
reg fifo_loaded;
//-----------------------------------------------------------------------------
always @(posedge clk) begin
    if (suspend)
        fifo_loaded <= 0;
    else if (uwc_provided && !fifo_loaded) begin
        fifo_loaded <= (uwc_fetched == uwc_provided )
                     | (uwc_fetched >= UWC_BLOCK * 2);
    end
end
//=============================================================================

//=============================================================================
// "fifo_ready" is "fifo_loaded" but delayed by two clock-cycles.
// We do this so that the by the time the userwave engine sees this signal,
// the FIFO entries have had a chance to percolate through the FIFO and
// are ready for fetching by the engine
//=============================================================================
uw_delay # (.WIDTH(1), .DELAY(2), .RESET_ACTIVE(1)) i_delay
(
    .clk        (clk),
    .reset      (suspend),
    .signal_in  (fifo_loaded),
    .signal_out (fifo_ready)
);
//=============================================================================


//=============================================================================
// Keep track of how many entries are in the FIFO
//=============================================================================
wire fifo_in =  (fifo_in_tvalid  & fifo_in_tready ); 
wire fifo_out = (fifo_out_tvalid & fifo_out_tready);
always @(posedge clk) begin
    if (suspend)
        fifo_entries <= 0;
    else
        fifo_entries <= fifo_entries + fifo_in - fifo_out;
end
//=============================================================================


//=============================================================================
// This is our output FIFO of userwave commands that feed the userwave engine
//=============================================================================
xpm_fifo_axis #
(
   .FIFO_DEPTH      (FIFO_DEPTH),
   .TDATA_WIDTH     (UWC_BYTES * 8),
   .FIFO_MEMORY_TYPE("auto"),
   .PACKET_FIFO     ("false"),
   .USE_ADV_FEATURES("0000"),
   .CDC_SYNC_STAGES (3),
   .CLOCKING_MODE   ("common_clock")
)
output_fifo
(
     // Clock and reset
    .s_aclk   (clk     ),
    .m_aclk   (clk     ),
    .s_aresetn(!suspend),

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