`timescale 1ns / 1ps

`include "constant.v"
module exam(
    clk, // clock from oscillator
    rst_n, // active low rst_n
    mode_selection,
    pb_in_l,
    pb_in_s,
    pb_in_r,
    segs,  // 7-segment display
    ssd_ctl // scan control for 7-segment display
);

input clk; // clock from oscillator
input rst_n, mode_selection;
input pb_in_l, pb_in_s, pb_in_r;
output [`SSD_BIT_WIDTH-1:0] segs; // 7-segment display out
output [`SSD_NUM-1:0] ssd_ctl;

wire clk_c, clk_100, clk_10K; // frequency-divided clock
wire pb_l, pb_s, pb_r;
wire [3:0] id_0, id_1, id_2, id_3, id_4, id_5, id_6, id_7, id_8; 
wire [3:0] counter_num, next_state;
wire [7:0] SSD_1, SSD_2, SSD_3, SSD_4, SSD_5, SSD_6, SSD_7, SSD_8, SSD_9;
wire [`CNT_BIT_WIDTH-1:0] cnt; // binary counter output
wire [1:0] clk_s;
wire [`SSD_NUM-1:0] ssd_ctl;
wire [`CNT_BIT_WIDTH-1:0] ssd_in;

// Frequency Divider
clock_generator U_CG(
    .clk_out1(clk_c), //divided clock output
    .clk_out100(clk_100),
    .clk_out10K(clk_10K),
    .clk_ssd(clk_s),
    .clk(clk), // clock from the 40MHz oscillator
    .rst_n(rst_n) // low active rst_n
);
// Binary Counter

counter U_C(
    .mode_selection(mode_selection),
    .pb_l(pb_l),
    .counter_num(counter_num),
    .clk(clk_c), // global
    .rst_n(rst_n) // activ
);
pb_top U_PTL(
    .clk_100(clk_100),
    .clk_10K(clk_10K),
    .rst_n(rst_n),
    .pb_in(pb_in_l), 
    .pb_out(pb_l)
);
// Scan control
scanctl U_SC(
  .ssd_ctl(ssd_ctl), // ssd display control signal 
  .ssd_in(ssd_in), // output to ssd display
  .in0(4'd0), // 1st input
  .in1(4'd0), // 2nd input
  .in2(4'd0), // 3rd input
  .in3(counter_num),  // 4th input
  .clk_ssd(clk_s) // divided clock for scan control
);
// binary to 7-segment display decoder
SSDdisplay U_SD(
    .segs(segs), // 7-segment display output
    .bin(ssd_in)  // BCD number input
);
endmodule
   