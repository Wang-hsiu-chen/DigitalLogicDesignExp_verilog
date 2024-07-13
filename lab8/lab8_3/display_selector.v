`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/08 12:33:53
// Design Name: 
// Module Name: display_selector
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
`define IN_A0 3'd0
`define IN_A1 3'd1
`define A_DONE 3'd2
`define MODE  3'd3
`define IN_B0 3'd4
`define B_DONE 3'd5
`define ENTER 3'd6

`define M_S 2'd0
`define M_A 2'd1
`define M_M 2'd2 
`define M_N 2'd3 // NONE

module display_selector(
    input [1:0] mode,
    input [3:0] a0,
    input [3:0] a1,
    input [3:0] b0,
    input [3:0] b1,
    input [3:0] A0,
    input [3:0] A1,
    input [3:0] A2,
    input [3:0] S0,
    input [3:0] S1,
    input minor,
    input [3:0] M0,
    input [3:0] M1,
    input [3:0] M2,
    input [3:0] M3,
    input [2:0] next_state,
    output reg [3:0] d0,
    output reg [3:0] d1,
    output reg [3:0] d2,
    output reg [3:0] d3
    );
    
    always @* begin
        if (next_state == `IN_A0 || next_state == `IN_A1 || next_state == `A_DONE) begin
            d0 = a0;
            d1 = a1;
            d2 = 4'd15;
            d3 = 4'd15;
        end
        else if (next_state == `IN_B0 || next_state == `B_DONE) begin
            d0 = b0;
            d1 = b1;
            d2 = 4'd15;
            d3 = 4'd15;
        end
        else if (next_state == `MODE && mode == `M_S) begin
            d0 = 4'd11;
            d1 = 4'd15;
            d2 = 4'd15;
            d3 = 4'd15;
        end
        else if (next_state == `MODE && mode == `M_A) begin
            d0 = 4'd10;
            d1 = 4'd15;
            d2 = 4'd15;
            d3 = 4'd15;
        end
        else if (next_state == `MODE && mode == `M_M) begin
            d0 = 4'd12;
            d1 = 4'd15;
            d2 = 4'd15;
            d3 = 4'd15;
        end
        else if (next_state == `ENTER && mode == `M_S) begin
            d0 = S0;
            d1 = S1;
            if (minor) d2 = 4'd11;
            else       d2 = 4'd15;
            d3 = 4'd15;
        end
        else if (next_state == `ENTER && mode == `M_A) begin
            d0 = A0;
            d1 = A1;
            d2 = A2;
            d3 = 4'd15;
        end
        else if (next_state == `ENTER && mode == `M_M) begin
            d0 = M0;
            d1 = M1;
            d2 = M2;
            d3 = M3;
        end
        else begin
            d0 = 4'd15;
            d1 = 4'd15;
            d2 = 4'd15;
            d3 = 4'd15;
        end
    end
    
endmodule
