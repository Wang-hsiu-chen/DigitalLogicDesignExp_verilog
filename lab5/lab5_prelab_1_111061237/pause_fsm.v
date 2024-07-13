`timescale 1ns / 1ps
`define STAT_PAUSE 0
`define STAT_COUNT 1
`define STAT_DEF 2
`define ENABLED 1
`define DISABLED 0
module pause_fsm(
    count_enable, // if counter is enabled 
    in, //input control
    clk, // global clock signal
    reset // low active reset
);
// outputs
output count_enable; // if counter is enabled 
// inputs
input clk; // global clock signal
input reset; // low active reset
input in; //input control
reg count_enable; // if counter is enabled 
reg state; // state of FSM
reg next_state; // next state of FSM
// FSM state decision
always @*
    case (state)
    `DISABLED:
        if (in) begin
            next_state = `STAT_COUNT;
            count_enable = `ENABLED;
        end
        else begin
            next_state = `STAT_PAUSE;
            count_enable = `DISABLED;
        end
    `ENABLED:
        if (in) begin
            next_state = `STAT_PAUSE;
            count_enable = `DISABLED;
        end
        else begin
            next_state = `STAT_COUNT;
            count_enable = `ENABLED;
        end
    endcase
// FSM state transition
always @(posedge clk or negedge reset)
    if (~reset)
        state <= `STAT_COUNT;
    else
        state <= next_state;
endmodule