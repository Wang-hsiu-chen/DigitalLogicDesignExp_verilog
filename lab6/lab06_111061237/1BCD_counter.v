`define down_count 0
`define up_count 1

module BCD_counter(
    input clk,
    input reset,
    input decrease,
    input increase,
    input rst,
    input zero,
    input top,
    input en,
    input mode_select,
    input [3:0] reset_value_for_down,
    input [3:0] limit_value_for_down,
    input [3:0] initial_reset_value_for_down,
    input [3:0] reset_value_for_up,
    input [3:0] limit_value_for_up,
    input [3:0] initial_reset_value_for_up,
    output reg [3:0] bcd_output 
    );
    
reg [3:0] bcd_output_tem;
    
always @*
    if (mode_select == `down_count) begin
        if (~zero) begin
            if (en) begin
                if (decrease) begin
                    if (bcd_output == limit_value_for_down)
                        bcd_output_tem = reset_value_for_down;
                    else 
                        bcd_output_tem = bcd_output - 4'd1; 
                end
                else bcd_output_tem = bcd_output;
            end
            else bcd_output_tem = bcd_output;
        end
        else bcd_output_tem = bcd_output;
    end
    else begin
        if (~top) begin
            if (en) begin
                if (increase) begin
                    if (bcd_output == limit_value_for_up)
                        bcd_output_tem = reset_value_for_up;
                    else 
                        bcd_output_tem = bcd_output + 4'd1; 
                end
                else bcd_output_tem = bcd_output;
            end
            else bcd_output_tem = bcd_output;
        end
        else bcd_output_tem = bcd_output;
    end
        
always @(posedge clk or negedge reset)
    if (~reset || rst)
        if (mode_select == `down_count) bcd_output <= initial_reset_value_for_down;
        else bcd_output <= initial_reset_value_for_up;
    else 
        bcd_output <= bcd_output_tem;
endmodule
