`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/02 18:05:57
// Design Name: 
// Module Name: running_music
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


`define Lah 22'd56818
`define Sih 22'd50607
module running_music(
    input rst_n,
    input clk, //2Hz
    input music,
    output reg [21:0] tune_left
);
reg [1:0] cnt_tem, cnt;

always @* begin
    if (music) begin
        cnt_tem = cnt + 1'b1;
        case (cnt)
            5'b00000:
                tune_left = `Lah;
            5'b00001:
                tune_left = `Sih;
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
        cnt <= 2'd0;
    end
    else begin
        cnt <= cnt_tem;
    end
end   
    
endmodule
