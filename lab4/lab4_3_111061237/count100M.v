`define FRQ 26'd2499_9999
`define FRQBIT 26

module count100M(reset, clk, clk_out);
    input reset, clk;
    output clk_out;
    reg [`FRQBIT - 1:0] q, q_tem;
    reg f_tem, clk_out;
    
    // Combination
    always @*
        if (q == `FRQ)  q_tem = `FRQBIT'd0;
        else q_tem = q + 1'b1;
    always @*
        if (q == `FRQ)  f_tem = ~clk_out;
        else    f_tem = clk_out;
    // Sequential 
    always @(posedge clk or negedge reset)
        if (~reset) q <= `FRQBIT'd0;
        else    q <= q_tem;
    always @(posedge clk or negedge reset)
        if (~reset) clk_out <= 1'b0;
        else clk_out <= f_tem;
endmodule
