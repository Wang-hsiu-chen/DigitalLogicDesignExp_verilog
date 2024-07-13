`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 23:54:32
// Design Name: 
// Module Name: Multiplier
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


module Multiplier(
    input [3:0] a0,
    input [3:0] a1,
    input [3:0] b0,
    input [3:0] b1,
    output reg [3:0] M0,
    output reg [3:0] M1,
    output reg [3:0] M2,
    output reg [3:0] M3
    );
    
    reg [6:0] p0, p1, p2, p3;
    
    always @* begin
        p0 = a0 * b0;
        p1 = a0 * b1;
        p2 = a1 * b0;
        p3 = a1 * b1;
    end
        
    always @* begin
        M0 = p0 % 10;
        M1 = (p0 / 10 + p1 % 10 + p2 % 10) % 10;
        M2 = ((p1 / 10 + p2 / 10 + p3 % 10) + (p0 / 10 + p1 % 10 + p2 % 10) / 10) % 10;
        M3 = (p3 / 10 + ((p1 / 10 + p2 / 10 + p3 % 10) + (p0 / 10 + p1 % 10 + p2 % 10) / 10) / 10) % 10;
    end
endmodule
