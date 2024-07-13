module testbench;

parameter period = 2;

reg A, B;
wire out;

AND u1(
    .out(out),
    .A(A),
    .B(B)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench);
end

initial begin
    A = 1; B = 1;
    #(period) A = 1; B = 0;
    #(period) A = 0; B = 1;
    #(period) A = 0; B = 0;
    #(period) $finish;
end

endmodule