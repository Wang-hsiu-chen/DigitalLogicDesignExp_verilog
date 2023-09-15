`timescale 1ps / 1ps

module synupcount_TB;
wire q;
reg clk, reset;
integer i;

synupcount U0(.clk(clk), .reset(reset));

initial begin
    clk = 1'b0, reset = 1'b0; #1
    for (i = 0; i < 5; i = i + 1) begin
        clk = ~clk, reset = 1'b1; #1
    end
    clk = 1'b0, reset = 1'b0;
end

initial begin
    $dumpfile("wavesuc.vcd");
    $dumpvars(0, synupcount_TB);
end

endmodule