`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/27 23:57:37
// Design Name: 
// Module Name: keyboard_numbers
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


module keyboard_numbers(
    input fcrystal,
    input rst_n,
    inout PS2_DATA,
    inout PS2_CLK,
    output [7:0] ssd_signal,
    output [3:0] ssd_ctl
    );
    
    wire [8:0] last_change;
    wire [3:0] code;
    wire [511:0] key_down;
    wire key_valid;
    
    KeyboardDecoder KD(
    .key_down(key_down),
    .key_valid(key_valid),
	.last_change(last_change),
	.PS2_DATA(PS2_DATA),
	.PS2_CLK(PS2_CLK),
	.rst(~rst_n),
	.clk(fcrystal)
    );
    
    keyboard_display_decoder KDD(
    .last_change(last_change),
    .ssd_ctl(ssd_ctl),
    .code(code)
    );
    
    BCD_to_SSD_decoder BSD(
    .q(code),
    .ssd_signal(ssd_signal)
    );
endmodule
