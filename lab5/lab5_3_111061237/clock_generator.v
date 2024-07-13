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

`define FRQ1 26'd4999_9999
`define FRQ1BIT 26
`define FRQS1 26'd0083_3332
`define FRQ10 23'd0083_3333
`define FRQ10BIT 23
`define FRQS10 23'd008_3332
`define FRQ100 19'd49_9999
`define FRQ100BIT 19
`define FRQS100 19'd00_8332

module clock_generator(reset, clk, speedup, clk_out1, clk_out10, clk_out100, clk_ssd);
    input reset, clk, speedup;
    output clk_out1, clk_out10, clk_out100;
    output [1:0] clk_ssd;

    reg [`FRQ1BIT - 1:0] q1, q1_temp;
    reg [`FRQ10BIT - 1:0] q10, q10_temp;
    reg [`FRQ100BIT - 1:0] q100, q100_temp;
    reg f1_tem, clk_out1, f10_tem, clk_out10, f100_tem, clk_out100;
    reg [16:0] temp_count; // input node to flip flops
    reg [14:0] count;
    reg [1:0] clk_ssd;
    
    // Combination
    always @* begin
        if (~speedup) begin
            if (q1 == `FRQ1) begin
                q1_temp = `FRQ1BIT'd0;
                f1_tem = ~clk_out1;
            end
            else begin
                q1_temp = q1 + 1'b1;
                f1_tem = clk_out1;
            end
        end
        else begin
            if (q1 == `FRQS1) begin
                q1_temp = `FRQ1BIT'd0;
                f1_tem = ~clk_out1;
            end
            else begin
                q1_temp = q1 + 1'b1;
                f1_tem = clk_out1;
            end
        end
    end
    
    always @* begin
        if (q100 == `FRQ100) begin
            q100_temp = `FRQ100BIT'd0;
            f100_tem = ~clk_out100;
        end
        else begin
            q100_temp = q100 + 1'b1;
            f100_tem = clk_out100;
        end
    end
    always @* begin
        if (q10 == `FRQ10) begin
            q10_temp = `FRQ10BIT'd0;
            f10_tem = ~clk_out10;
        end
        else begin
            q10_temp = q10 + 1'b1;
            f10_tem = clk_out10;
        end
    end
    always @(count or clk_ssd)
        temp_count = {clk_ssd, count} + 1'b1;
    
    // Sequential 
    always @(posedge clk or negedge reset)
        if (~reset) q1 <= `FRQ1BIT'd0;
        else    q1 <= q1_temp;
    always @(posedge clk or negedge reset)
        if (~reset) clk_out1 <= 1'b0;
        else clk_out1 <= f1_tem;
    always @(posedge clk or negedge reset)
        if (~reset) q10 <= `FRQ10BIT'd0;
        else    q10 <= q10_temp;
    always @(posedge clk or negedge reset)
        if (~reset) clk_out10 <= 1'b0;
        else clk_out10 <= f10_tem;
    always @(posedge clk or negedge reset)
        if (~reset) q100 <= `FRQ100BIT'd0;
        else    q100 <= q100_temp;
    always @(posedge clk or negedge reset)
        if (~reset) clk_out100 <= 1'b0;
        else clk_out100 <= f100_tem;
    always @(posedge clk or negedge reset)
        if (~reset)
            {clk_ssd, count} <= 17'b0;
        else
            {clk_ssd, count} <= temp_count;
endmodule
