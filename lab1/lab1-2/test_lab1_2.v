`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/14 09:12:00
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test(

    );
    reg [3:0] a;
    reg [3:0] b;
    reg m;
    wire [3:0] addsub_s;
    wire cout;
    wire c0;
    wire addsub_v;

    
 
    
    SignedAddSub Uaddsub(
		.a(a),
		.b(b),
		.m(m),
        .cout(cout),
        .c0(c0),
		.v(addsub_v),
		.s(addsub_s)
    );
    
    
    initial begin
        m = 1'b0;
        a = 4'd3;
        b = 4'd4;
        #2;
        
        m = 1'b1;
        a = 4'd3;
        b = 4'd4;
        #2;
        
        m = 1'b0;
        a = 4'd4;
        b = 4'd4;
        #2;
        
        m = 1'b1;
        a = 4'b1100;
        b = 4'd5;
        #2;
        
        m = 1'b1;
        a = 4'd4;
        b = 4'b1100;
        #2;
        
        m = 1'b1;
        a = 4'b1100;
        b = 4'd4;
        
    end

    initial begin
        $dumpfile("waverca.vcd");
        $dumpvars(0, test);
        $monitor($time, ": %d %b %d = %d, %b, %b, %b", a, m, b, addsub_s, cout, c0, addsub_v);
    end
endmodule
