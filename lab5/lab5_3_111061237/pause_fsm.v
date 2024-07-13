`timescale 1ns / 1ps
`define STATE_PAUSE 0
`define STAT_COUNT 1
`define ENABLED 1
`define DISABLED 0
module pause_fsm(
    counter_pause, // if counter is enabled 
    in, //input control
    clk, // global clock signal
    reset // low active reset
);
// outputs
output counter_pause; // if counter is enabled 
// inputs
input clk; // global clock signal
input reset; // low active reset
input in; //input control
reg counter_pause; // if counter is enabled 
reg state; // state of FSM
reg next_state; // next state of FSM
// FSM state decision
always @*
    case (state)
    `STATE_PAUSE:
        if (in) begin
            next_state = `STAT_COUNT;
            counter_pause = `DISABLED;
        end
        else begin
            next_state = `STATE_PAUSE;
            counter_pause = `ENABLED;
        end
    `STAT_COUNT:
        if (in) begin
            next_state = `STATE_PAUSE;
            counter_pause = `ENABLED;
        end
        else begin
            next_state = `STAT_COUNT;
            counter_pause = `DISABLED;
        end
    endcase
// FSM state transition
always @(posedge clk or negedge reset)
    if (~reset)
        state <= `STAT_COUNT;
    else
        state <= next_state;
endmodule