`define Lal 22'd227273
`define Sil 22'd204082
`define Do 22'd191571
`define Re 22'd170648
`define Mi 22'd151515
`define Fa 22'd143266
`define So 22'd127551
`define La 22'd113636
`define Si 22'd101214
`define Doh 22'd95419
`define Reh 22'd85034
`define Mih 22'd75757
`define Fah 22'd71633
`define Soh 22'd63776
`define Lah 22'd56818
`define Sih 22'd50607
module tune_select(
    input clk_100,
    input rst_n,
    input mode_switch,
    input tune_do_in,
    input tune_re_in,
    input tune_mi_in,
    input tune_fa_in,
    input tune_so_in,
    output reg [21:0] tune_left,
    output reg [21:0] tune_right
);
wire tune_do_out, tune_re_out, tune_mi_out, tune_fa_out, tune_so_out;
debounce_circuit U_DCdo(
    .clk(clk_100), // clock control
    .rst_n(rst_n), // rst_n
    .pb_in(tune_do_in), //push button input
    .pb_deb(tune_do_out) // debounced push button out
);
debounce_circuit U_DCre(
    .clk(clk_100), // clock control
    .rst_n(rst_n), // rst_n
    .pb_in(tune_re_in), //push button input
    .pb_deb(tune_re_out) // debounced push button out
);
debounce_circuit U_DCmi(
    .clk(clk_100), // clock control
    .rst_n(rst_n), // rst_n
    .pb_in(tune_mi_in), //push button input
    .pb_deb(tune_mi_out) // debounced push button out
);
debounce_circuit U_DCfa(
    .clk(clk_100), // clock control
    .rst_n(rst_n), // rst_n
    .pb_in(tune_fa_in), //push button input
    .pb_deb(tune_fa_out) // debounced push button out
);
debounce_circuit U_DCso(
    .clk(clk_100), // clock control
    .rst_n(rst_n), // rst_n
    .pb_in(tune_so_in), //push button input
    .pb_deb(tune_so_out) // debounced push button out
);

always @* begin
    if (mode_switch) begin
        if (tune_do_out && ~tune_re_out && ~tune_mi_out && ~tune_fa_out && ~tune_so_out) begin
            tune_left = `Do;
            tune_right = `Mi;
        end
        else if (~tune_do_out && tune_re_out && ~tune_mi_out && ~tune_fa_out && ~tune_so_out) begin
            tune_left = `Re;
            tune_right = `Fa;
        end
        else if (~tune_do_out && ~tune_re_out && tune_mi_out && ~tune_fa_out && ~tune_so_out) begin
            tune_left = `Mi;
            tune_right = `So;
        end
        else if (~tune_do_out && ~tune_re_out && ~tune_mi_out && tune_fa_out && ~tune_so_out) begin
            tune_left = `Fa;
            tune_right = `La;
        end
        else if (~tune_do_out && ~tune_re_out && ~tune_mi_out && ~tune_fa_out && tune_so_out) begin
            tune_left = `So;
            tune_right = `Si;
        end
        else begin
            tune_left = 22'd100;
            tune_right = 22'd100;
        end
    end
    else begin
        if (tune_do_out && ~tune_re_out && ~tune_mi_out && ~tune_fa_out && ~tune_so_out) begin
            tune_left = `Do;
            tune_right = 22'd100;
        end
        else if (~tune_do_out && tune_re_out && ~tune_mi_out && ~tune_fa_out && ~tune_so_out) begin
            tune_left = `Re;
            tune_right = 22'd100;
        end
        else if (~tune_do_out && ~tune_re_out && tune_mi_out && ~tune_fa_out && ~tune_so_out) begin
            tune_left = `Mi;
            tune_right = 22'd100;
        end
        else if (~tune_do_out && ~tune_re_out && ~tune_mi_out && tune_fa_out && ~tune_so_out) begin
            tune_left = `Fa;
            tune_right = 22'd100;
        end
        else if (~tune_do_out && ~tune_re_out && ~tune_mi_out && ~tune_fa_out && tune_so_out) begin
            tune_left = `So;
            tune_right = 22'd100;
        end
        else begin
            tune_left = 22'd100;
            tune_right = 22'd100;
        end
    end
end

endmodule