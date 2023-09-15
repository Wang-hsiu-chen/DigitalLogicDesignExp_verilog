`timescale 1ns / 1ps

`include "constant.v"
module freqdiv_marquee(
  clk_count, //divided clock output
  clk_ssd, // divided clock for 7-segment display scan
  clk, // clock from the 100MHz oscillator
  reset // low active reset
);

output clk_count; //divided clock output
output [1:0] clk_ssd; // divided clock for 7-segment display scan
input clk; // clock from the 40MHz oscillator
input reset; //low active reset

reg clk_count; // divided clock output (in the always block)
reg [1:0] clk_ssd; // divided clock for seven-segment display scan (in the always block)
reg [14:0] count_l; // temperatory buffer
reg [8:0] count_h; // temperatory buffer
reg [`FREQ_DIV_BIT-1:0] count_temp; // input node to flip flops

// Combinational block 
always @(clk_count or count_h or count_l or clk_ssd)
  count_temp = {clk_count,count_h,clk_ssd,count_l} + 1'b1;
  
// Sequential block 
always @(posedge clk or negedge reset)
  if (~reset)
    {clk_count,count_h,clk_ssd,count_l} <= `FREQ_DIV_BIT'b0;
  else
    {clk_count,count_h,clk_ssd,count_l} <= count_temp;

endmodule
