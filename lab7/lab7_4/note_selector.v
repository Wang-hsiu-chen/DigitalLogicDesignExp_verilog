`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/23 12:06:51
// Design Name: 
// Module Name: note_selector
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
`define NOTE_DO 22'd191571
`define NOTE_RE 22'd170648
`define NOTE_MI 22'd151976
`define NOTE_FA 22'd143266
`define NOTE_SO 22'd127877
`define NOTE_LA 22'd113636
`define NOTE_SI 22'd101419



module note_selector(
    input chord_switch,
    output reg [22:0] note_left_do_mi,
    output reg [22:0] note_right_do_mi,
    output reg [22:0] note_left_re_fa,
    output reg [22:0] note_right_re_fa,
    output reg [22:0] note_left_mi_so,
    output reg [22:0] note_right_mi_so,
    output reg [22:0] note_left_fa_la,
    output reg [22:0] note_right_fa_la,
    output reg [22:0] note_left_so_si,
    output reg [22:0] note_right_so_si
    );
    
    always @* begin
        note_left_do_mi = `NOTE_DO;
        note_left_re_fa = `NOTE_RE;
        note_left_mi_so = `NOTE_MI;
        note_left_fa_la = `NOTE_FA;
        note_left_so_si = `NOTE_SO;
    end
    
    always @*
        if (~chord_switch) begin
            note_right_do_mi = `NOTE_DO;
            note_right_re_fa = `NOTE_RE;
            note_right_mi_so = `NOTE_MI;
            note_right_fa_la = `NOTE_FA;
            note_right_so_si = `NOTE_SO;
        end
        else begin
            note_right_do_mi = `NOTE_MI;
            note_right_re_fa = `NOTE_FA;
            note_right_mi_so = `NOTE_SO;
            note_right_fa_la = `NOTE_LA;
            note_right_so_si = `NOTE_SI;
        end
endmodule
