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
    input [15:0] volume_min,
    input [15:0] volume_max,
    input [21:0] note_div_left,
    input [21:0] note_div_right,
    output [15:0] audio_left,
    output [15:0] audio_right
    );
    reg [21:0] clk_cnt_left_next, clk_cnt_left, clk_cnt_right_next, clk_cnt_right; 
    reg b_clk_left, b_clk_left_next; 
    reg b_clk_right, b_clk_right_next;
    
    // Left Note frequency generation 
    always @(posedge fcrystal or negedge rst_n) 
        if (~rst_n) begin 
            clk_cnt_left <= 22'd0; 
            b_clk_left <= 1'b0; 
        end 
        else begin 
            clk_cnt_left <= clk_cnt_left_next; 
            b_clk_left <= b_clk_left_next; 
        end 
    always @* 
        if (clk_cnt_left == note_div_left) begin 
            clk_cnt_left_next = 22'd0; 
            b_clk_left_next = ~b_clk_left; 
        end 
        else begin 
            clk_cnt_left_next = clk_cnt_left + 1'b1; 
            b_clk_left_next = b_clk_left; 
        end 
    
    // Right Note frequency generation 
    always @(posedge fcrystal or negedge rst_n) 
        if (~rst_n) begin 
            clk_cnt_right <= 22'd0; 
            b_clk_right <= 1'b0; 
        end 
        else begin 
            clk_cnt_right <= clk_cnt_right_next; 
            b_clk_right <= b_clk_right_next; 
        end 
    always @* 
        if (clk_cnt_right == note_div_right) begin 
            clk_cnt_right_next = 22'd0; 
            b_clk_right_next = ~b_clk_right; 
        end 
        else begin 
            clk_cnt_right_next = clk_cnt_right + 1'b1; 
            b_clk_right_next = b_clk_right; 
        end 
    // Assign the amplitude of the note 
    assign audio_left = (b_clk_left == 1'b0) ? volume_min : volume_max; 
    assign audio_right = (b_clk_right == 1'b0) ? volume_min : volume_max; 

endmodule
