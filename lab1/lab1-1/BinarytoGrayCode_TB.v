`timescale 1ps / 1ps

module BinarytoGrayCode_TB;
reg A, B, C, D;
wire W, X, Y, Z;

BinarytoGrayCode U0(.a(A), .b(B), .c(C), .d(D), .w(W), .x(X), .y(Y), .z(Z));

initial begin
    A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0; #2
    A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b1; #2
    A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b0; #2
    A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b1; #2
    A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b0; #2
    A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b1; #2
    A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b0; #2
    A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b1; #2
    A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b0; #2
    A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b1; #2
    A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0;
end

initial begin
    $dumpfile("wavebtg.vcd");
    $dumpvars(0, BinarytoGrayCode_TB);
    $monitor("abcd = %b%b%b%b, wxyz = %b%b%b%b", A, B, C, D, W, X, Y, Z);
end

endmodule