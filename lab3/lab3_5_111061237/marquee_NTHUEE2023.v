`timescale 1ns / 1ps

`include "constant.v"
module marquee_NTHUEE2023(
    clk, // clock from oscillator
    reset, // active low reset
    segs,  // 7-segment display
    ssd_ctl // scan control for 7-segment display
);

input clk; // clock from oscillator
input reset; // active low reset
output [`SSD_BIT_WIDTH-1:0] segs; // 7-segment display out
output [`SSD_NUM-1:0] ssd_ctl;

wire clk_c; // frequency-divided clock
wire [`CNT_BIT_WIDTH-1:0] cnt; // binary counter output
wire [1:0] clk_ssd;
wire [`SSD_NUM-1:0] ssd_ctl;
wire [`CNT_BIT_WIDTH-1:0] ssd_in;

// Frequency Divider
freqdiv_marquee U_FD(
    .clk_count(clk_c), //divided clock output
    .clk_ssd(clk_ssd),
    .clk(clk), // clock from the 40MHz oscillator
    .reset(reset) // low active reset
);
// Binary Counter
ringcounter_marquee U_RC(
    .count(cnt), //counter output
    .clk(clk_c), // clock
    .reset(reset) //active low reset
);
// Scan control
scanctl_marquee U_SC(
  .ssd_ctl(ssd_ctl), // ssd display control signal 
  .ssd_in(ssd_in), // output to ssd display
  .in0({cnt[6:0], cnt[9:7]}), // 1st input
  .in1({cnt[7:0], cnt[9:8]}), // 2nd input
  .in2({cnt[8:0], cnt[9]}), // 3rd input
  .in3(cnt[9:0]),  // 4th input
  .clk_ssd(clk_ssd) // divided clock for scan control
);
// binary to 7-segment display decoder
display_marquee U_display(
    .segs(segs), // 7-segment display output
    .bin(ssd_in)  // BCD number input
);
endmodule
   