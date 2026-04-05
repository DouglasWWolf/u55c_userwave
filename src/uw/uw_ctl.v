//=============================================================================
//                   ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 28-Mar-26  DWW     1  Initial creation
//=============================================================================

/*
    User accessible control and status registers for the userwave system
*/


module uw_ctl # (parameter AW=8)
(
    input clk, resetn,

    // Asserting this suspends (i.e.,resets) the corresponding fetcher
    output reg       q0_suspend,
    output reg       q1_suspend, 

    // How many free UWC slots are there in the host-RAM buffer?
    input[31:0]      q0_uwc_host_free,
    input[31:0]      q1_uwc_host_free,

    // Address of the userwave buffer in host RAM
    output reg[63:0] q0_uw_host_addr,
    output reg[63:0] q1_uw_host_addr,

    // Number of userwave commands that can fit in the host-RAM buffer
    output reg[31:0] q0_uw_host_capacity,
    output reg[31:0] q1_uw_host_capacity,

    // How many UWCs has the software stuffed into the host-RAM buffer?
    output reg[63:0] q0_uwc_provided,
    output reg[63:0] q1_uwc_provided,

    // Various commands that can be sent to the userwave engine
    output reg[ 2:0] ctl_command,

    // When this is asserted, the userwave engine is halted
    input uw_halted,

    // Which input queue is the userwave engine currently using?
    input q_select,

    // Strobes high any time the userwave engine reports an underflow
    input uw_underflow_stb,

    // Strobes high when the userwave engine reports a too-short UWC
    input uw_short_uwc_stb,

    // Strobes high when the fetcher detects an address alignment error
    input q0_alignment_stb,
    input q1_alignment_stb,

    // Strobes high any time the engine reports a stall on the metadata stream
    input uw_md_stall_stb,

    //================== This is an AXI4-Lite slave interface ==================
        
    // "Specify write address"              -- Master --    -- Slave --
    input[AW-1:0]                           S_AXI_AWADDR,   
    input                                   S_AXI_AWVALID,  
    input[   2:0]                           S_AXI_AWPROT,
    output                                                  S_AXI_AWREADY,


    // "Write Data"                         -- Master --    -- Slave --
    input[31:0]                             S_AXI_WDATA,      
    input                                   S_AXI_WVALID,
    input[ 3:0]                             S_AXI_WSTRB,
    output                                                  S_AXI_WREADY,

    // "Send Write Response"                -- Master --    -- Slave --
    output[1:0]                                             S_AXI_BRESP,
    output                                                  S_AXI_BVALID,
    input                                   S_AXI_BREADY,

    // "Specify read address"               -- Master --    -- Slave --
    input[AW-1:0]                           S_AXI_ARADDR,     
    input[   2:0]                           S_AXI_ARPROT,     
    input                                   S_AXI_ARVALID,
    output                                                  S_AXI_ARREADY,

    // "Read data back to master"           -- Master --    -- Slave --
    output[31:0]                                            S_AXI_RDATA,
    output                                                  S_AXI_RVALID,
    output[ 1:0]                                            S_AXI_RRESP,
    input                                   S_AXI_RREADY
    //==========================================================================
);  

//=========================  AXI Register Map  =============================
localparam REG_CTL_COMMAND         = 0;
localparam REG_ERRORS              = 1;
localparam REG_STATUS              = 2;

localparam REG_Q0_SUSPEND         = 16;
localparam REG_Q0_HOST_ADDR_H     = 17;
localparam REG_Q0_HOST_ADDR_L     = 18;
localparam REG_Q0_HOST_CAPACITY   = 19;
localparam REG_Q0_UWC_PROVIDED_H  = 20;
localparam REG_Q0_UWC_PROVIDED_L  = 21;
localparam REG_Q0_UWC_HOST_FREE   = 22;

localparam REG_Q1_SUSPEND         = 32;
localparam REG_Q1_HOST_ADDR_H     = 33;
localparam REG_Q1_HOST_ADDR_L     = 34;
localparam REG_Q1_HOST_CAPACITY   = 35;
localparam REG_Q1_UWC_PROVIDED_H  = 36;
localparam REG_Q1_UWC_PROVIDED_L  = 37;
localparam REG_Q1_UWC_HOST_FREE   = 38;

//==========================================================================


//==========================================================================
// Errors that can be reported in the error register
//==========================================================================
localparam ERR_UNDERFLOW = 0;
localparam ERR_SHORT_UWC = 1;
localparam ERR_Q0_ALIGN  = 2;
localparam ERR_Q1_ALIGN  = 3;
localparam ERR_MD_STALL  = 4;
//==========================================================================


