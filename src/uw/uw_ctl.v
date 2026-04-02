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

    // This strobes high to start the userwave fetcher
    output reg start_fetcher_stb,

    // These will be high if their respective modules are still running
    input  uw_engine_busy,
    input  uw_fetcher_busy,

    // Address of the userwave buffer in host RAM
    output reg[63:0] uw_host_addr,

    // Number of userwave commands that can fit in the host-RAM buffer
    output reg[31:0] uw_host_capacity,

    // The total number of UWCs in the userwave
    output reg[31:0] uwc_total,

    // How many UWCs has the software stuffed into the host-RAM buffer?
    output reg[31:0] uwc_provided,

    // Two different kinds of halt requests
    output reg req_safe_halt,
    output reg req_unsafe_halt,

    // How many UWC's has the fetcher fetched?
    input[31:0] uwc_fetched,

    // How many free UWC slots are there in the host-RAM buffer?
    input[31:0] uwc_host_free,

    // Strobes high any time the userwave engine reports an underflow
    input uw_underflow_stb,

    // Strobes high when the userwave engine reports a too-short UWC
    input uw_short_uwc_stb,

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
localparam REG_HOST_ADDR_H     = 0;
localparam REG_HOST_ADDR_L     = 1;
localparam REG_HOST_CAPACITY   = 2;
localparam REG_UWC_TOTAL       = 3;
localparam REG_UWC_PROVIDED    = 4;
localparam REG_UWC_FETCHED     = 5;
localparam REG_UWC_HOST_FREE   = 6;
localparam REG_START_FETCHER   = 7;
localparam REG_ERRORS          = 8;
localparam REG_REQ_UNSAFE_HALT = 9;
localparam REG_REQ_SAFE_HALT   = 10;
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

//==========================================================================
// This state machine handles AXI4-Lite write requests
//==========================================================================
always @(posedge clk) begin

    // This strobes high for one cycle at a time
    start_fetcher_stb <= 0;

    // If an underflow occurs, record it
    if (uw_underflow_stb) userwave_errors[0] <= 1;
    if (uw_short_uwc_stb) userwave_errors[1] <= 1;

    // If we're in reset, initialize important registers
    if (resetn == 0) begin
        ashi_write_state  <= 0;
        uw_host_addr      <= 64'h1_0000_0000;
        userwave_errors   <= 0;
        req_safe_halt     <= 0;
        req_unsafe_halt   <= 0;
    end

    // Otherwise, we're not in reset...
    else case (ashi_write_state)
        
        // If an AXI write-request has occured...
        0:  if (ashi_write) begin
       
                // Assume for the moment that the result will be OKAY
                ashi_wresp <= OKAY;              
            
                // ashi_windex = index of register to be written
                case (ashi_windx)

                    REG_HOST_ADDR_H:     uw_host_addr[63:32] <= ashi_wdata;
                    REG_HOST_ADDR_L:     uw_host_addr[31:00] <= ashi_wdata;
                    REG_HOST_CAPACITY:   uw_host_capacity    <= ashi_wdata;
                    REG_UWC_TOTAL:       uwc_total           <= ashi_wdata;
                    REG_UWC_PROVIDED:    uwc_provided        <= ashi_wdata;
                    REG_START_FETCHER:   start_fetcher_stb   <= ashi_wdata[0];
                    REG_ERRORS:          userwave_errors     <= userwave_errors & ~ashi_wdata;
                    REG_REQ_SAFE_HALT:   req_safe_halt       <= ashi_wdata[0];
                    REG_REQ_UNSAFE_HALT: req_unsafe_halt     <= ashi_wdata[0];

                    // Writes to any other register are a decode-error
                    default: ashi_wresp <= DECERR;
                endcase
            end

        // Dummy state, doesn't do anything
        1: ashi_write_state <= 0;

    endcase
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
            
            // Allow a read from any valid register                
            REG_START_FETCHER:   ashi_rdata <= uw_engine_busy | uw_fetcher_busy;
            REG_HOST_ADDR_H:     ashi_rdata <= uw_host_addr[63:32];
            REG_HOST_ADDR_L:     ashi_rdata <= uw_host_addr[31:00];
            REG_HOST_CAPACITY:   ashi_rdata <= uw_host_capacity;
            REG_UWC_TOTAL:       ashi_rdata <= uwc_total;
            REG_UWC_PROVIDED:    ashi_rdata <= uwc_provided;
            REG_UWC_FETCHED:     ashi_rdata <= uwc_fetched;
            REG_UWC_HOST_FREE:   ashi_rdata <= uwc_host_free;
            REG_ERRORS:          ashi_rdata <= userwave_errors;
            REG_REQ_SAFE_HALT:   ashi_rdata <= req_safe_halt;
            REG_REQ_UNSAFE_HALT: ashi_rdata <= req_unsafe_halt;

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
