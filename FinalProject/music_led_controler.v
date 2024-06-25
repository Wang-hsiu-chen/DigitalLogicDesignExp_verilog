module music_led_controller( 
    input clk, clk_2, clk_20, clk_100, clk_10K, rst_n,
    input volume_up_in, volume_dw_in,
    input state_0, state_1, state_2, state_3,
    input [3:0] current_num_0, current_num_1, current_num_2, current_num_3,
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_sdin,
    output [15:0] leds
);
wire music_0, music_1, music_2, op_music_1;
wire volume_up_out, volume_dw_out;
wire [15:0] volume, audio_in_left, audio_in_right;
wire [21:0] tune_left, tune_right;

state_detect U_ST(
    .clk_2(clk_2),
    .rst_n(rst_n),
    .current_num_0(current_num_0),
    .current_num_1(current_num_1),
    .current_num_2(current_num_2),
    .current_num_3(current_num_3),
    .state_0(state_0),
    .state_1(state_1),
    .state_2(state_2),
    .state_3(state_3),
    .music_0(music_0),
    .music_1(music_1),
    .music_2(music_2),
    .leds(leds)
);
one_pulse U_OP(
   .clk(clk_20),
   .rst_n(rst_n),
   .in_trig(music_1),
   .out_pulse(op_music_1)
);
music_select U_MS(
    .clk(clk_20),
    .rst_n(rst_n),
    .music_0(music_0),
    .music_1(op_music_1),
    .music_2(music_2),
    .tune_left(tune_left),
    .tune_right(tune_right)
);
volume_top U_VTup(
    .clk_100(clk_100),
    .clk_10K(clk_10K),
    .rst_n(rst_n), //active low rst_n
    .volume_in(volume_up_in), //push button input
    .volume_out(volume_up_out)
);
volume_top U_VTdw(
    .clk_100(clk_100),
    .clk_10K(clk_10K),
    .rst_n(rst_n), //active low rst_n
    .volume_in(volume_dw_in), //push button input
    .volume_out(volume_dw_out)
);
volume_select U_VS(
    .clk(clk_100),
    .rst_n(rst_n),
    .volume_up(volume_up_out),
    .volume_dw(volume_dw_out),
    .volume(volume)
);
buzzer_control Ung(
    .clk(clk), // clock from crystal
    .rst_n(rst_n), // active low reset 
    .volume(volume),
    .note_div_left(tune_left), // div for note generation 
    .note_div_right(tune_right),
    .audio_left(audio_in_left), // left sound audio 
    .audio_right(audio_in_right) // right sound audio 
);
speaker_control Usc( 
    .fcrystal(clk), // clock from the crystal 
    .rst_n(rst_n), // active low reset 
    .audio_left(audio_in_left), // left channel audio data input 
    .audio_right(audio_in_right), // right channel audio data input 
    .audio_mclk(audio_mclk), // master clock 
    .audio_lrck(audio_lrck), // left-right clock 
    .audio_sck(audio_sck), // serial clock 
    .audio_din(audio_sdin) // serial audio data input 
);
endmodule