//==========================================================================
// We'll communicate with the AXI4-Lite Slave core with these signals.
//==========================================================================
// AXI Slave Handler Interface for write requests
wire[  31:0]  ashi_windx;     // Input   Write register-index
wire[AW-1:0]  ashi_waddr;     // Input:  Write-address
wire[  31:0]  ashi_wdata;     // Input:  Write-data
wire          ashi_write;     // Input:  1 = Handle a write request
reg [   1:0]  ashi_wresp;     // Output: Write-response (OKAY, DECERR, SLVERR)
wire          ashi_widle;     // Output: 1 = Write state machine is idle

// AXI Slave Handler Interface for read requests
wire[  31:0]  ashi_rindx;     // Input   Read register-index
wire[AW-1:0]  ashi_raddr;     // Input:  Read-address
wire          ashi_read;      // Input:  1 = Handle a read request
reg [  31:0]  ashi_rdata;     // Output: Read data
reg [   1:0]  ashi_rresp;     // Output: Read-response (OKAY, DECERR, SLVERR);
wire          ashi_ridle;     // Output: 1 = Read state machine is idle
//==========================================================================

// The state of the state-machines that handle AXI4-Lite read and AXI4-Lite write
reg ashi_write_state, ashi_read_state;

// The AXI4 slave state machines are idle when in state 0 and their "start" signals are low
assign ashi_widle = (ashi_write == 0) && (ashi_write_state == 0);
assign ashi_ridle = (ashi_read  == 0) && (ashi_read_state  == 0);
   
// These are the valid values for ashi_rresp and ashi_wresp
localparam OKAY   = 0;
localparam SLVERR = 2;
localparam DECERR = 3;

reg[31:0] userwave_errors;

// The high 32-bits of "uwc_provided"
reg[31:0] q0_uwc_provided_h, q1_uwc_provided_h;

//==========================================================================
// This state machine handles AXI4-Lite write requests
//==========================================================================
always @(posedge clk) begin

    // If we're in reset, initialize important registers
    if (resetn == 0) begin
        ashi_write_state    <= 0;

        q0_uw_host_addr     <= 64'h1_0000_0000;
        q0_uw_host_capacity <= 32'h0_8000_0000;
        q0_suspend          <= 1;

        q1_uw_host_addr     <= 64'h1_8000_0000;
        q1_uw_host_capacity <= 32'h0_8000_0000;
        q1_suspend          <= 1;

        userwave_errors     <= 0;
        ctl_command         <= 0;
    end

    // Otherwise, we're not in reset...
    else case (ashi_write_state) 
        
        // If an AXI write-request has occured...
        0:  if (ashi_write) begin
       
                // Assume for the moment that the result will be OKAY
                ashi_wresp <= OKAY;              

                // ashi_windex = index of register to be written
                case (ashi_windx)
                    REG_CTL_COMMAND:        ctl_command             <= ashi_wdata;
                    REG_ERRORS:             userwave_errors         <= userwave_errors & ~ashi_wdata;

                    REG_Q0_SUSPEND:         q0_suspend              <= ashi_wdata[0];
                    REG_Q0_HOST_ADDR_H:     q0_uw_host_addr[63:32]  <= ashi_wdata;
                    REG_Q0_HOST_ADDR_L:     q0_uw_host_addr[31:00]  <= ashi_wdata;
                    REG_Q0_HOST_CAPACITY:   q0_uw_host_capacity     <= ashi_wdata;
                    REG_Q0_UWC_PROVIDED_H:  q0_uwc_provided_h       <= ashi_wdata;
                    REG_Q0_UWC_PROVIDED_L:  q0_uwc_provided         <= {q0_uwc_provided_h, ashi_wdata};

                    REG_Q1_SUSPEND:         q1_suspend              <= ashi_wdata[0];
                    REG_Q1_HOST_ADDR_H:     q1_uw_host_addr[63:32]  <= ashi_wdata;
                    REG_Q1_HOST_ADDR_L:     q1_uw_host_addr[31:00]  <= ashi_wdata;
                    REG_Q1_HOST_CAPACITY:   q1_uw_host_capacity     <= ashi_wdata;
                    REG_Q1_UWC_PROVIDED_H:  q1_uwc_provided_h       <= ashi_wdata;
                    REG_Q1_UWC_PROVIDED_L:  q1_uwc_provided         <= {q1_uwc_provided_h, ashi_wdata};

                    // Writes to any other register are a decode-error
                    default: ashi_wresp <= DECERR;
                endcase
            end

        // Dummy state, doesn't do anything
        1: ashi_write_state <= 0;

    endcase

    // Record error strobes when they happen
    if (uw_underflow_stb) userwave_errors[ERR_UNDERFLOW] <= 1;
    if (uw_short_uwc_stb) userwave_errors[ERR_SHORT_UWC] <= 1;
    if (q0_alignment_stb) userwave_errors[ERR_Q0_ALIGN ] <= 1;
    if (q1_alignment_stb) userwave_errors[ERR_Q1_ALIGN ] <= 1;
    if (uw_md_stall_stb ) userwave_errors[ERR_MD_STALL ] <= 1;

