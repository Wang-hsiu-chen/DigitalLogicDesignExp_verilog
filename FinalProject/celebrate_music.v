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
module celebrate_music(
    input rst_n,
    input clk, //2Hz
    input music,
    output reg [21:0] tune_left
);
reg [4:0] cnt_tem, cnt;

always @* begin
    if (music) begin
        cnt_tem = cnt + 1'b1;
        case (cnt)
            5'b00000:
                tune_left = `Si;
            5'b00001:
                tune_left = `La;
            5'b00010:
                tune_left = `So;
            5'b00011:
                tune_left = `La;
            5'b00100:
                tune_left = `Si;
            5'b00101:
                tune_left = `Si;
            5'b00110:
                tune_left = `Si;
            5'b00111:
                tune_left = `Si;
            5'b01000:
                tune_left = `La;
            5'b01001:
                tune_left = `La;
            5'b01010:
                tune_left = `La;
            5'b01011:
                tune_left = `La;
            5'b01100:
                tune_left = `Si;
            5'b01101:
                tune_left = `Si;
            5'b01110:
                tune_left = `Si;
            5'b01111:
                tune_left = `Si;
            5'b10000:
                tune_left = `Si;
            5'b10001:
                tune_left = `La;
            5'b10010:
                tune_left = `So;
            5'b10011:
                tune_left = `La;
            5'b10100:
                tune_left = `Si;
            5'b10101:
                tune_left = `Si;
            5'b10110:
                tune_left = `Si;
            5'b10111:
                tune_left = `Si;
            5'b11000:
                tune_left = `La;
            5'b11001:
                tune_left = `La;
            5'b11010:
                tune_left = `Si;
            5'b11011:
                tune_left = `La;
            5'b11100:
                tune_left = `So;
            5'b11101:
                tune_left = `So;
            5'b11110:
                tune_left = `So;
            5'b11111:
                tune_left = `So;
            default:
                tune_left = 22'd100;
        endcase
    end
    else begin
        cnt_tem = cnt;
        tune_left = 22'd100;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        cnt <= 5'd0;
    end
    else begin
        cnt <= cnt_tem;
    end
end   
    
endmodule
