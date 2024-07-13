`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/22 00:31:56
// Design Name: 
// Module Name: speaker_ctl
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


module speaker_ctl(
    input fcrystal,
    input rst_n,
    input [15:0] audio_left,
    input [15:0] audio_right,
    output reg audio_mclk,
    output reg audio_lrck,
    output reg audio_sck,
    output reg audio_din
    );
    reg clk_1, clk_2;
    reg [3:0] clk_3;
    reg [8:0] clk_tem;
    reg [4:0] cnt_tem, cnt;
    reg serial_tem;
    reg [15:0] left_tem, right_tem;
    integer i;
    
    always @*
        clk_tem = {audio_lrck, clk_3, audio_sck, clk_2, audio_mclk, clk_1} + 1'b1;
    always @(posedge fcrystal or negedge rst_n)
        if (~rst_n)
            {audio_lrck, clk_3, audio_sck, clk_2, audio_mclk, clk_1} <= 9'd0;
        else 
            {audio_lrck, clk_3, audio_sck, clk_2, audio_mclk, clk_1} <= clk_tem;   
    
    
    always @* begin
        cnt_tem = cnt + 1'b1;
        case (cnt)
            5'b00000:
                serial_tem = left_tem[0];
            5'b00001:
                serial_tem = left_tem[15];
            5'b00010:
                serial_tem = left_tem[14];
            5'b00011:
                serial_tem = left_tem[13];
            5'b00100:
                serial_tem = left_tem[12];
            5'b00101:
                serial_tem = left_tem[11];
            5'b00110:
                serial_tem = left_tem[10];
            5'b00111:
                serial_tem = left_tem[9];
            5'b01000:
                serial_tem = left_tem[8];
            5'b01001:
                serial_tem = left_tem[7];
            5'b01010:
                serial_tem = left_tem[6];
            5'b01011:
                serial_tem = left_tem[5];
            5'b01100:
                serial_tem = left_tem[4];
            5'b01101:
                serial_tem = left_tem[3];
            5'b01110:
                serial_tem = left_tem[2];
            5'b01111:
                serial_tem = left_tem[1];
            5'b10000:
                serial_tem = right_tem[0];
            5'b10001:
                serial_tem = right_tem[15];
            5'b10010:
                serial_tem = right_tem[14];
            5'b10011:
                serial_tem = right_tem[13];
            5'b10100:
                serial_tem = right_tem[12];
            5'b10101:
                serial_tem = right_tem[11];
            5'b10110:
                serial_tem = right_tem[10];
            5'b10111:
                serial_tem = right_tem[9];
            5'b11000:
                serial_tem = right_tem[8];
            5'b11001:
                serial_tem = right_tem[7];
            5'b11010:
                serial_tem = right_tem[6];
            5'b11011:
                serial_tem = right_tem[5];
            5'b11100:
                serial_tem = right_tem[4];
            5'b11101:
                serial_tem = right_tem[3];
            5'b11110:
                serial_tem = right_tem[2];
            5'b11111:
                serial_tem = right_tem[1];
            default:
                serial_tem = 1'b0;
        endcase
    end


    always @(posedge audio_lrck or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < 16; i = i + 1) begin
            left_tem[i] <= 1'b0;
            right_tem[i] <= 1'b0;
            end
        end
        else begin
            for (i = 0; i < 16; i = i + 1)
            begin
                left_tem[i] <= audio_left[i];
                right_tem[i] <= audio_right[i];
            end
        end
    end
    
    always @(negedge audio_sck or negedge rst_n) begin
        if (~rst_n) begin
            cnt <= 5'd0;
            audio_din <= 1'd0;
        end
        else begin
            cnt <= cnt_tem;
            audio_din <= serial_tem;
        end
    end   
    
endmodule
