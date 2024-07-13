`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/27 01:05:49
// Design Name: 
// Module Name: FSM_for_counter_enable
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

`define CNT_STA 1
`define PAS_STA 0
`define ENABLE 1
`define DISABLE 0

module FSM_for_counter_enable(
    input pa_st,
    input clk,
    input rst_n,
    input reset,
    output cnt_en
    );
    
    reg state, next_state, cnt_en;
    
    always @*
        case (state)
            `DISABLE:
                if (pa_st) begin
                    next_state = `CNT_STA;
                    cnt_en = `ENABLE;
                end
                else begin 
                    next_state = `PAS_STA;
                    cnt_en = `DISABLE;
                end
            `ENABLE:
                if (pa_st) begin
                    next_state = `PAS_STA;
                    cnt_en = `DISABLE;
                end
                else begin
                    next_state = `CNT_STA;
                    cnt_en = `ENABLE;
                end
            default:
                if (pa_st) begin
                    next_state = `CNT_STA;
                    cnt_en = `ENABLE;
                end
                else begin 
                    next_state = `PAS_STA;
                    cnt_en = `DISABLE;
                end
        endcase
       
    always @(posedge clk or negedge rst_n)
        if (~rst_n || reset) 
            state <= `PAS_STA;
        else
            state <= next_state;
endmodule
