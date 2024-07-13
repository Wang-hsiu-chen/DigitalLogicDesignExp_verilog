//a  D  e  F  i  L  M  o  R  S  '' h
//1  2  3  4  5  6  7  8  9  10 11 12
module tune_select(
    input [15:0] audio_do,
    input [15:0] audio_re,
    input [15:0] audio_mi,
    input [15:0] audio_fa,
    input [15:0] audio_so,
    input [15:0] audio_la,
    input [15:0] audio_si,
    input [15:0] audio_doh,
    input [15:0] audio_reh,
    input [15:0] audio_mih,
    input [15:0] audio_fah,
    input [15:0] audio_soh,
    input [15:0] audio_lah,
    input [15:0] audio_sih,
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
    output reg [15:0] audio_left,
    output reg [15:0] audio_right,
    output reg [3:0] tune_signal_1,
    output reg [3:0] tune_signal_2,
    output reg [3:0] tune_signal_3
);
    
always @*
    if (tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_do;
        audio_right = audio_do;
        tune_signal_1 = 4'd11;
        tune_signal_2 = 4'd2;
        tune_signal_3 = 4'd8;
    end
    else if (~tune_do_in && tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_re;
        audio_right = audio_re;
        tune_signal_1 = 4'd11;
        tune_signal_2 = 4'd9;
        tune_signal_3 = 4'd3;
    end
    else if (~tune_do_in && ~tune_re_in && tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_mi;
        audio_right = audio_mi;
        tune_signal_1 = 4'd11;
        tune_signal_2 = 4'd7;
        tune_signal_3 = 4'd5;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_fa;
        audio_right = audio_fa;
        tune_signal_1 = 4'd11;
        tune_signal_2 = 4'd4;
        tune_signal_3 = 4'd1;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_so;
        audio_right = audio_so;
        tune_signal_1 = 4'd11;
        tune_signal_2 = 4'd10;
        tune_signal_3 = 4'd8;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_la;
        audio_right = audio_la;
        tune_signal_1 = 4'd11;
        tune_signal_2 = 4'd6;
        tune_signal_3 = 4'd1;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_si;
        audio_right = audio_si;
        tune_signal_1 = 4'd11;
        tune_signal_2 = 4'd10;
        tune_signal_3 = 4'd5;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_doh;
        audio_right = audio_doh;
        tune_signal_1 = 4'd2;
        tune_signal_2 = 4'd8;
        tune_signal_3 = 4'd12;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_reh;
        audio_right = audio_reh;
        tune_signal_1 = 4'd9;
        tune_signal_2 = 4'd3;
        tune_signal_3 = 4'd12;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_mih;
        audio_right = audio_mih;
        tune_signal_1 = 4'd7;
        tune_signal_2 = 4'd5;
        tune_signal_3 = 4'd12;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_fah;
        audio_right = audio_fah;
        tune_signal_1 = 4'd4;
        tune_signal_2 = 4'd1;
        tune_signal_3 = 4'd12;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_soh;
        audio_right = audio_soh;
        tune_signal_1 = 4'd10;
        tune_signal_2 = 4'd8;
        tune_signal_3 = 4'd12;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && tune_lah_in && ~tune_sih_in) begin
        audio_left = audio_lah;
        audio_right = audio_lah;
        tune_signal_1 = 4'd6;
        tune_signal_2 = 4'd1;
        tune_signal_3 = 4'd12;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && tune_sih_in) begin
        audio_left = audio_sih;
        audio_right = audio_sih;
        tune_signal_1 = 4'd10;
        tune_signal_2 = 4'd5;
        tune_signal_3 = 4'd12;
    end
    else begin
        audio_left = 16'd0;
        audio_right = 16'd0;
        tune_signal_1 = 4'd11;
        tune_signal_2 = 4'd11;
        tune_signal_3 = 4'd11;
    end

endmodule
