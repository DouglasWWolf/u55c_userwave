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
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF M_AXI:axis_out, ASSOCIATED_RESET resetn" *)
    input   clk,
    input   resetn,

    // When this strobes high, we start fetching userwave commands from 
    // host-RAM, and notify the userwave engine that it's time to start
    input   start_stb,

    // This will be high when this module isn't idle
    output  busy,

    // The address in host-RAM where the userwave commands reside
    input[63:0] uw_host_addr,

    // Size (in userwave commands) of the userwave-buffer in host-RAM
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // >>>>> Size must be a power of two! <<<<<
    // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    input[31:0] uw_host_capacity,

    // The total number of commands in the entire userwave
    input[31:0] uwc_total,

    // The number the total number of userwave commands that userwave-feeder
    // software has stuffed into host RAM
    input[31:0] uwc_provided,

    // The total number of userwave commands we have fetched from host RAM and
    // stuffed into our FIFO
    output reg[31:0] uwc_fetched,

    // The amount of free space (in userwave commands) in the host RAM buffer
    output[31:0] uw_host_free,

    // When this strobes high, the userwave engine should start
    output reg start_engine_stb,

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
wire        fifi_out_tready;

// Wire the output side of the FIFO to the "axis_out" stream
assign axis_out_tdata  = fifo_out_tdata;
assign axis_out_tvalid = fifo_out_tvalid;
assign fifo_out_tready = axis_out_tready;
//=============================================================================


//=============================================================================
// This state machine places the FIFO in reset when "fifo_resetn_stb" is 
// strobed high (or when resetn is asserted).
//
// When the reset process is complete, fifo_resetn_complete goes high
//=============================================================================
reg        fifo_resetn_stb;
//-----------------------------------------------------------------------------
reg[6:0]   fifo_resetn_counter;
localparam FIFO_RESET_CYCLES = 64;

always @(posedge clk) begin
    if (fifo_resetn_stb || resetn == 0)
        fifo_resetn_counter <= FIFO_RESET_CYCLES;

    else if (fifo_resetn_counter)
        fifo_resetn_counter <= fifo_resetn_counter - 1;
end

wire fifo_resetn = (fifo_resetn_stb == 0)
                 & (resetn == 1)
                 & (fifo_resetn_counter < 10);

wire fifo_resetn_complete = (fifo_resetn == 1) & (fifo_resetn_counter == 0);
//=============================================================================



//=============================================================================
// Keep track of how many entries are in the FIFO
//=============================================================================
reg [15:0] fifo_entries;
//-----------------------------------------------------------------------------
wire[ 1:0] fifo_activity;
assign fifo_activity[0] = (fifo_in_tvalid  & fifo_in_tready ); // Data in to the FIFO
assign fifo_activity[1] = (fifo_out_tvalid & fifo_out_tready); // Data out of the FIFO
always @(posedge clk) begin

    if (fifo_resetn == 0) begin
        fifo_entries <= 0;
    end

    else case (fifo_activity)
        2'b00:  fifo_entries <= fifo_entries;
        2'b01:  fifo_entries <= fifo_entries + 1;
        2'b10:  fifo_entries <= fifo_entries - 1;
        2'b11:  fifo_entries <= fifo_entries;
    endcase
end
//=============================================================================


// Since the size of userwave buffer in host RAM is always a power of 2, 
// we can create a bit-mask by substracting 1
wire[31:0] uwc_mask = uw_host_capacity - 1;

// Of the entire userwave, how many UWC have we not yet fetched?
wire[31:0] uwc_unfetched = uwc_total - uwc_fetched;

// How many UWC are currently waiting for us in the host-RAM buffer?
wire[31:0] uwc_occupancy = uwc_provided - uwc_fetched;

// Compute the number of free UWC slots in the host-RAM buffer
assign uw_host_free = uw_host_capacity - uwc_occupancy;

// Compute the address in host-RAM where UWC of index "uwc_fetched" resides
assign M_AXI_ARADDR = uw_host_addr + (uwc_fetched & uwc_mask) * UWC_BYTES;

