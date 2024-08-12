`define FRQ1 23'd833_3332
`define FRQ1BIT 23
`define FRQ100 19'd49_9999
`define FRQ100BIT 19
`define FRQ10K 13'd4999
`define FRQ10KBIT 13

module clock_generator(rst_n, clk, clk_out1, clk_out100, clk_out10K, clk_ssd);
    input rst_n, clk;
    output clk_out1, clk_out100, clk_out10K;
    output [1:0] clk_ssd;

    reg [`FRQ1BIT - 1:0] q1, q1_temp;
    reg [`FRQ100BIT - 1:0] q100, q100_temp;
    reg [`FRQ10KBIT - 1:0] q10K, q10K_temp;
    reg f1_tem, clk_out1, f100_tem, clk_out100, f10K_tem, clk_out10K;
    reg [16:0] temp_count; // input node to flip flops
    reg [14:0] count;
    reg [1:0] clk_ssd;
    
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
