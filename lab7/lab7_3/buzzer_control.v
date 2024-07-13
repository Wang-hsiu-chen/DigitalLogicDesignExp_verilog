`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/22 01:30:09
// Design Name: 
// Module Name: buzzer_control
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


module buzzer_control(
    input fcrystal,
    input rst_n,
    input [21:0] note_div,
    output [15:0] audio_left,
    output [15:0] audio_right
);
reg [21:0] temp_clk_cnt, clk_cnt; 
reg b_clk, temp_b_clk; 
    
// Note frequency generation 
always @(posedge fcrystal or negedge rst_n) 
    if (~rst_n) begin 
        clk_cnt <= 22'd0; 
        b_clk <= 1'b0; 
    end 
    else begin 
        clk_cnt <= temp_clk_cnt; 
        b_clk <= temp_b_clk; 
    end 
always @* 
    if (clk_cnt == note_div) begin 
        temp_clk_cnt = 22'd0; 
        temp_b_clk = ~b_clk; 
    end 
    else begin 
        temp_clk_cnt = clk_cnt + 1'b1; 
        temp_b_clk = b_clk; 
    end 
// Assign the amplitude of the note 
assign audio_left = (b_clk == 1'b0) ? 16'hB000 : 16'h5FFF; 
assign audio_right = (b_clk == 1'b0) ? 16'hB000 : 16'h5FFF; 

endmodule
