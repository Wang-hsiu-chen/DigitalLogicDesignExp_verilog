module music_select(
    input tempo_clk,
    input rst_n,
    input music1,
    output reg [21:0] tune_left,
    output reg [21:0] tune_right
);
wire [21:0] tune_left1, tune_right1;

always @* begin
    if (music1) begin
        tune_left = tune_left1;
        tune_right = tune_right1;
    end
    else begin
        tune_left = 22'd100;
        tune_right = 22'd100;
    end
end

music1 U_M1(
    .rst_n(rst_n),
    .tempo_clk(tempo_clk),
    .tune_left(tune_left1),
    .tune_right(tune_right1)
);
endmodule