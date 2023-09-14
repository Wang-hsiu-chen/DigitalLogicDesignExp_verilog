`define FREQ_DIV_BIT 27
module freqdiv27(
  clk_out, //divided clock output
  clk, // clock from the 100MHz oscillator
  reset // low active reset
);

output clk_out; //divided clock output
input clk; // clock from the 40MHz oscillator
input reset; //low active reset

reg clk_out; // divided clock output (in the always block)
reg [`FREQ_DIV_BIT-1:0] temp_count; // input node to flip flops
reg [`FREQ_DIV_BIT-2:0] count;

// Combinational block 
always @*
  temp_count = {clk_out, count} + 1'b1;
  
// Sequential block 
always @(posedge clk or negedge reset)
  if (~reset)
    {clk_out, count} <= 0;
  else
    {clk_out, count} <= temp_count;

endmodule
