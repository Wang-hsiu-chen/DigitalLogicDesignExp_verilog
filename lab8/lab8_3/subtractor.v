`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/06 00:49:50
// Design Name: 
// Module Name: subtractor
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


module subtractor(
    input [3:0] a0,
    input [3:0] a1,
    input [3:0] b0,
    input [3:0] b1,
    output reg [3:0] S0,
    output reg [3:0] S1,
    output reg minor
    );
    
    always @* begin
        if (a1 > b1) begin
            if (a0 < b0) begin
                S0 = a0 + 4'd10 - b0;
                S1 = a1 - b1 - 4'd1;
                minor = 1'b0;
            end
            else begin
                S0 = a0 - b0;
                S1 = a1 - b1;
                minor = 1'b0;
            end
        end
        else begin
            if (b0 < a0) begin
                S0 = b0 + 10 - a0;
                S1 = b1 - a1 - 4'd1;
                minor = 1'b1;
            end
            else begin
                S0 = b0 - a0;
                S1 = b1 - a1;
                minor = 1'b1;
            end
        end
    end
endmodule
