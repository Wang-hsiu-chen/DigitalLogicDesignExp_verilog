`timescale 1ns / 1ps
`define STAT_LAP 0
`define STAT_COUNT 1
`define ENABLED 1
`define DISABLED 0
module lap_fsm(
    counter_lap, // if counter is enabled 
    in, //input control
    clk, // global clock signal
    reset // low active reset
);
// outputs
output counter_lap; // if counter is enabled 
// inputs
input clk; // global clock signal
input reset; // low active reset
input in; //input control
reg counter_lap; // if counter is enabled 
reg state; // state of FSM
reg next_state; // next state of FSM
// FSM state decision
always @*
    case (state)
    `STAT_LAP:
        if (in) begin
            next_state = `STAT_COUNT;
            counter_lap = `DISABLED;
        end
        else begin
            next_state = `STAT_LAP;
            counter_lap = `ENABLED;
        end
    `STAT_COUNT:
        if (in) begin
            next_state = `STAT_LAP;
            counter_lap = `ENABLED;
        end
        else begin
            next_state = `STAT_COUNT;
            counter_lap = `DISABLED;
        end
    endcase
// FSM state transition
always @(posedge clk or negedge reset)
    if (~reset)
        state <= `STAT_COUNT;
    else
        state <= next_state;
endmodule