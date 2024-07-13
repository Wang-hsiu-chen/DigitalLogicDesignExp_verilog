module testbench;

parameter period = 0.5;

wire [3:0] A_count;
wire C_out;
reg [3:0] Data_in;
reg Count;
reg Load;
reg CLK;
reg Clear_b;

BCD_counter u1(
    .A_count(A_count),
    .C_out(C_out),
    .Data_in(Data_in),
    .Count(Count),
    .Load(Load),
    .CLK(CLK),
    .Clear_b(Clear_b)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench);
    $monitor($time, ": Count:%B, Load:%B ,Data_in:%B, A_count:%B, Cout:%B", Count, Load, Data_in, A_count, C_out);
end

initial begin
    Data_in = 4'b0000; Count = 1; Load = 1; CLK = 1; Clear_b = 1;
    #(period) Data_in = 4'b0000; Count = 1; Load = 0; CLK = 0; Clear_b = 1;
    #(period) Data_in = 4'b0000; Count = 1; Load = 0; CLK = 1; Clear_b = 1;
    #(period) Data_in = 4'b0000; Count = 1; Load = 0; CLK = 0; Clear_b = 1;
    #(period) Data_in = 4'b0000; Count = 1; Load = 0; CLK = 1; Clear_b = 1;
    #(period) Data_in = 4'b0000; Count = 1; Load = 0; CLK = 0; Clear_b = 1;
    #(period) Data_in = 4'b0000; Count = 1; Load = 0; CLK = 1; Clear_b = 1;
    #(period) Data_in = 4'b0000; Count = 1; Load = 0; CLK = 0; Clear_b = 1;
    #(period) Data_in = 4'b0000; Count = 1; Load = 0; CLK = 1; Clear_b = 1;
    #(period) $finish;
end

endmodule