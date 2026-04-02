//=============================================================================
//                   ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 28-Mar-26  DWW     1  Initial creation
//=============================================================================

/*
    Userwave recorder, stage 2

    The reads an input stream and writes that data to host-RAM in 
    chunks of 64 records (i.e., 4096 bytes).
*/


module uw_recorder_s2 # (parameter DW=512, AW=64, IW=4)
(

    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF M_AXI:axis_in, ASSOCIATED_RESET resetn" *)
    input clk,
    input resetn,

    // This must be on a 4K boundary
    input[63:0]     host_buff_addr,

    // This tells us when stage 1 is actively recording userwave ticks
    input           recording,

    // The number of entries in the FIFO
    input[15:0]     fifo_entries,        

    // This is our data input stream
    input[511:0]    axis_in_tdata,
    input           axis_in_tvalid,
    output          axis_in_tready,

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

// Each record we write is 64 bytes wide, so 64 beats of 64 bytes each
// yields a packet length of 4096 bytes, which is the maximum AXI packet.
localparam BEATS_PER_PACKET = 64;

// Which beat of a packet are we on? 
reg[$clog2(BEATS_PER_PACKET)-1:0] beat;

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
assign M_AXI_ARQOS   = 0;
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
assign M_AXI_WDATA   = axis_in_tdata;
assign M_AXI_WLAST   = (beat == M_AXI_AWLEN);
assign M_AXI_WSTRB   = -1;
assign M_AXI_BREADY  = 1;
//=============================================================================


//=============================================================================
// Perform rising edge detection on the "recording" input port
//=============================================================================
reg prior_recording;
always @(posedge clk) prior_recording <= (resetn == 1) ? recording : 0;
wire recording_start_stb = (prior_recording == 0) && (recording == 1);
//=============================================================================


//=============================================================================
// This state machine reads the input stream and writes that data to host RAM
//=============================================================================
reg[1:0] fsm_state;
reg[63:0] addr_offset;
always @(posedge clk) begin

    if (resetn == 0)
        fsm_state <= 0;
    
    else case(fsm_state)

        0:  if (recording_start_stb)
                addr_offset <= 0;
            
            // If we have a full packet, write it to host RAM
            else if (fifo_entries >= BEATS_PER_PACKET) begin
                M_AXI_AWADDR <= host_buff_addr + addr_offset;
                M_AXI_AWLEN  <= BEATS_PER_PACKET - 1;
                fsm_state    <= 1;
            end

            // If we have a short packet at the end of the recording,
            // write it to host RAM
            else if (!recording && fifo_entries) begin
                M_AXI_AWADDR <= host_buff_addr + addr_offset;
                M_AXI_AWLEN  <= fifo_entries - 1;
                fsm_state    <= 1;
            end

        // When that write on M_AXI_AW* is accepted, go write
        // the data from the input stream to M_AXI_W*
        1:  if (M_AXI_AWVALID & M_AXI_AWREADY) begin
                beat        <= 0;
                addr_offset <= addr_offset + (M_AXI_AWLEN+1) * 64;
                fsm_state   <= 2;
            end

        // Keep writing data from the input stream the M_AXI_W* until we
        // encounter the last beat of the packet
        2:  if (M_AXI_WVALID & M_AXI_WREADY) begin
                if (M_AXI_WLAST) begin
                    fsm_state <= 0;
                end
                beat <= beat + 1;
            end
    endcase
end
//-----------------------------------------------------------------------------

// We write to the AW channel while we're in state 1
assign M_AXI_AWVALID  = (fsm_state == 1);

// We receive incoming data when M_AXI_W* is ready to receive it
assign axis_in_tready = (fsm_state == 2) & M_AXI_WREADY;

// We write outgoing data when the FIFO has data for us
assign M_AXI_WVALID   = (fsm_state == 2) & axis_in_tvalid;
//=============================================================================


endmodule
