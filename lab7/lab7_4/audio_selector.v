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
    input [15:0] audio_left_do_mi,
    input [15:0] audio_left_re_fa,
    input [15:0] audio_left_mi_so,
    input [15:0] audio_left_fa_la,
    input [15:0] audio_left_so_si,
    input [15:0] audio_right_do_mi,
    input [15:0] audio_right_re_fa,    
    input [15:0] audio_right_mi_so,
    input [15:0] audio_right_fa_la,
    input [15:0] audio_right_so_si,
    output reg [15:0] audio_left,
    output reg [15:0] audio_right,
    input pb_left_de,
    input pb_center_de,
    input pb_right_de,
    input pb_up_de,
    input pb_down_de
    );
    
    always @*
        if (pb_left_de) begin
            audio_left = audio_left_do_mi;
            audio_right = audio_right_do_mi;
        end
        else if (pb_center_de) begin
            audio_left = audio_left_re_fa;
            audio_right = audio_right_re_fa;
        end
        else if (pb_right_de) begin
            audio_left = audio_left_mi_so;
            audio_right = audio_right_mi_so;
        end
        else if (pb_up_de) begin
            audio_left = audio_left_fa_la;
            audio_right = audio_right_fa_la;
        end
        else if (pb_down_de) begin
            audio_left = audio_left_so_si;
            audio_right = audio_right_so_si;
        end
        else begin
            audio_left = 16'd0;
            audio_right = 16'd0;
        end
    
endmodule
