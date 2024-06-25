module LFSR_TB;

parameter period = 2;

reg clk, rst_n;
wire [3:0] rand;
integer i;

LFSR U_L(
    .clk(clk),
    .rst_n(rst_n),
    .rand(rand)
);

initial begin
    clk = 0; rst_n = 0;
    for (i = 0; i < 32; i = i + 1) begin
        #(period) clk = 0; rst_n = 1;
        #(period) clk = 1; rst_n = 1;
    end
    #(period) $finish;
end

initial begin
    $dumpfile("LFSR.vcd");
    $dumpvars(0, LFSR_TB);
    $monitor($time, "rand:%D", rand);
end

endmodule