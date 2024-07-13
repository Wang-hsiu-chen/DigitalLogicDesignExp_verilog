`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/25 20:03:08
// Design Name: 
// Module Name: BCD_down_counter_for_tens
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


module BCD_down_counter_for_tens(
    input clk,
    input rst_n,
    input [3:0] q0,
    input reset,
    input zero,
    input en,
    output [3:0] q1
    );
    
    reg [3:0] q1_tem, q1;
    
    always @*
        if (~zero) begin
            if (en) begin
                if (q0 == 4'd0)
                    q1_tem = q1 - 4'd1; 
                else
                    q1_tem = q1;
            end
            else q1_tem = q1;
        end
        else q1_tem = q1;
        
    always @(posedge clk or negedge rst_n)
        if (~rst_n || reset)
            q1 <= 4'd5;
        else 
            q1 <= q1_tem;
    
endmodule
