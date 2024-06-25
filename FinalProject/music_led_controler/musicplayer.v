module musicplayer( 
    input clk, // clock from the crystal 
    input rst_n, // active low reset 
//    input volume_dw_in,
//    input volume_up_in,
    input music1,
    output audio_mclk, // master clock 
    output audio_lrck, // left-right clock 
    output audio_sck, // serial clock
    output audio_sdin // serial audio data input
    // output [3:0] ssd_ctl,
    // output [7:0] segs
);
// Declare internal nodes 
wire clk_1, clk_4, clk_10, clk_100, clk_10K;
wire [1:0] clk_s;
// wire [3:0] ssd_in;
wire [15:0] volume, audio_in_left, audio_in_right;
wire [21:0] tune_left, tune_right;

clock_generator U_CG(
    .clk(clk),
    .rst_n(rst_n), 
    .clk_out1(clk_1), 
    .clk_out4(clk_4),
    .clk_out10(clk_10), 
    .clk_out100(clk_100), 
    .clk_out10K(clk_10K), 
    .clk_ssd(clk_s)
);
// Note generation 
buzzer_control Ung(
    .clk(clk), // clock from crystal
    .rst_n(rst_n), // active low reset 
    .note_div_left(tune_left), // div for note generation 
    .note_div_right(tune_right),
    .audio_left(audio_in_left), // left sound audio 
    .audio_right(audio_in_right) // right sound audio 
);
// Speaker controllor 
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
music_select U_MS(
    .tempo_clk(clk_1),
    .rst_n(rst_n),
    .music1(music1),
    // .music2(music2),
    .tune_left(tune_left),
    .tune_right(tune_right)
);
// scanctl U_SC(
//     .ssd_ctl(ssd_ctl), // ssd display control signal 
//     .ssd_in(ssd_in), // output to ssd display
//     .in0(4'd0), // 1st input
//     .in1(4'd0), // 2nd input
//     .in2(tune_signal_1), // 3st input
//     .in3(tune_signal_2), // 4nd input
//     .clk_ssd(clk_s) // divided clock for scan control
// );
// // SSD display
// SSDdisplay U_SD(
//     .segs(segs),
//     .bin(ssd_in)
// );
endmodule