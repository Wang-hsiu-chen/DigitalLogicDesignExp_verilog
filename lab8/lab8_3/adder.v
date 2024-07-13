`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/05 20:02:36
// Design Name: 
// Module Name: adder
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


module adder(
    input [3:0] a0,
    input [3:0] a1,
    input [3:0] b0,
    input [3:0] b1,
    output reg [3:0] A0,
    output reg [3:0] A1,
    output reg [3:0] A2
    );
    
    reg [3:0] c0, c1;
    
    always@* begin
        c0 = 4'd0;
        if (a0 + b0 + c0 > 9)
        begin
            c1 = 1'b1;
            A0 = a0 + b0 + c0 + 6;
        end
        else
        begin
            c1 = 1'b0;
            A0 = a0 + b0 + c0;
        end
        
        if (a1 + b1 + c1 > 9)
        begin
            A2 = 1'b1;
            A1 = a1 + b1 + c1 + 6;
        end
        else
        begin
            A2 = 1'b0;
            A1 = a1 + b1 + c1;
        end       
    end
endmodule
