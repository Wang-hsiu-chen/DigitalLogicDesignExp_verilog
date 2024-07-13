`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/08 21:58:28
// Design Name: 
// Module Name: FSM_caps
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

`define L 1'b0
`define U 1'b1

module FSM_caps(
    input [511:0] key_down,
    input key_valid,
    input fcrystal,
    input rst_n,
    output reg caps_lock
    );
    
    reg state, next_state;
    
    always @* begin
        case (state)
            `L: begin
                if (key_valid && key_down[9'h058]) begin
                    caps_lock = 1'b1;
                    next_state = `U;
                end
                else begin
                    caps_lock = 1'b0;
                    next_state = `L;
                end
            end
            `U: begin
                if (key_valid && key_down[9'h058]) begin
                    caps_lock = 1'b0;
                    next_state = `L;
                end
                else begin
                    caps_lock = 1'b1;
                    next_state = `U;
                end
            end
        endcase 
    end
    
    always @(posedge fcrystal or negedge rst_n)
        if (~rst_n) state <= `L;
        else state <= next_state;
endmodule
