// `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/12 15:53:45
// Design Name: 
// Module Name: count50M
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define FRQ 26'd4999_9999
`define FRQBIT 26

module count50M(reset, clk, clk_out, clk_ssd);
    input reset, clk;
    output clk_out;
    output [1:0] clk_ssd;

    reg [25:0] q, q_tem;
    reg f_tem, clk_out;
    reg [16:0] temp_count; // input node to flip flops
    reg [14:0] count;
    reg [1:0] clk_ssd;
    
    // Combination
    always @*
        if (q == `FRQ)  q_tem = `FRQBIT'd0;
        else q_tem = q + 1'b1;
    always @*
        if (q == `FRQ)  f_tem = ~clk_out;
        else    f_tem = clk_out;
    always @*
        temp_count = {clk_ssd, count} + 1'b1;
    // Sequential 
    always @(posedge clk or negedge reset)
        if (~reset) q <= `FRQBIT'd0;
        else    q <= q_tem;
    always @(posedge clk or negedge reset)
        if (~reset) clk_out <= 1'b0;
        else clk_out <= f_tem;
    always @(posedge clk or negedge reset)
        if (~reset)
            {clk_ssd, count} <= 0;
        else
            {clk_ssd, count} <= temp_count;
endmodule
