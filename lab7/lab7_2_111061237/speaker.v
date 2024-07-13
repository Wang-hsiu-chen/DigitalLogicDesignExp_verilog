module speaker( 
    input clk, // clock from the crystal 
    input rst_n, // active low reset 
    input volume_dw_in,
    input volume_up_in,
    input tune_do_in,
    input tune_re_in,
    input tune_mi_in,
    output tune_do_out,
    output tune_re_out,
    output tune_mi_out,
    output audio_mclk, // master clock 
    output audio_lrck, // left-right clock 
    output audio_sck, // serial clock
    output audio_sdin, // serial audio data input
    output [3:0] ssd_ctl,
    output [7:0] segs
);
// Declare internal nodes 
wire clk_1, clk_10, clk_100, clk_10K, volume_dw_out, volume_up_out;
wire [1:0] clk_s;
wire [3:0] volum_level, ssd_in;
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
    .volume(volume),
    .note_div_left(tune_left), // div for note generation 
    .note_div_right(tune_right),
    .audio_left(audio_in_left), // left sound audio 
    .audio_right(audio_in_right) // right sound audio 
);
// Speaker controllor 
speaker_control Usc( 
    .clk(clk), // clock from the crystal 
    .rst_n(rst_n), // active low reset 
    .audio_in_left(audio_in_left), // left channel audio data input 
    .audio_in_right(audio_in_right), // right channel audio data input 
    .audio_mclk(audio_mclk), // master clock 
    .audio_lrck(audio_lrck), // left-right clock 
    .audio_sck(audio_sck), // serial clock 
    .audio_sdin(audio_sdin) // serial audio data input 
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
    .volum_level(volum_level),
    .volume(volume)
);
tune_select U_TS(
    .clk_100(clk_100),
    .rst_n(rst_n),
    .tune_do_in(tune_do_in),
    .tune_re_in(tune_re_in),
    .tune_mi_in(tune_mi_in),
    .tune_do_out(tune_do_out),
    .tune_re_out(tune_re_out),
    .tune_mi_out(tune_mi_out),
    .tune_left(tune_left),
    .tune_right(tune_right)
);
scanctl U_SC(
    .ssd_ctl(ssd_ctl), // ssd display control signal 
    .ssd_in(ssd_in), // output to ssd display
    .in0(volum_level), // 1st input
    .in1(4'd0), // 2nd input
    .in2(4'd0), // 3st input
    .in3(4'd0), // 4nd input
    .clk_ssd(clk_s) // divided clock for scan control
);
// SSD display
SSDdisplay U_SD(
    .segs(segs),
    .bin(ssd_in)
);
endmodule