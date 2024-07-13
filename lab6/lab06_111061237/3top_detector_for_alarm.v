module top_detector_for_alarm(
    input [3:0] hr1,
    input [3:0] hr0,
    input [3:0] min1,
    input [3:0] min0,
    input setting_mode,
    input pb_left_pu,
    input pb_right_pu,
    output reg hr1_inc,
    output reg hr0_inc,
    output reg min1_inc,
    output reg min0_inc,
    output reg hr1_reset,
    output reg hr0_reset,
    output reg min1_reset,
    output reg min0_reset,
    output reg hr1_en,
    output reg hr0_en,
    output reg min1_en,
    output reg min0_en,
    output reg [3:0] limit_value_hr0
    );
    
    
    always @* begin
        if (setting_mode == 1'b1) begin
            hr1_inc = 1'b0;
            hr0_inc = 1'b1;
            min1_inc = 1'b0;
            min0_inc = 1'b1;
            hr1_reset = 1'b0;
            hr0_reset = 1'b0;
            min1_reset = 1'b0;
            min0_reset = 1'b0;
            hr1_en = 1'b1;
            hr0_en = pb_left_pu;
            min1_en = 1'b1;
            min0_en = pb_right_pu;
            if (hr1 == 4'd2) begin 
                limit_value_hr0 = 4'd3;
                if (hr0 == 4'd3 && pb_left_pu) hr1_inc = 1'b1;
            end
            else begin
                if (hr0 == 4'd9 && pb_left_pu) hr1_inc = 1'b1;
                limit_value_hr0 = 4'd9;
            end
            if (min0 == 4'd9 && pb_right_pu) min1_inc = 1'b1;
        end
        else begin
            hr1_inc = 1'b0;
            hr0_inc = 1'b0;
            min1_inc = 1'b0;
            min0_inc = 1'b0;
            hr1_reset = 1'b0;
            hr0_reset = 1'b0;
            min1_reset = 1'b0;
            min0_reset = 1'b0;
            hr1_en = 1'b0;
            hr0_en = 1'b0;
            min1_en = 1'b0;
            min0_en = 1'b0;
        end
        
    end
endmodule
