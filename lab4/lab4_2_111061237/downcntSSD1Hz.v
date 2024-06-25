`timescale 1ns / 1ps

module syndwcount1Hz(
    clk, // clock from oscillator
    reset, // active low reset
    segs,
    ssd_ctl
);

input clk; // clock from oscillator
input reset; // active low reset
output [7:0] segs;
output [3:0] ssd_ctl;
wire clk_d; // frequency-divided clock
wire [1:0] clk_s;
wire [3:0] cnt_out; // binary counter output

// Frequency Divider
count50M U_FD0(
    .clk_out(clk_d), //divided clock output
    .clk_ssd(clk_s),
    .clk(clk), // clock from the 40MHz oscillator
    .reset(reset) // low active reset
);
// Binary Counter
syndwcount U_BC(
    .q(cnt_out), //counter output
    .clk(clk_d), // clock
    .reset(reset) //active low reset
);
// SSD display
SSDdisplay U_SD(
    .ssd_in(segs), 
    .ssd_ctl(ssd_ctl), 
    .cnt_out(cnt_out)
);
endmodule
   