//=============================================================================
// This is the main state machine for this module.   When there is enough
// room in the output FIFO for an entire block of UWC, we fetch a block
// (or however many UWC remain in the userwave) from host-RAM
//=============================================================================
reg[6:0] uwc_request_count;
reg      engine_started;
localparam FSM_IDLE            = 0;
localparam FSM_WAIT_FIFO_RESET = 1;
localparam FSM_LOOP            = 2;
localparam FSM_FETCH_BLOCK     = 3;
localparam FSM_WAIT_DATA       = 4;
localparam FSM_START_ENGINE    = 5;
reg[2:0]   fsm_state;
//-----------------------------------------------------------------------------
always @(posedge clk) begin

    // These strobe high for a single cycle at a time
    fifo_resetn_stb  <= 0;
    start_engine_stb <= 0;

    if (resetn == 0) begin
        fsm_state <= FSM_IDLE;
    end

    else case(fsm_state)

        // Wait for someone to tell us to start.  When they do, immediately
        // start a reset on the FIFO
        FSM_IDLE:
            if (start_stb) begin
                fifo_resetn_stb <= 1;
                uwc_fetched     <= 0;
                engine_started  <= 0;
                fsm_state       <= FSM_WAIT_FIFO_RESET;
            end

        // Wait for the reset on the FIFO to complete
        FSM_WAIT_FIFO_RESET:
            if (fifo_resetn_complete)
                fsm_state  <= FSM_LOOP;

        FSM_LOOP:

            // If there are no more UWC in the userwave, we're done
            if (uwc_unfetched == 0)
                fsm_state <= FSM_IDLE;

            // Otherwise, if there is room for an entire block of UWC in the FIFO...
            else if (fifo_entries <= (FIFO_DEPTH - UWC_BLOCK)) begin    

                // If there are enough UWC in the host-RAM buffer to fill
                // an entire block, fetch a whole block
                if (uwc_occupancy >= UWC_BLOCK) begin
                    uwc_request_count <= UWC_BLOCK;
                    fsm_state         <= FSM_FETCH_BLOCK;
                end

                // If the host-RAM buffer contains the very last unfetched UWC,
                // fetch all the UWC that remain in the userwave
                else if (uwc_occupancy == uwc_unfetched) begin
                    uwc_request_count <= uwc_unfetched;
                    fsm_state         <= FSM_FETCH_BLOCK;
                end
            end

        // Issue the read on the AR channel
        FSM_FETCH_BLOCK:
            if (M_AXI_ARVALID & M_AXI_ARREADY)
                fsm_state <= FSM_WAIT_DATA;

        // Wait for all of the requested UWC to arrive
        FSM_WAIT_DATA:
            if (M_AXI_RVALID & M_AXI_RREADY & M_AXI_RLAST) begin
                uwc_fetched <= uwc_fetched + uwc_request_count;
                fsm_state   <= (engine_started) ? FSM_LOOP : FSM_START_ENGINE;
            end

        // If we have fetched the entire userwave or at least the first two full
        // blocks, start the userwave engine
        FSM_START_ENGINE:
            begin
                if ((uwc_fetched == uwc_total) || (uwc_fetched >= UWC_BLOCK * 2)) begin
                    start_engine_stb <= 1;
                    engine_started   <= 1;
                end
                fsm_state <= FSM_LOOP;
            end
      endcase

end

assign M_AXI_ARVALID = (fsm_state == FSM_FETCH_BLOCK);
assign M_AXI_RREADY  = 1;
assign M_AXI_ARLEN   = uwc_request_count - 1;

// We're busy when this state machine isn't idling
assign busy = (start_stb == 1) || (fsm_state != FSM_IDLE);
//=============================================================================


//=============================================================================
// Here we receive incoming data from M_AXI and write it to the FIFO.  It's 
// safe to blindly write to the FIFO because we never request data from host
// RAM unless we know there is room for it in the FIFO.
//=============================================================================
always @(posedge clk) begin
    
    fifo_in_tvalid <= 0;

    if (M_AXI_RVALID & M_AXI_RREADY) begin
        fifo_in_tdata  <= M_AXI_RDATA;
        fifo_in_tvalid <= 1;        
    end

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
    .s_aclk   (clk         ),
    .m_aclk   (clk         ),
    .s_aresetn(fifo_resetn ),

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