end
//==========================================================================

  

//==========================================================================
// World's simplest state machine for handling AXI4-Lite read requests
//==========================================================================
always @(posedge clk) begin

    // If we're in reset, initialize important registers
    if (resetn == 0) begin
        ashi_read_state <= 0;
    
    // If we're not in reset, and a read-request has occured...        
    end else if (ashi_read) begin
   
        // Assume for the moment that the result will be OKAY
        ashi_rresp <= OKAY;              
        
        // ashi_rindex = index of register to be read
        case (ashi_rindx)

            REG_CTL_COMMAND:        ashi_rdata <= ctl_command;
            REG_ERRORS:             ashi_rdata <= userwave_errors;
            REG_STATUS:             ashi_rdata <= {q_select, uw_halted};

            REG_Q0_SUSPEND:         ashi_rdata <= q0_suspend;
            REG_Q0_HOST_ADDR_H:     ashi_rdata <= q0_uw_host_addr[63:32];
            REG_Q0_HOST_ADDR_L:     ashi_rdata <= q0_uw_host_addr[31:00];
            REG_Q0_HOST_CAPACITY:   ashi_rdata <= q0_uw_host_capacity;
            REG_Q0_UWC_PROVIDED_H:  ashi_rdata <= q0_uwc_provided[63:32];
            REG_Q0_UWC_PROVIDED_L:  ashi_rdata <= q0_uwc_provided[31:00];
            REG_Q0_UWC_HOST_FREE:   ashi_rdata <= q0_uwc_host_free;

            REG_Q1_SUSPEND:         ashi_rdata <= q1_suspend;
            REG_Q1_HOST_ADDR_H:     ashi_rdata <= q1_uw_host_addr[63:32];
            REG_Q1_HOST_ADDR_L:     ashi_rdata <= q1_uw_host_addr[31:00];
            REG_Q1_HOST_CAPACITY:   ashi_rdata <= q1_uw_host_capacity;
            REG_Q1_UWC_PROVIDED_H:  ashi_rdata <= q1_uwc_provided[63:32];
            REG_Q1_UWC_PROVIDED_L:  ashi_rdata <= q1_uwc_provided[31:00];
            REG_Q1_UWC_HOST_FREE:   ashi_rdata <= q1_uwc_host_free;

            // Reads of any other register are a decode-error
            default: ashi_rresp <= DECERR;

        endcase
    end
end
//==========================================================================



//==========================================================================
// This connects us to an AXI4-Lite slave core
//==========================================================================
axi4_lite_slave#(.AW(AW)) i_axi4lite_slave
(
    .clk            (clk),
    .resetn         (resetn),
    
    // AXI AW channel
    .AXI_AWADDR     (S_AXI_AWADDR),
    .AXI_AWPROT     (S_AXI_AWPROT),
    .AXI_AWVALID    (S_AXI_AWVALID),   
    .AXI_AWREADY    (S_AXI_AWREADY),
    
    // AXI W channel
    .AXI_WDATA      (S_AXI_WDATA),
    .AXI_WVALID     (S_AXI_WVALID),
    .AXI_WSTRB      (S_AXI_WSTRB),
    .AXI_WREADY     (S_AXI_WREADY),

    // AXI B channel
    .AXI_BRESP      (S_AXI_BRESP),
    .AXI_BVALID     (S_AXI_BVALID),
    .AXI_BREADY     (S_AXI_BREADY),

    // AXI AR channel
    .AXI_ARADDR     (S_AXI_ARADDR), 
    .AXI_ARPROT     (S_AXI_ARPROT),
    .AXI_ARVALID    (S_AXI_ARVALID),
    .AXI_ARREADY    (S_AXI_ARREADY),

    // AXI R channel
    .AXI_RDATA      (S_AXI_RDATA),
    .AXI_RVALID     (S_AXI_RVALID),
    .AXI_RRESP      (S_AXI_RRESP),
    .AXI_RREADY     (S_AXI_RREADY),

    // ASHI write-request registers
    .ASHI_WADDR     (ashi_waddr),
    .ASHI_WINDX     (ashi_windx),
    .ASHI_WDATA     (ashi_wdata),
    .ASHI_WRITE     (ashi_write),
    .ASHI_WRESP     (ashi_wresp),
    .ASHI_WIDLE     (ashi_widle),

    // ASHI read registers
    .ASHI_RADDR     (ashi_raddr),
    .ASHI_RINDX     (ashi_rindx),
    .ASHI_RDATA     (ashi_rdata),
    .ASHI_READ      (ashi_read ),
    .ASHI_RRESP     (ashi_rresp),
    .ASHI_RIDLE     (ashi_ridle)
);
//==========================================================================



endmodule
