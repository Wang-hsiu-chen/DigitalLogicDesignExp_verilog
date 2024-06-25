`timescale 1ns / 1ps

module synupcnt2bitBCD1Hz(
    clk, // clock from oscillator
    reset, // active low reset
    segs,
    ssd_ctl,
);

input clk; // clock from oscillator
input reset; // active low reset
output [7:0] segs;
output [3:0] ssd_ctl;
wire clk_d, clk_s, carry0, carry1;
wire [3:0] cnt_digit0, cnt_digit1, ssd_in; // binary counter output

// Frequency Divider
count50M U_FD0(
    .clk_out(clk_d), //divided clock output
    .clk_ssd(clk_s),
    .clk(clk), // clock from the 40MHz oscillator
    .reset(reset) // low active reset
);
// Binary Counter
synupcnt_BCD U_SC0(
    .enable(4'd9),
    .q(cnt_digit0), //counter output
    .carry(carry0),
    .clk(clk_d), // clock
    .reset(reset) //active low reset
);
synupcnt_BCD U_SC1(
    .enable(cnt_digit0),
    .q(cnt_digit1), //counter output
    .carry(carry1),
    .clk(clk_d), // clock
    .reset(reset) //active low reset
);
scanctl_2bitBCD U_SC(
    .ssd_ctl(ssd_ctl), // ssd display control signal 
    .ssd_in(ssd_in), // output to ssd display
    .in0(cnt_digit1), // 1st input
    .in1(cnt_digit0), // 2nd input
    .in2(cnt_digit1), // 3st input
    .in3(cnt_digit0), // 4nd input
    .clk_ssd(clk_s) // divided clock for scan control
);
// SSD display
SSDdisplay_2bitBCD U_SD(
    .segs(segs),
    .bin(ssd_in)
);
endmodule
   