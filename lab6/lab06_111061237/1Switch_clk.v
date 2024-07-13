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
`define CLK_SLOW 0

module Switch_clk(
    input switch_clk,
    input switch_clk1,
    input clk_1Hz,
    input clk_100Hz,
    input clk_10KHz,
    input clk_1000KHz,
    input clk_100MHz,
    output reg clk_counter,
    output reg clk_debounce
    );
    
always @*
    if (switch_clk == `CLK_FAST && switch_clk1 == `CLK_SLOW) begin
        clk_counter = clk_100Hz;
        clk_debounce = clk_10KHz; 
    end 
    else if (switch_clk == `CLK_SLOW && switch_clk1 == `CLK_FAST) begin
        clk_counter = clk_1000KHz;
        clk_debounce = clk_100MHz;
    end
    else begin
        clk_counter = clk_1Hz;
        clk_debounce = clk_100Hz;
    end
endmodule
