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
//a  D  e  F  i  L  M  o  R  S  ''
//1  2  3  4  5  6  7  8  9  10 11
module tune_select(
    input clk_100,
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
    output reg [21:0] tune_left,
    output reg [21:0] tune_right,
    output reg [3:0] tune_signal_1,
    output reg [3:0] tune_signal_2
);

always @* begin
    if (tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `Do;
        tune_right = `Do;
        tune_signal_1 = 4'd2;
        tune_signal_2 = 4'd8;
    end
    else if (~tune_do_in && tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `Re;
        tune_right = `Re;
        tune_signal_1 = 4'd9;
        tune_signal_2 = 4'd3;
    end
    else if (~tune_do_in && ~tune_re_in && tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `Mi;
        tune_right = `Mi;
        tune_signal_1 = 4'd7;
        tune_signal_2 = 4'd5;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `Fa;
        tune_right = `Fa;
        tune_signal_1 = 4'd4;
        tune_signal_2 = 4'd1;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `So;
        tune_right = `So;
        tune_signal_1 = 4'd10;
        tune_signal_2 = 4'd8;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `La;
        tune_right = `La;
        tune_signal_1 = 4'd6;
        tune_signal_2 = 4'd1;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `Si;
        tune_right = `Si;
        tune_signal_1 = 4'd10;
        tune_signal_2 = 4'd5;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `Doh;
        tune_right = `Doh;
        tune_signal_1 = 4'd2;
        tune_signal_2 = 4'd8;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `Reh;
        tune_right = `Reh;
        tune_signal_1 = 4'd9;
        tune_signal_2 = 4'd3;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `Mih;
        tune_right = `Mih;
        tune_signal_1 = 4'd7;
        tune_signal_2 = 4'd5;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && tune_fah_in && ~tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `Fah;
        tune_right = `Fah;
        tune_signal_1 = 4'd4;
        tune_signal_2 = 4'd1;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && tune_soh_in && ~tune_lah_in && ~tune_sih_in) begin
        tune_left = `Soh;
        tune_right = `Soh;
        tune_signal_1 = 4'd10;
        tune_signal_2 = 4'd8;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && tune_lah_in && ~tune_sih_in) begin
        tune_left = `Lah;
        tune_right = `Lah;
        tune_signal_1 = 4'd6;
        tune_signal_2 = 4'd1;
    end
    else if (~tune_do_in && ~tune_re_in && ~tune_mi_in && ~tune_fa_in && ~tune_so_in && ~tune_la_in && ~tune_si_in && ~tune_doh_in && ~tune_reh_in && ~tune_mih_in && ~tune_fah_in && ~tune_soh_in && ~tune_lah_in && tune_sih_in) begin
        tune_left = `Sih;
        tune_right = `Sih;
        tune_signal_1 = 4'd10;
        tune_signal_2 = 4'd5;
    end
    else begin
        tune_left = 22'd100;
        tune_right = 22'd100;
        tune_signal_1 = 4'd11;
        tune_signal_2 = 4'd11;
    end
end

endmodule