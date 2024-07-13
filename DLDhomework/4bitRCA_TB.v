module testbench;

reg [3:0] a;
reg [3:0] b;
reg m;
wire [3:0] s;
wire v;

Add_rca_4 u1(.a(a), .b(b), .m(m), .s(s), .v(v));

initial begin
    a = 4'b0001; b = 4'b0001; m = 1'b1; #2
    a = 4'b0001; b = 4'b0011; m = 1'b0; #2
    a = 4'b0100; b = 4'b0101; m = 1'b1; #2
    a = 4'b1000; b = 4'b1000; m = 1'b0; #2
    a = 4'b0000; b = 4'b0000; m = 1'b0;
    #(10) $finish;
end

initial begin
    $dumpfile("waverca.vcd");
    $dumpvars(0, testbench);
    $monitor($time, ": %b + %b = %b, %b", a, b, s, v);
end

endmodule