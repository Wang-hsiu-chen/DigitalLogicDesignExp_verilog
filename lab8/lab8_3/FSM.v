`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/06 16:36:34
// Design Name: 
// Module Name: FSM
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

module FSM(
    input fcrystal,
    input rst_n,
    input key_valid,
    input [511:0] key_down,
    input [3:0] number,
    input add,
    input subtract,
    input multiply,
    input enter,
    input clear,
    output reg [3:0] a0,
    output reg [3:0] a1,
    output reg [3:0] b0,
    output reg [3:0] b1,
    output reg [1:0] mode,
    output reg [2:0] next_state
    );
    
    reg [2:0] state;
    reg [1:0] mode_t;
    reg [3:0] a0_t, a1_t, b0_t, b1_t;
    
    always @* begin
        
        case (state)
            `IN_A0: begin
                if (key_down && key_valid && number != 4'd15) begin
                    a0_t = number;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `IN_A1;
                end
                else if (key_down && key_valid && clear) begin
                    a0_t = 4'd0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `IN_A0;
                end
                else if (key_down && key_valid && subtract) begin
                    a0_t = 4'd0;
                    a1_t = 4'd0;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_S; 
                    next_state = `MODE;
                end
                else if (key_down && key_valid && add) begin
                    a0_t = 4'd0;
                    a1_t = 4'd0;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_A; 
                    next_state = `MODE;
                end
                else if (key_down && key_valid && multiply) begin
                    a0_t = 4'd0;
                    a1_t = 4'd0;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_M; 
                    next_state = `MODE;
                end
                else begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `IN_A0;
                end
             end
            `IN_A1: begin
                if (key_down && key_valid && number != 4'd15) begin
                    a1_t = a0;
                    a0_t = number;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `A_DONE;
                end
                else if (key_down && key_valid && clear) begin
                    a0_t = 4'd0;
                    a1_t = 4'd15;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `IN_A0;
                end
                else if (key_down && key_valid && subtract) begin
                    a0_t = a0;
                    a1_t = 4'd0;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_S; 
                    next_state = `MODE;
                end
                else if (key_down && key_valid && add) begin
                    a0_t = a0;
                    a1_t = 4'd0;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_A; 
                    next_state = `MODE;
                end
                else if (key_down && key_valid && multiply) begin
                    a0_t = a0;
                    a1_t = 4'd0;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_M; 
                    next_state = `MODE;
                end
                else begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `IN_A1;
                end
            end
            `A_DONE: begin
                if (key_down && key_valid && subtract) begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_S; 
                    next_state = `MODE;
                end
                else if (key_down && key_valid && add) begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_A; 
                    next_state = `MODE;
                end
                else if (key_down && key_valid && multiply) begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_M; 
                    next_state = `MODE;
                end
                else if (key_down && key_valid && clear) begin
                    a0_t = 4'd0;
                    a1_t = 4'd15;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `IN_A0;
                end
                else begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `A_DONE;
                end
            end
            `MODE: begin
                if (key_down && key_valid && number != 4'd15) begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = number;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `IN_B0;
                end
                else if (key_down && key_valid && clear) begin
                    a0_t = 4'd0;
                    a1_t = 4'd15;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_N;
                    next_state = `IN_A0;
                end
                else if (key_down && key_valid && subtract) begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_S; 
                    next_state = `MODE;
                end
                else if (key_down && key_valid && add) begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_A; 
                    next_state = `MODE;
                end
                else if (key_down && key_valid && multiply) begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = `M_M;
                    next_state = `MODE;
                end
                else begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `MODE;
                end
            end
            `IN_B0: begin
                if (key_down && key_valid && number != 4'd15) begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = number;
                    b1_t = b0;
                    mode_t = mode;
                    next_state = `B_DONE;
                end
                else if (key_down && key_valid && clear) begin
                    a0_t = 4'd0;
                    a1_t = 4'd15;
                    b0_t = 4'd15;
                    b1_t = b1;
                    mode_t = `M_N;
                    next_state = `IN_A0;
                end
                else if (key_down && key_valid && enter) begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = 4'd0;
                    mode_t = mode;
                    next_state = `ENTER;
                end
                else begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `IN_B0;
                end
            end
            `B_DONE: begin
                if (key_down && key_valid && enter) begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `ENTER;
                end
                else if (key_down && key_valid && clear) begin
                    a0_t = 4'd0;
                    a1_t = 4'd15;
                    b0_t = 4'd15;
                    b1_t = 4'd15;
                    mode_t = `M_N;
                    next_state = `IN_A0;
                end
                else begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `B_DONE;
                end
            end
            `ENTER: begin
                if (key_down && key_valid && clear) begin
                    a0_t = 4'd0;
                    a1_t = 4'd15;
                    b0_t = 4'd15;
                    b1_t = 4'd15;
                    mode_t = `M_N;
                    next_state = `IN_A0;
                end 
                else begin
                    a0_t = a0;
                    a1_t = a1;
                    b0_t = b0;
                    b1_t = b1;
                    mode_t = mode;
                    next_state = `ENTER;
                end
            end
            default: begin
                a0_t = 4'd0;
                a1_t = 4'd15;
                b0_t = 4'd15;
                b1_t = 4'd15;
                mode_t = `M_N;
                next_state = `IN_A0;
            end
        endcase  
    end
    always @(posedge fcrystal or negedge rst_n) 
        if (~rst_n) begin
            a0 <= 4'd0;
            a1 <= 4'd15;
            b0 <= 4'd15;
            b1 <= 4'd15;
            mode <= `M_N;
            state <= `IN_A0;
        end
        else begin
            a0 <= a0_t;
            a1 <= a1_t;
            b0 <= b0_t;
            b1 <= b1_t;
            mode <= mode_t;
            state <= next_state;
        end
endmodule
