`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/26 14:06:47
// Design Name: 
// Module Name: Switch_clk
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

`define CLK_FAST 1

module Switch_clk(
    input switch_clk,
    input clk_1Hz,
    input clk_100Hz,
    input clk_10KHz,
    output clk_counter,
    output clk_debounce
    );
    
    reg clk_counter, clk_debounce;
    
    always @*
        if (switch_clk == `CLK_FAST) begin
            clk_counter = clk_100Hz;
            clk_debounce = clk_10KHz; 
        end 
        else begin
            clk_counter = clk_1Hz;
            clk_debounce = clk_100Hz;
        end
endmodule
