`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/23 11:25:12
// Design Name: 
// Module Name: Do_Re_Mi_Fa_So_La_Si
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


module Do_Re_Mi_Fa_So_La_Si(
    input fcrystal,
    input rst_n,
    input chord_switch,
    input pb_left,
    input pb_center,
    input pb_right,
    input pb_up,
    input pb_down,
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_din
    );
    
    wire clk_10KHz;
    wire pb_left_de, pb_center_de, pb_right_de, pb_up_de, pb_down_de;
    wire [21:0] note_left_do_mi, note_left_re_fa, note_left_mi_so, note_left_fa_la, note_left_so_si;
    wire [21:0] note_right_do_mi, note_right_re_fa, note_right_mi_so, note_right_fa_la, note_right_so_si;
    wire [15:0] audio_left_do_mi, audio_left_re_fa, audio_left_mi_so, audio_left_fa_la, audio_left_so_si;
    wire [15:0] audio_right_do_mi, audio_right_re_fa, audio_right_mi_so, audio_right_fa_la, audio_right_so_si;
    wire [15:0] audio_left, audio_right, volume_min, volume_max;
    
    
    clock_generator CLK(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
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
    
    buzzer_control DO_MI(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .volume_min(16'hB000),
    .volume_max(16'h5FFF),
    .note_div_left(note_left_do_mi),
    .note_div_right(note_right_do_mi),
    .audio_left(audio_left_do_mi),
    .audio_right(audio_right_do_mi)
    );
    
    buzzer_control RE_FA(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .volume_min(16'hB000),
    .volume_max(16'h5FFF),
    .note_div_left(note_left_re_fa),
    .note_div_right(note_right_re_fa),
    .audio_left(audio_left_re_fa),
    .audio_right(audio_right_re_fa)
    );
    
    buzzer_control MI_SO(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .volume_min(16'hB000),
    .volume_max(16'h5FFF),
    .note_div_left(note_left_mi_so),
    .note_div_right(note_right_mi_so),
    .audio_left(audio_left_mi_so),
    .audio_right(audio_right_mi_so)
    );
    
    buzzer_control FA_LA(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .volume_min(16'hB000),
    .volume_max(16'h5FFF),
    .note_div_left(note_left_fa_la),
    .note_div_right(note_right_fa_la),
    .audio_left(audio_left_fa_la),
    .audio_right(audio_right_fa_la)
    );   
    
    buzzer_control SO_SI(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .volume_min(16'hB000),
    .volume_max(16'h5FFF),
    .note_div_left(note_left_so_si),
    .note_div_right(note_right_so_si),
    .audio_left(audio_left_so_si),
    .audio_right(audio_right_so_si)
    );
    
    note_selector NS(
    .chord_switch(chord_switch),
    .note_left_do_mi(note_left_do_mi),
    .note_right_do_mi(note_right_do_mi),
    .note_left_re_fa(note_left_re_fa),
    .note_right_re_fa(note_right_re_fa),
    .note_left_mi_so(note_left_mi_so),
    .note_right_mi_so(note_right_mi_so),
    .note_left_fa_la(note_left_fa_la),
    .note_right_fa_la(note_right_fa_la),
    .note_left_so_si(note_left_so_si),
    .note_right_so_si(note_right_so_si)
    );
    
    audio_selector AS(
    .audio_left_do_mi(audio_left_do_mi),
    .audio_left_re_fa(audio_left_re_fa),
    .audio_left_mi_so(audio_left_mi_so),
    .audio_left_fa_la(audio_left_fa_la),
    .audio_left_so_si(audio_left_so_si),
    .audio_right_do_mi(audio_right_do_mi),
    .audio_right_re_fa(audio_right_re_fa),    
    .audio_right_mi_so(audio_right_mi_so),
    .audio_right_fa_la(audio_right_fa_la),
    .audio_right_so_si(audio_right_so_si),
    .audio_left(audio_left),
    .audio_right(audio_right),
    .pb_left_de(pb_left_de),
    .pb_center_de(pb_center_de),
    .pb_right_de(pb_right_de),
    .pb_up_de(pb_up_de),
    .pb_down_de(pb_down_de)
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
    
endmodule
