`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/02 18:04:45
// Design Name: 
// Module Name: music_select
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`define La 22'd113636
module music_select(
    input clk, //2Hz
    input rst_n,
    input music_0, music_1, music_2,
    output reg [21:0] tune_left,
    output reg [21:0] tune_right
);
wire [21:0] tune_0, tune_2;

always @* begin
    if (music_0) begin
        tune_left = tune_0;
    end
    else if (music_2) begin
        tune_left = tune_2;
    end
    else begin
        tune_left = 22'd100;
    end
    if (music_1)
        tune_right = `La;
    else
        tune_right = 22'd100;
end

running_music U_RM(
    .rst_n(rst_n),
    .clk(clk),
    .music(music_0),
    .tune_left(tune_0)
);
celebrate_music U_CM(
    .rst_n(rst_n),
    .clk(clk),
    .music(music_2),
    .tune_left(tune_2)
);
endmodule
