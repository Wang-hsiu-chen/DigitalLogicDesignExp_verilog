`define Lal 22'd227273
`define Sil 22'd204082
`define Do 22'd191571
`define Re 22'd170648
`define Mi 22'd151976
`define Fa 22'd143266
`define So 22'd127877
`define La 22'd113636
`define Si 22'd101419
`define Doh 22'd95420
`define Reh 22'd85034
`define Mih 22'd75757
`define Fah 22'd71633
`define Soh 22'd63776
`define Lah 22'd56818
`define Sih 22'd50607
module electronic_organ(
    input fcrystal,
    input rst_n,
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
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_sdin,
    output [3:0] ssd_ctl,
    output [7:0] segs
);
    
    wire clk_1, clk_10, clk_100, clk_10K;
    wire [1:0] clk_s;
    wire [3:0] ssd_in, tune_signal_1, tune_signal_2, tune_signal_3;
    wire [15:0] audio_do, audio_re, audio_mi, audio_fa, audio_so, audio_la, audio_si;
    wire [15:0] audio_doh, audio_reh, audio_mih, audio_fah, audio_soh, audio_lah, audio_sih;
    wire [15:0] audio_left, audio_right;
    
    
clock_generator U_CG(
    .clk(fcrystal),
    .rst_n(rst_n), 
    .clk_out1(clk_1), 
    .clk_out10(clk_10), 
    .clk_out100(clk_100), 
    .clk_out10K(clk_10K), 
    .clk_ssd(clk_s)
);
buzzer_control U_do(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Do),
    .audio_left(audio_do),
    .audio_right(audio_do)
);   
buzzer_control U_re(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Re),
    .audio_left(audio_re),
    .audio_right(audio_re)
);   
buzzer_control U_mi(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Mi),
    .audio_left(audio_mi),
    .audio_right(audio_mi)
);
buzzer_control U_fa(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Fa),
    .audio_left(audio_fa),
    .audio_right(audio_fa)
);     
buzzer_control U_so(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`So),
    .audio_left(audio_so),
    .audio_right(audio_so)
);
buzzer_control U_la(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`La),
    .audio_left(audio_la),
    .audio_right(audio_la)
);     
buzzer_control U_si(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Si),
    .audio_left(audio_si),
    .audio_right(audio_si)
);
buzzer_control U_doh(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Doh),
    .audio_left(audio_doh),
    .audio_right(audio_doh)
);   
buzzer_control U_reh(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Reh),
    .audio_left(audio_reh),
    .audio_right(audio_reh)
);   
buzzer_control U_mih(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Mih),
    .audio_left(audio_mih),
    .audio_right(audio_mih)
);
buzzer_control U_fah(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Fah),
    .audio_left(audio_fah),
    .audio_right(audio_fah)
);     
buzzer_control U_soh(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Soh),
    .audio_left(audio_soh),
    .audio_right(audio_soh)
);
buzzer_control U_lah(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Lah),
    .audio_left(audio_lah),
    .audio_right(audio_lah)
);     
buzzer_control U_sih(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .note_div(`Sih),
    .audio_left(audio_sih),
    .audio_right(audio_sih)
);

tune_select U_TS(
    .audio_do(audio_do),
    .audio_re(audio_re),
    .audio_mi(audio_mi),
    .audio_fa(audio_fa),
    .audio_so(audio_so),
    .audio_la(audio_la),
    .audio_si(audio_si),
    .audio_doh(audio_doh),
    .audio_reh(audio_reh),
    .audio_mih(audio_mih),
    .audio_fah(audio_fah),
    .audio_soh(audio_soh),
    .audio_lah(audio_lah),
    .audio_sih(audio_sih),
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
    .audio_left(audio_left),
    .audio_right(audio_right),
    .tune_signal_1(tune_signal_1),
    .tune_signal_2(tune_signal_2),
    .tune_signal_3(tune_signal_3)
    );
    
speaker_control U_SC(
    .fcrystal(fcrystal),
    .rst_n(rst_n),
    .audio_left(audio_left),
    .audio_right(audio_right),
    .audio_mclk(audio_mclk),
    .audio_lrck(audio_lrck),
    .audio_sck(audio_sck),
    .audio_din(audio_sdin)
    );
scanctl U_S(
    .ssd_ctl(ssd_ctl), // ssd display control signal 
    .ssd_in(ssd_in), // output to ssd display
    .in0(4'd0), // 1st input
    .in1(tune_signal_1), // 2nd input
    .in2(tune_signal_2), // 3st input
    .in3(tune_signal_3), // 4nd input
    .clk_ssd(clk_s) // divided clock for scan control
);
// SSD display
SSDdisplay U_SD(
    .segs(segs),
    .bin(ssd_in)
);
endmodule
