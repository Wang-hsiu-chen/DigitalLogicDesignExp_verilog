`timescale 1ps / 1ps

module ring_counter_TB;
wire[7:0] count;
reg clk, reset;
integer i;

ring_counter U0(.clk(clk), .reset(reset));

initial begin
    clk = 1'b0, reset = 1'b0 #1
    for (i = 0; i < 15; i = i + 1) begin
        clk = ~clk, reset = 1'b1 #1
    end
    $finish
end

initial begin
    $dumpfile("waverc.vcd");
    $dumpvars(0, ring_counter_TB);
end

endmodule