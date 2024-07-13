//method-1
/*
module testbench;

parameter period = 0.5;

wire [3:0] A;
reg C_in;
reg CLK;
reg Rst;
integer i;

BCD_counter u1(
    .A(A),
    .C_in(C_in),
    .CLK(CLK),
    .Rst(Rst)
);

initial begin
    $dumpfile("BCDwave.vcd");
    $dumpvars(0, testbench);
    $monitor($time, "Rst:%B, CLK:%B, C_in:%B ,A:%d", Rst, CLK, C_in, A);
end

initial begin
    Rst = 1; CLK = 1; C_in = 1;
    for (i = 0; i < 10; i = i + 1) begin
        #(period) Rst = 0; C_in = 1; CLK = 0;
        #(period) Rst = 0; C_in = 1; CLK = 1;
    end
    #(period) $finish;
end

endmodule
*/

//method-2
module testbench;

parameter period = 0.5;

wire [3:0] A_count;
reg Count;
reg CLK;
reg reset;
integer i;

BCD_counter u1(
    .A_count(A_count),
    .Count(Count),
    .CLK(CLK),
    .reset(reset)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench);
    $monitor($time, "reset:%B, Count:%B, A_count:%B", reset, Count, A_count);
end

initial begin
    reset = 1; Count = 1; CLK = 0;

    for (i = 0; i < 9; i = i + 1) begin
        #(period) reset = 0; Count = 1; CLK = 0;
        #(period) reset = 0; Count = 1; CLK = 1;
    end
    #(period) $finish;
end

endmodule
