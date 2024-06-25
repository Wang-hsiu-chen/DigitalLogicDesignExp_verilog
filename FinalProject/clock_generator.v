`define FRQ1 26'd4999_9999
`define FRQ1BIT 26
`define FRQ2 22'd249_9999
`define FRQ2BIT 22
`define FRQ10 23'd499_9999
`define FRQ10BIT 23
`define FRQ100 19'd49_9999
`define FRQ100BIT 19
`define FRQ10K 13'd4999
`define FRQ10KBIT 13

module clock_generator(
    input rst_n, clk, 
    output reg clk_out1, 
    output reg clk_out2, 
    output reg clk_out100, 
    output reg clk_out10K, 
    output reg [1:0] clk_ssd
);
reg [`FRQ1BIT - 1:0] q1, q1_temp;
reg [`FRQ2BIT - 1:0] q2, q2_temp;
reg [`FRQ100BIT - 1:0] q100, q100_temp;
reg [`FRQ10KBIT - 1:0] q10K, q10K_temp;
reg f1_tem, f2_tem, f100_tem, f10K_tem;
reg [16:0] temp_count; // input node to flip flops
reg [14:0] count;

// Combination
always @* begin
    if (q1 == `FRQ1) begin
        q1_temp = `FRQ1BIT'd0;
        f1_tem = ~clk_out1;
    end
    else begin
        q1_temp = q1 + 1'b1;
        f1_tem = clk_out1;
    end
end
always @* begin
    if (q2 == `FRQ2) begin
        q2_temp = `FRQ2BIT'd0;
        f2_tem = ~clk_out2;
    end
    else begin
        q2_temp = q2 + 1'b1;
        f2_tem = clk_out2;
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
    if (q10K == `FRQ10K) begin
        q10K_temp = `FRQ10KBIT'd0;
        f10K_tem = ~clk_out10K;
    end
    else begin
        q10K_temp = q10K + 1'b1;
        f10K_tem = clk_out10K;
    end
end

always @(count or clk_ssd)
    temp_count = {clk_ssd, count} + 1'b1;

// Sequential 
always @(posedge clk or negedge rst_n)
    if (~rst_n) q1 <= `FRQ1BIT'd0;
    else        q1 <= q1_temp;
always @(posedge clk or negedge rst_n)
    if (~rst_n) clk_out1 <= 1'b0;
    else        clk_out1 <= f1_tem;

always @(posedge clk or negedge rst_n)
    if (~rst_n) q2 <= `FRQ2BIT'd0;
    else        q2 <= q2_temp;
always @(posedge clk or negedge rst_n)
    if (~rst_n) clk_out2 <= 1'b0;
    else        clk_out2 <= f2_tem;

always @(posedge clk or negedge rst_n)
    if (~rst_n) q100 <= `FRQ100BIT'd0;
    else        q100 <= q100_temp;
always @(posedge clk or negedge rst_n)
    if (~rst_n) clk_out100 <= 1'b0;
    else        clk_out100 <= f100_tem;

always @(posedge clk or negedge rst_n)
    if (~rst_n) q10K <= `FRQ10KBIT'd0;
    else        q10K <= q10K_temp;
always @(posedge clk or negedge rst_n)
    if (~rst_n) clk_out10K <= 1'b0;
    else        clk_out10K <= f10K_tem;

always @(posedge clk or negedge rst_n)
    if (~rst_n)
        {clk_ssd, count} <= 17'b0;
    else
        {clk_ssd, count} <= temp_count;
endmodule
