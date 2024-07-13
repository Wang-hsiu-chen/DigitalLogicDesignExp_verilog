`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/06 16:39:17
// Design Name: 
// Module Name: keyboard_signal_decoder
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


module keyboard_signal_decoder(
    input [8:0] last_change,
    input key_valid,
    output reg [3:0] number,
    output reg add,
    output reg subtract,
    output reg multiply,
    output reg enter,
    output reg clear
    );
    
    always @* begin
        number = 4'd15;
        enter = 1'b0;
        add = 1'b0;
        subtract = 1'b0;
        multiply = 1'b0;
        clear = 1'b0;
        case (last_change)
            9'h070: number = 4'd0;  // 0
            9'h069: number = 4'd1;  // 1
            9'h072: number = 4'd2;  // 2
            9'h07a: number = 4'd3;  // 3
            9'h06b: number = 4'd4;  // 4
            9'h073: number = 4'd5;  // 5
            9'h074: number = 4'd6;  // 6
            9'h06c: number = 4'd7;  // 7
            9'h075: number = 4'd8;  // 8
            9'h07d: number = 4'd9;  // 9
            9'h15a: enter = 1'b1;
            9'h05a: enter = 1'b1;
            9'h07c: multiply = 1'b1;
            9'h07b: subtract = 1'b1;
            9'h079: add = 1'b1;
            9'h071: clear = 1'b1;
            default: begin 
                number = 4'd15;
                enter = 1'b0;
                add = 1'b0;
                subtract = 1'b0;
                multiply = 1'b0;
                clear = 1'b0;
            end
        endcase 
    end
endmodule
