`timescale 1ns / 1ps

module syncount1Hz(
    clk, // clock from oscillator
    reset, // active low reset
    cnt_out
);

input clk; // clock from oscillator
input reset; // active low reset
output [3:0]cnt_out;
wire clk_d; // frequency-divided clock
wire [3:0] cnt_out; // binary counter output

// Frequency Divider
count50M U_FD0(
    .clk_out(clk_d), //divided clock output
    .clk(clk), // clock from the 40MHz oscillator
    .reset(reset) // low active reset
);
// Binary Counter
synupcount U_BC(
    .q(cnt_out), //counter output
    .clk(clk_d), // clock
    .reset(reset) //active low reset
);

endmodule
   