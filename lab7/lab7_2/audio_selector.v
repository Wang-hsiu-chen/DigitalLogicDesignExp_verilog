`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/23 00:59:53
// Design Name: 
// Module Name: audio_selector
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


module audio_selector(
    input [15:0] audio_left_do,
    input [15:0] audio_right_do,
    input [15:0] audio_left_re,
    input [15:0] audio_right_re,
    input [15:0] audio_left_mi,
    input [15:0] audio_right_mi,
    output reg [15:0] audio_left,
    output reg [15:0] audio_right,
    input pb_left_de,
    input pb_center_de,
    input pb_right_de
    );
    
    always @*
        if (pb_left_de) begin
            audio_left = audio_left_do;
            audio_right = audio_right_do;
        end
        else if (pb_center_de) begin
            audio_left = audio_left_re;
            audio_right = audio_right_re;
        end
        else if (pb_right_de) begin
            audio_left = audio_left_mi;
            audio_right = audio_right_mi;
        end
        else begin
            audio_left = 16'd0;
            audio_right = 16'd0;
        end
    
endmodule
