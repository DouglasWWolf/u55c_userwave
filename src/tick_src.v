module tick_src # (parameter PERIOD = 256) 
(
    input clk,
    output tick
);

reg[$clog2(PERIOD)-1:0] timer;

always @(posedge clk) 
    timer <= timer + 1;

assign tick = (timer == 0);

endmodule
