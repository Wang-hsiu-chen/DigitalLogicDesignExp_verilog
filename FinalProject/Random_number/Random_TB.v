module Random_TB;

parameter period = 2;

reg [3:0] range;
reg clk, rst_n;
wire [3:0] rand;
integer i;

Random U_R(
    .clk(clk),
    .rst_n(rst_n),
    .rand(rand),
    .range(range)
);

initial begin
    clk = 0; rst_n = 0; range = 10;
    for (i = 0; i < 32; i = i + 1) begin
        #(period) clk = 0; rst_n = 1; range = 10;
        #(period) clk = 1; rst_n = 1; range = 10;
    end
    #(period) $finish;
end

initial begin
    $dumpfile("random_num.vcd");
    $dumpvars(0, Random_TB);
    $monitor($time, "j:%D, range:%D, rand:%D",j, range, rand);
end

endmodule