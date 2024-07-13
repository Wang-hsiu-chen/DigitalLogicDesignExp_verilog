`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/06 16:27:46
// Design Name: 
// Module Name: Two_bits_calculator
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


module Two_bits_calculator(
    input fcrystal,
    input rst_n,
    inout PS2_DATA,
    inout PS2_CLK,
    output [3:0] ssd_ctl,
    output [7:0] ssd_signal
    );
    
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire key_valid;
    wire [3:0] number;
    wire add, clear, multiply, subtract, enter;
    wire [3:0] a0, a1, b0, b1;
    wire [2:0] next_state;
    wire [1:0] mode;
    wire [3:0] M0, M1, M2, M3;
    wire [3:0] A0, A1, A2;
    wire [3:0] S0, S1;
    wire minor;
    wire [3:0] d0, d1, d2, d3;
    wire [1:0] clk_scan;
    wire [3:0] code;
    
    
    KeyboardDecoder KD(
	.key_down(key_down),
	.last_change(last_change),
	.key_valid(key_valid),
	.PS2_DATA(PS2_DATA),
	.PS2_CLK(PS2_CLK),
	.rst(~rst_n),
	.clk(fcrystal)
    );
    
    keyboard_signal_decoder KSD(
    .last_change(last_change),
    .key_valid(key_valid),
    .number(number),
    .add(add),
    .subtract(subtract),
    .multiply(multiply),
    .enter(enter),
    .clear(clear)
    );
    
    FSM FSM(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .key_valid(key_valid),
    .key_down(key_down),
    .number(number),
    .add(add),
    .subtract(subtract),
    .multiply(multiply),
    .enter(enter),
    .clear(clear),
    .a0(a0),
    .a1(a1),
    .b0(b0),
    .b1(b1),
    .mode(mode),
    .next_state(next_state)
    );
    
    Multiplier M(
    .a0(a0),
    .a1(a1),
    .b0(b0),
    .b1(b1),
    .M0(M0),
    .M1(M1),
    .M2(M2),
    .M3(M3)
    );
    
    adder A(
    .a0(a0),
    .a1(a1),
    .b0(b0),
    .b1(b1),
    .A0(A0),
    .A1(A1),
    .A2(A2)
    );
    
    subtractor S(
    .a0(a0),
    .a1(a1),
    .b0(b0),
    .b1(b1),
    .S0(S0),
    .S1(S1),
    .minor(minor)
    );
    
    display_selector DS(
    .mode(mode),
    .a0(a0),
    .a1(a1),
    .b0(b0),
    .b1(b1),
    .A0(A0),
    .A1(A1),
    .A2(A2),
    .S0(S0),
    .S1(S1),
    .minor(minor),
    .M0(M0),
    .M1(M1),
    .M2(M2),
    .M3(M3),
    .next_state(next_state),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3)
    );
    
    clock_generator C(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .clk_scan(clk_scan)
    );
    
    SSD_CTL SC(
    .clk_scan(clk_scan),
    .code(code),
    .ssd_ctl(ssd_ctl),
    .q0(d0),
    .q1(d1),
    .q2(d2),
    .q3(d3)
    );
    
    BCD_to_SSD_decoder BSD(
    .q(code),
    .ssd_signal(ssd_signal)
    );
    
endmodule
