module testbench;

reg [7:0] A;
reg [7:0] B;
reg c_in;
wire [7:0] S;
wire E;
wire c_out;

Add_rca_8 u1(.A(A), .B(B), .c_in(c_in), .S(S), .E(E), .c_out(c_out));

initial begin
    A = 8'b00000011; B = 8'b00000100; c_in = 1'b1; #2
    A = 8'b01111011; B = 8'b11011000; c_in = 1'b1; #2
    A = 8'b10001000; B = 8'b00111100; c_in = 1'b1; #2
    A = 8'b10110000; B = 8'b11000000; c_in = 1'b0; #2
    A = 8'b10111010; B = 8'b01000101; c_in = 1'b0; #2
    A = 8'b11011010; B = 8'b00010110; c_in = 1'b0; #2
    A = 8'b00000010; B = 8'b00000001; c_in = 1'b1; #2
    A = 8'b00000111; B = 8'b00000010; c_in = 1'b0; #2
    A = 8'b00000000; B = 8'b00000000; c_in = 1'b0; 
end

initial begin
    $dumpfile("waverca.vcd");
    $dumpvars(0, testbench);
    $monitor($time, ": %B + %B = %B, %B", A, B, S, E);
end

endmodule