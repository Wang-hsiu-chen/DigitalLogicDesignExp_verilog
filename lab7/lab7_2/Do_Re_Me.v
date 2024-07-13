`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/22 23:27:37
// Design Name: 
// Module Name: Do_Re_Me
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
`define Note_DO 22'd191571
`define Note_RE 22'd170648
`define Note_MI 22'd151976

module Do_Re_Me(
    input fcrystal,
    input rst_n,
    input pb_left,
    input pb_center,
    input pb_right,
    input pb_up,
    input pb_down,
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_din,
    output [3:0] ssd_ctl,
    output [7:0] ssd_signal
    );
    
    wire clk_100Hz, clk_10KHz;
    wire [1:0] clk_scan;
    wire pb_left_de, pb_center_de, pb_right_de, pb_up_de, pb_down_de;
    wire pb_up_pu, pb_down_pu;
    wire [15:0] volume_min, volume_max, audio_left, audio_right;
    wire [15:0] audio_left_do, audio_right_do, audio_left_re, audio_right_re, audio_left_mi, audio_right_mi;
    wire [3:0] volume_code, n1, n0;
    wire [3:0] code;
    
     
    clock_generator CLK(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .clk_scan(clk_scan),
    .clk_100Hz(clk_100Hz),
    .clk_10KHz(clk_10KHz)
    );
    
    debounce_circuit PBL( 
    .clk(clk_10KHz), // clock control 
    .rst_n(rst_n), // reset 
    .pb_in(pb_left), //push button input 
    .pb_debounced(pb_left_de) // debounced push button output 
    );
    
    debounce_circuit PBC( 
    .clk(clk_10KHz), // clock control 
    .rst_n(rst_n), // reset 
    .pb_in(pb_center), //push button input 
    .pb_debounced(pb_center_de) // debounced push button output 
    ); 
    
    debounce_circuit PBR( 
    .clk(clk_10KHz), // clock control 
    .rst_n(rst_n), // reset 
    .pb_in(pb_right), //push button input 
    .pb_debounced(pb_right_de) // debounced push button output 
    ); 
    
    debounce_circuit PBU( 
    .clk(clk_10KHz), // clock control 
    .rst_n(rst_n), // reset 
    .pb_in(pb_up), //push button input 
    .pb_debounced(pb_up_de) // debounced push button output 
    ); 
    
    debounce_circuit PBD( 
    .clk(clk_10KHz), // clock control 
    .rst_n(rst_n), // reset 
    .pb_in(pb_down), //push button input 
    .pb_debounced(pb_down_de) // debounced push button output 
    ); 
    
    one_pulse_and_long_press_detect PUU(
    .in_trig(pb_up_de),
    .rst_n(rst_n),
    .clk(clk_100Hz),
    .out_pulse(pb_up_pu)
    );
    
    one_pulse_and_long_press_detect PUD(
    .in_trig(pb_down_de),
    .rst_n(rst_n),
    .clk(clk_100Hz),
    .out_pulse(pb_down_pu)
    );
    
    Volume_fsm VF(
    .clk(clk_100Hz),
    .rst_n(rst_n),
    .pb_up_pu(pb_up_pu),
    .pb_down_pu(pb_down_pu),
    .volume_code(volume_code),
    .n1(n1),
    .n0(n0)
    );
    
    Volume_selector VS(
    .volume_code(volume_code),
    .volume_min(volume_min),
    .volume_max(volume_max)
    );
    
    buzzer_control DO(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .volume_min(volume_min),
    .volume_max(volume_max),
    .note_div_left(`Note_DO),
    .note_div_right(`Note_DO),
    .audio_left(audio_left_do),
    .audio_right(audio_right_do)
    );
    
    buzzer_control RE(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .volume_min(volume_min),
    .volume_max(volume_max),
    .note_div_left(`Note_RE),
    .note_div_right(`Note_RE),
    .audio_left(audio_left_re),
    .audio_right(audio_right_re)
    );
    
    buzzer_control MI(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .volume_min(volume_min),
    .volume_max(volume_max),
    .note_div_left(`Note_MI),
    .note_div_right(`Note_MI),
    .audio_left(audio_left_mi),
    .audio_right(audio_right_mi)
    );
    
    audio_selector AS(
    .pb_left_de(pb_left_de),
    .pb_center_de(pb_center_de),
    .pb_right_de(pb_right_de),
    .audio_left_do(audio_left_do),
    .audio_right_do(audio_right_do),
    .audio_left_re(audio_left_re),
    .audio_right_re(audio_right_re),
    .audio_left_mi(audio_left_mi),
    .audio_right_mi(audio_right_mi),
    .audio_left(audio_left),
    .audio_right(audio_right)
    );
    
    speaker_ctl SC(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .audio_left(audio_left),
    .audio_right(audio_right),
    .audio_mclk(audio_mclk),
    .audio_lrck(audio_lrck),
    .audio_sck(audio_sck),
    .audio_din(audio_din)
    );
    
    SSD_CTL SSDC(
    .clk_scan(clk_scan),
    .code(code),
    .ssd_ctl(ssd_ctl),
    .q0(n0),
    .q1(n1),
    .q2(4'd15),
    .q3(4'd15)
    );
    
    BCD_to_SSD_decoder BSD(
    .q(code),
    .ssd_signal(ssd_signal)
    );
endmodule
