`timescale 1ns / 1ps

module testbench();
    reg [3:0] a;
    reg [3:0] b;
    reg m;
    wire [3:0] as_s;
    wire as_v;

    SignedAddSub Uaddsub(.a(a), .b(b), .m(m), .v(as_v), .s(as_s));
    initial begin
        m = 1'b0;
        a = 4'd3;
        b = 4'd4;
        #10;
        
        m = 1'b1;
        a = 4'd3;
        b = 4'd4;
        #10;
        
        m = 1'b0;
        a = 4'd4;
        b = 4'd4;
        #10;

        m = 1'b1;
        a = 4'b1100;
        b = 4'd5;
        #10;        
        
        m = 1'b1;
        a = 4'd4;
        b = 4'b1100;
        #10;
        
        m = 1'b1;
        a = 4'b1100;
        b = 4'd4;
    end

    initial begin
        $dumpfile("waverca.vcd");
        $dumpvars(0, testbench);
        $monitor($time, ": %d %b %d = %d, %b", a, m, b, as_s, as_v);
    end
endmodule