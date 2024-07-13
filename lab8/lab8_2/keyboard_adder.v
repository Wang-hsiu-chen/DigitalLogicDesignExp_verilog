`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/30 19:41:59
// Design Name: 
// Module Name: keyboard_adder
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


module keyboard_adder(
    input fcrystal,
    input rst_n,
    inout PS2_DATA,
    inout PS2_CLK,
    output [3:0] ssd_ctl,
    output [7:0] ssd_signal
    );
    
    wire [1:0] clk_scan;
    wire clk_1Hz, clk_100Hz;
    wire key_valid;
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire [3:0] in1, in0, n1, n0;
    wire [3:0] code;
    
    clock_generator CG(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .clk_scan(clk_scan),
    .clk_100Hz(clk_100Hz),
    .clk_1Hz(clk_1Hz)
    );
    
    KeyboardDecoder KD(
    .key_down(key_down),
    .key_valid(key_valid),
	.last_change(last_change),
	.PS2_DATA(PS2_DATA),
	.PS2_CLK(PS2_CLK),
	.rst(~rst_n),
	.clk(fcrystal)
    ); 
   
    adder_fsm AF(
    .fcrystal(fcrystal),
    .clk_1Hz(clk_1Hz),
    .clk_100Hz(clk_100Hz),
    .rst_n(rst_n),
    .last_change(last_change),
    .key_down(key_down),
    .key_valid(key_valid),
    .in1(in1),
    .in0(in0)
    );
    
    decimal_adder DA(
    .A(in0),
    .B(in1),
    .cin(1'b0),
    .n0(n0),
    .n1(n1)
    );
    
    SSD_CTL SC(
    .clk_scan(clk_scan),
    .code(code),
    .ssd_ctl(ssd_ctl),
    .q0(n0),
    .q1(n1),
    .q2(in1),
    .q3(in0)
    );
    
    BCD_to_SSD_decoder U_SD(
    .q(code),
    .ssd_signal(ssd_signal)
    );
endmodule
