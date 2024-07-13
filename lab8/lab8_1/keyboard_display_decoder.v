`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/28 00:16:38
// Design Name: 
// Module Name: keyboard_display_decoder
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


module keyboard_display_decoder(
    input [8:0] last_change,
    output [3:0] ssd_ctl,
    output reg [3:0] code
    );
    
    assign ssd_ctl = 4'b0111;
    
    always @*
        case (last_change)
            // up
            9'h045: code = 4'd0;  // 0
            9'h016: code = 4'd1;  // 1
            9'h01e: code = 4'd2;  // 2
            9'h026: code = 4'd3;  // 3
            9'h025: code = 4'd4;  // 4
            9'h02e: code = 4'd5;  // 5
            9'h036: code = 4'd6;  // 6
            9'h03d: code = 4'd7;  // 7
            9'h03e: code = 4'd8;  // 8
            9'h046: code = 4'd9;  // 9
            // right
            9'h070: code = 4'd0;  // 0
            9'h069: code = 4'd1;  // 1
            9'h072: code = 4'd2;  // 2
            9'h07a: code = 4'd3;  // 3
            9'h06b: code = 4'd4;  // 4
            9'h073: code = 4'd5;  // 5
            9'h074: code = 4'd6;  // 6
            9'h06c: code = 4'd7;  // 7
            9'h075: code = 4'd8;  // 8
            9'h07d: code = 4'd9;  // 9
            9'h15a: code = 4'd15;  // right enter
            9'h05a: code = 4'd15;  // enter -> f
            9'h01c: code = 4'd10;  // A -> a
            9'h01b: code = 4'd11;  // S -> b
            9'h03a: code = 4'd12;  // M -> c
            default: code = 4'd15;
        endcase
endmodule
