//=============================================================================
//                   ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 28-Mar-26  DWW     1  Initial creation
//=============================================================================

/*
    Userwave recorder, stage 1.
    This captures the output of a userwave, and writes it to a FIFO
*/


module uw_recorder_s1
(

    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF axis_out, ASSOCIATED_RESET resetn" *)
    input clk,
    input resetn,

    // Must be a power of two
    input[ 63:0]    host_buff_size,

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

    // The DAC simulators feed us the DAC outputs.  Keep in mind that these
    // DAC values become valid on the clock-cycle *after* tick_stb occurs.
    input[127:0]    sim_dac_values_0, sim_dac_values_1,

    // How many entries are in the FIFO?
    output reg[15:0] fifo_entries,

    // This is asserted while we're recording a userwave
    output reg      recording,
    
    // This is a stream of userwave records
    output[511:0]   axis_out_tdata,
    output          axis_out_tvalid,
    input           axis_out_tready
);

// If we see no userwave ticks for this many cycles, the userwave is done
localparam TICK_TIMEOUT = 16 * 256;

// The records we write out contain a timestamp, measured in ticks
reg[31:0] timestamp;

// Compute the timestamp of the last record we'll write to host-RAM
// We're leaving 1 free spot for our "end of file" marker 
wire[31:0] final_timestamp = (host_buff_size / 64) - 2;

//=============================================================================
// Input and output bus for the userwave data fifo we write to
//=============================================================================
reg [511:0] fifo_in_tdata;
reg         fifo_in_tvalid;
wire        fifo_in_tready;

wire[511:0] fifo_out_tdata;
wire        fifo_out_tvalid;
wire        fifo_out_tready;

// Wire the "axis_out" stream to the output side of the FIFO
assign axis_out_tdata  = fifo_out_tdata;
assign axis_out_tvalid = fifo_out_tvalid;
assign fifo_out_tready = axis_out_tready;
//=============================================================================


//=============================================================================
// Keep track of how many entries are in the FIFO
//=============================================================================
wire fifo_in =  (fifo_in_tvalid  & fifo_in_tready ); 
wire fifo_out = (fifo_out_tvalid & fifo_out_tready);
always @(posedge clk) begin
    if (resetn == 0)
        fifo_entries <= 0;
    else
        fifo_entries <= fifo_entries + fifo_in - fifo_out;
end
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
// This is the 64-byte data record we write to the FIFO and send to host RAM
//=============================================================================
wire[511:0] record =
{
    {24{8'b0}},        // 24 bytes
    uw_flags,          //  2 bytes
    sim_dac_values_1,  // 16 bytes
    sim_dac_values_0,  // 16 bytes
    tick_count,        //  2 bytes
    timestamp          //  4 bytes
};
//=============================================================================

//=============================================================================
// A simple state machine that counts down clock-cycles since the last time
// we saw "tick_stb" fire.  When tick_timeout == 0, it has been awhile since
// we saw a tick, and we assume that the userwave is finished.
//=============================================================================
reg [$clog2(TICK_TIMEOUT+1)-1:0] tick_timeout;
//-----------------------------------------------------------------------------
always @(posedge clk) begin
    if (resetn == 0)
        tick_timeout <= 0;
    else if (tick_stb)
        tick_timeout <= TICK_TIMEOUT;
    else if (tick_timeout)
        tick_timeout <= tick_timeout - 1;
end
//=============================================================================


//=============================================================================
// This state machine captures userwave outputs and writes them into a FIFO.
//=============================================================================
localparam RSM_IDLE          = 0;
localparam RSM_WAIT_FOR_TICK = 1;
localparam RSM_CAPTURE_DATA  = 2;
localparam RSM_WRITE_FINAL   = 3;
localparam RSM_PAUSE         = 4;
localparam RSM_WAIT_FOR_END  = 5;
reg [ 2:0] rsm_state;
reg [ 2:0] sleep;
//-----------------------------------------------------------------------------
always @(posedge clk) begin

    // These strobe high for a single cycle at a time
    fifo_in_tvalid <= 0;

    if (resetn == 0) begin
        recording <= 0;
        rsm_state <= RSM_IDLE;
    end

    else case(rsm_state)

        // When we see a tick come in, go start capturing data!
        RSM_IDLE:
            if (tick_stb) begin
                timestamp <= 0;
                recording <= 1;
                rsm_state <= RSM_CAPTURE_DATA;
            end

        RSM_WAIT_FOR_TICK:
            if (tick_timeout == 0)
                rsm_state <= RSM_WRITE_FINAL;
            else if (tick_stb) begin
                timestamp <= timestamp + 1;
                rsm_state <= RSM_CAPTURE_DATA;
            end

        // Write this record to the fifo.  Because we know "tick_stb" fires 
        // only every 256 clock-cycles, and because the downstream module
        // reads data from the FIFO faster than we can fill it, it is safe
        // to ignore backpressure from the FIFO here.         
        RSM_CAPTURE_DATA:
            begin
                fifo_in_tdata  <= record;
                fifo_in_tvalid <= 1;
                if (timestamp == final_timestamp)
                    rsm_state <= RSM_WRITE_FINAL;
                else
                    rsm_state <= RSM_WAIT_FOR_TICK;
            end

        // Here we write a final record with the "this is the last record" bit
        // (and every other bit) set.   Software will use this "all ones" 
        // record to determine that it has reached the end of the output.
        RSM_WRITE_FINAL:
            begin
                fifo_in_tdata  <= -1;
                fifo_in_tvalid <= 1;
                sleep          <= -1;
                rsm_state      <= RSM_PAUSE;
            end

        // Wait for that last write to percolate through the FIFO
        RSM_PAUSE:
            if (sleep)
                sleep <= sleep - 1;
            else begin
                rsm_state <= RSM_WAIT_FOR_END;
            end

        // Wait for the userwave to finish
        RSM_WAIT_FOR_END:
            begin
                recording <= 0;
                if (tick_timeout == 0) rsm_state <= RSM_IDLE;
            end

    endcase

end
//=============================================================================



//=============================================================================
// This FIFO holds the recorded userwave data
//=============================================================================
xpm_fifo_axis #
(
   .FIFO_DEPTH      (128),
   .TDATA_WIDTH     (512),
   .FIFO_MEMORY_TYPE("auto"),
   .PACKET_FIFO     ("false"),
   .USE_ADV_FEATURES("0000"),
   .CDC_SYNC_STAGES (3),
   .CLOCKING_MODE   ("common_clock")
)
data_fifo
(
     // Clock and reset
    .s_aclk         (clk   ),
    .m_aclk         (clk   ),
    .s_aresetn      (resetn),

    // This input bus of the FIFO
    .s_axis_tdata   (fifo_in_tdata ),
    .s_axis_tvalid  (fifo_in_tvalid),
    .s_axis_tready  (fifo_in_tready),

    // The output bus of the FIFO
    .m_axis_tdata   (fifo_out_tdata ),
    .m_axis_tvalid  (fifo_out_tvalid),
    .m_axis_tready  (fifo_out_tready),

    // Unused input stream signals
    .s_axis_tlast(),
    .s_axis_tuser(),
    .s_axis_tdest(),
    .s_axis_tid  (),
    .s_axis_tstrb(),
    .s_axis_tkeep(),

    // Unused output stream signals
    .m_axis_tlast(),
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
