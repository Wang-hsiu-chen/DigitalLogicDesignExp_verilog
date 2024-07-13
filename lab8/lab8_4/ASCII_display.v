`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/08 22:04:48
// Design Name: 
// Module Name: ASCII_display
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


module ASCII_display(
    input fcrystal,
    input rst_n,
    inout PS2_DATA,
    inout PS2_CLK,
    output [6:0] ascii,
    output caps_lock,
    output [3:0] ssd_ctl,
    output [7:0] ssd_signal
    );
    
    wire [511:0] key_down;
    wire key_valid;
    wire [3:0] s0, s1, s2, code;
    wire [1:0] clk_scan;
    
    
    
    KeyboardDecoder KD(
	.key_down(key_down),
	.key_valid(key_valid),
	.PS2_DATA(PS2_DATA),
	.PS2_CLK(PS2_CLK),
	.rst(~rst_n),
	.clk(fcrystal)
    );
    
    FSM_caps FC(
    .key_down(key_down),
    .key_valid(key_valid),
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .caps_lock(caps_lock)
    );
    
    Letter_decoder LD(
    .key_down(key_down),
    .caps_lock(caps_lock),
    .ascii(ascii),
    .s0(s0),
    .s1(s1),
    .s2(s2)
    );
    
    clock_generator CG(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .clk_scan(clk_scan)
    );
    
    SSD_CTL SC(
    .clk_scan(clk_scan),
    .code(code),
    .ssd_ctl(ssd_ctl),
    .q0(s0),
    .q1(s1),
    .q2(s2),
    .q3(4'd15)
    );
    
    BCD_to_SSD_decoder BSD(
    .q(code),
    .ssd_signal(ssd_signal)
    );
endmodule
