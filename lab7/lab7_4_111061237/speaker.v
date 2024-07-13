module speaker( 
    input clk, // clock from the crystal 
    input rst_n, // active low reset 
    input mode_switch,
    input tune_do_in,
    input tune_re_in,
    input tune_mi_in,
    input tune_fa_in,
    input tune_so_in,
    output audio_mclk, // master clock 
    output audio_lrck, // left-right clock 
    output audio_sck, // serial clock
    output audio_sdin // serial audio data input
);
// Declare internal nodes 
wire clk_1, clk_10, clk_100, clk_10K;
wire [1:0] clk_s;
wire [15:0] audio_in_left, audio_in_right; 
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
    .clk(clk), // clock from the crystal 
    .rst_n(rst_n), // active low reset 
    .audio_in_left(audio_in_left), // left channel audio data input 
    .audio_in_right(audio_in_right), // right channel audio data input 
    .audio_mclk(audio_mclk), // master clock 
    .audio_lrck(audio_lrck), // left-right clock 
    .audio_sck(audio_sck), // serial clock 
    .audio_sdin(audio_sdin) // serial audio data input 
);
tune_select U_TS(
    .clk_100(clk_100),
    .rst_n(rst_n),
    .mode_switch(mode_switch),
    .tune_do_in(tune_do_in),
    .tune_re_in(tune_re_in),
    .tune_mi_in(tune_mi_in),
    .tune_fa_in(tune_fa_in),
    .tune_so_in(tune_so_in),
    .tune_left(tune_left),
    .tune_right(tune_right)
);
endmodule