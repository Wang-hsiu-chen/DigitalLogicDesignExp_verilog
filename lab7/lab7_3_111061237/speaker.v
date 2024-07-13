module speaker( 
    input clk, // clock from the crystal 
    input rst_n, // active low reset 
//    input volume_dw_in,
//    input volume_up_in,
    input tune_do_in,
    input tune_re_in,
    input tune_mi_in,
    input tune_fa_in,
    input tune_so_in,
    input tune_la_in,
    input tune_si_in,
    input tune_doh_in,
    input tune_reh_in,
    input tune_mih_in,
    input tune_fah_in,
    input tune_soh_in,
    input tune_lah_in,
    input tune_sih_in,
    output audio_mclk, // master clock 
    output audio_lrck, // left-right clock 
    output audio_sck, // serial clock
    output audio_sdin, // serial audio data input
    output [3:0] ssd_ctl,
    output [7:0] segs
);
// Declare internal nodes 
wire clk_1, clk_10, clk_100, clk_10K;
wire [1:0] clk_s;
wire [3:0] ssd_in, tune_signal_1, tune_signal_2;
wire [15:0] volume, audio_in_left, audio_in_right;
wire [21:0] tune_left, tune_right;

clock_generator U_CG(
    .clk(clk),
    .rst_n(rst_n), 
    .clk_out1(clk_1), 
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
//volume_top U_VTup(
//    .clk_100(clk_100),
//    .clk_10K(clk_10K),
//    .rst_n(rst_n), //active low rst_n
//    .volume_in(volume_up_in), //push button input
//    .volume_out(volume_up_out)
//);
//volume_top U_VTdw(
//    .clk_100(clk_100),
//    .clk_10K(clk_10K),
//    .rst_n(rst_n), //active low rst_n
//    .volume_in(volume_dw_in), //push button input
//    .volume_out(volume_dw_out)
//);
//volume_select U_VS(
//    .clk(clk_100),
//    .rst_n(rst_n),
//    .volume_up(volume_up_out),
//    .volume_dw(volume_dw_out),
//    .volum_level(volum_level),
//    .volume(volume)
//);
tune_select U_TS(
    .clk_100(clk_100),
    .rst_n(rst_n),
    .tune_do_in(tune_do_in),
    .tune_re_in(tune_re_in),
    .tune_mi_in(tune_mi_in),
    .tune_fa_in(tune_fa_in),
    .tune_so_in(tune_so_in),
    .tune_la_in(tune_la_in),
    .tune_si_in(tune_si_in),
    .tune_doh_in(tune_doh_in),
    .tune_reh_in(tune_reh_in),
    .tune_mih_in(tune_mih_in),
    .tune_fah_in(tune_fah_in),
    .tune_soh_in(tune_soh_in),
    .tune_lah_in(tune_lah_in),
    .tune_sih_in(tune_sih_in),
    .tune_left(tune_left),
    .tune_right(tune_right),
    .tune_signal_1(tune_signal_1),
    .tune_signal_2(tune_signal_2)
);
scanctl U_SC(
    .ssd_ctl(ssd_ctl), // ssd display control signal 
    .ssd_in(ssd_in), // output to ssd display
    .in0(4'd0), // 1st input
    .in1(4'd0), // 2nd input
    .in2(tune_signal_1), // 3st input
    .in3(tune_signal_2), // 4nd input
    .clk_ssd(clk_s) // divided clock for scan control
);
// SSD display
SSDdisplay U_SD(
    .segs(segs),
    .bin(ssd_in)
);
endmodule