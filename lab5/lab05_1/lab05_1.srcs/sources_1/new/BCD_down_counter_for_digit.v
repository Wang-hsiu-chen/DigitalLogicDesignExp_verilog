`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/25 20:00:03
// Design Name: 
// Module Name: BCD_down_counter_for_digit
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


module BCD_down_counter_for_digit(
    input rst_n,
    input clk,
    input zero,
    input reset,
    input en,
    output [3:0] q0
    );
    
    reg [3:0] q0_tem, q0;
    
    always @*
        if (~zero) begin
            if (en) begin
                if (q0 == 4'd0)
                    q0_tem = 4'd9;
                else
                    q0_tem = q0 - 4'd1;
            end
            else q0_tem = q0;
        end
        else q0_tem = q0;
        
    always @(posedge clk or negedge rst_n)
        if (~rst_n || reset)
            q0 <= 4'd0;
        else 
            q0 <= q0_tem;
            
endmodule
