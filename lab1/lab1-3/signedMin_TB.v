module min_TB;
reg[2:0] A, B, C;
wire[2:0] O;

min U0(.a(A), .b(B), .c(C), .o(O));
initial begin
    A = 3'b000; B = 3'b011; C = 3'b100; #2
    $display("A = %b, B = %b, C = %b, O = %b", A, B, C, O);
    #(6) $finish;
 
end
endmodule