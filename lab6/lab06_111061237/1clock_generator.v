`define BITS 26
`define BITS_100 19
`define BITS_10K 13
`define BITS_1000K 6
`define CNT 26'd4999_9999
`define CNT_100 19'd499_999
`define CNT_10K 13'd4999
`define CNT_1000K 6'd49

module clock_generator(
    input fcrystal,
    input reset,
    output clk_1Hz,
    output [1:0] clk_scan,
    output clk_100Hz,
    output clk_10KHz,
    output clk_1000KHz
    );
    
    // variables for count 50M
    reg clk_1Hz, clk_1Hz_tem;
    reg [1:0] clk_scan;
    reg [8:0] clk_left;
    reg [14:0] clk_right;
    reg [`BITS - 1:0] clk_tem;
    
    // variables for count 500K
    reg clk_100Hz, clk_100Hz_tem;
    reg [`BITS_100 - 1:0] cnt_100Hz, cnt_100Hz_tem;
    
    // variables for count 5K
    reg clk_10KHz, clk_10KHz_tem;
    reg [`BITS_10K  - 1:0] cnt_10KHz, cnt_10KHz_tem;

    reg clk_1000KHz, clk_1000KHz_tem;
    reg [`BITS_1000K  - 1:0] cnt_1000KHz, cnt_1000KHz_tem;
    
    // count 50M
    always @*
        if ({clk_left, clk_scan, clk_right} == `CNT) begin
            clk_1Hz_tem = ~clk_1Hz;
            clk_tem = `BITS'd0;
        end
        else begin
            clk_1Hz_tem = clk_1Hz;
            clk_tem = {clk_left, clk_scan, clk_right} + `BITS'd1;
        end
        
    always @(posedge fcrystal or negedge reset)
        if (~reset) begin
            {clk_left, clk_scan, clk_right} <= `BITS'd0;
            clk_1Hz <= 1'b0;
        end
        else begin
            {clk_left, clk_scan, clk_right} <= clk_tem;
            clk_1Hz <= clk_1Hz_tem;
        end
        
    // count 500K
    always @*
        if (cnt_100Hz == `CNT_100) begin 
            clk_100Hz_tem = ~clk_100Hz;
            cnt_100Hz_tem = `BITS_100'd0;
        end
        else begin 
            clk_100Hz_tem = clk_100Hz;
            cnt_100Hz_tem = cnt_100Hz + `BITS_100'd1;
        end
        
    always @(posedge fcrystal or negedge reset)
        if (~reset) begin
            cnt_100Hz <= `BITS_100'd0;
            clk_100Hz <= 1'b0;
        end
        else begin
            cnt_100Hz <= cnt_100Hz_tem;
            clk_100Hz <= clk_100Hz_tem;
        end
    
    // count 5K
    always @*
        if (cnt_10KHz == `CNT_10K) begin 
            clk_10KHz_tem = ~clk_10KHz;
            cnt_10KHz_tem = `BITS_10K'd0;
        end
        else begin 
            clk_10KHz_tem = clk_10KHz;
            cnt_10KHz_tem = cnt_10KHz + `BITS_10K'd1;
        end
        
    always @(posedge fcrystal or negedge reset)
        if (~reset) begin
            cnt_10KHz <= `BITS_10K'd0;
            clk_10KHz <= 1'b0;
        end
        else begin
            cnt_10KHz <= cnt_10KHz_tem;
            clk_10KHz <= clk_10KHz_tem;
        end
    // count 50
    always @*
        if (cnt_1000KHz == `CNT_1000K) begin 
            clk_1000KHz_tem = ~clk_1000KHz;
            cnt_1000KHz_tem = `BITS_1000K'd0;
        end
        else begin 
            clk_1000KHz_tem = clk_1000KHz;
            cnt_1000KHz_tem = cnt_1000KHz + `BITS_1000K'd1;
        end
        
    always @(posedge fcrystal or negedge reset)
        if (~reset) begin
            cnt_1000KHz <= `BITS_1000K'd0;
            clk_1000KHz <= 1'b0;
        end
        else begin
            cnt_1000KHz <= cnt_1000KHz_tem;
            clk_1000KHz <= clk_1000KHz_tem;
        end
endmodule
