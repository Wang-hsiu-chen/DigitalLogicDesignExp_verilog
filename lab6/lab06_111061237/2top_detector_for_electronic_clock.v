module top_detector_for_electronic_clock(
    input setting_mode,
    input pb_left_pu,
    input pb_right_pu,
    input [3:0] year1,
    input [3:0] year0,
    input [3:0] month1,
    input [3:0] month0,
    input [3:0] day1,
    input [3:0] day0,
    input [3:0] hr1,
    input [3:0] hr0,
    input [3:0] min1,
    input [3:0] min0,
    input [3:0] sec1,
    input [3:0] sec0,
    output reg year1_inc,
    output reg year0_inc,
    output reg month1_inc,
    output reg month0_inc,
    output reg day1_inc,
    output reg day0_inc,
    output reg hr1_inc,
    output reg hr0_inc,
    output reg min1_inc,
    output reg min0_inc,
    output reg sec1_inc,
    output reg sec0_inc,
    output reg year1_reset,
    output reg year0_reset,
    output reg month1_reset,
    output reg month0_reset,
    output reg day1_reset,
    output reg day0_reset,
    output reg hr1_reset,
    output reg hr0_reset,
    output reg min1_reset,
    output reg min0_reset,    
    output reg sec1_reset,
    output reg sec0_reset,
    output reg [3:0] limit_value_hr0, 
    output reg [3:0] limit_value_day0,
    output reg [3:0] reset_value_mon0, 
    output reg [3:0] reset_value_day0, 
    output reg [3:0] limit_value_day1, 
    output reg [3:0] limit_value_mon0 
    );
    
    always @* begin
        if (setting_mode == 1'b0) begin
            year1_inc = 1'b0;
            year0_inc = 1'b0;
            month1_inc = 1'b0;
            month0_inc = 1'b0;
            day1_inc = 1'b0;
            day0_inc = 1'b0;
            hr1_inc = 1'b0;
            hr0_inc = 1'b0;
            min1_inc = 1'b0;
            min0_inc = 1'b0;
            sec1_inc = 1'b0;
            sec0_inc = 1'b0;
            year1_reset = 1'b0;
            year0_reset = 1'b0;
            month1_reset = 1'b0;
            month0_reset = 1'b0;
            day1_reset = 1'b0;
            day0_reset = 1'b0;
            hr1_reset = 1'b0;
            hr0_reset = 1'b0;
            min1_reset = 1'b0;
            min0_reset = 1'b0;
            sec1_reset = 1'b0;
            sec0_reset = 1'b0;
            limit_value_hr0 = 4'd9;
            limit_value_day0 = 4'd9;
            reset_value_mon0 = 4'd0;
            reset_value_day0 = 4'd0;
            limit_value_day1 = 4'd3;
            limit_value_mon0 = 4'd9;
            
            if (year1 == 4'd9 && year0 == 4'd9 && month1 == 4'd1 && month0 == 4'd2 && day1== 4'd3 && day0 == 4'd1 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                year0_reset = 1'b1;
                year1_reset = 1'b1;
            end
            if (year0 == 4'd9 && month1 == 4'd1 && month0 == 4'd2 && day1== 4'd3 && day0 == 4'd1 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                year1_inc = 1'b1;
                year0_reset = 1'b1;
            end
            if (month1 == 4'd1 && month0 == 4'd2 && day1== 4'd3 && day0 == 4'd1 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin 
                year0_inc = 1'b1;   
                month0_reset = 1'b1; // reset to 1
                month1_reset = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end 
            if (month1 == 4'd1 && month0 == 4'd1 && day1== 4'd3 && day0 == 4'd0 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                month0_inc = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end
            if (month1 == 4'd1 && month0 == 4'd0 && day1== 4'd3 && day0 == 4'd1 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                month0_inc = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end
            if (month1 == 4'd0 && month0 == 4'd9 && day1== 4'd3 && day0 == 4'd0 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                month0_inc = 1'b1;// inc to 0
                month1_inc = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end
            if (month1 == 4'd0 && month0 == 4'd8 && day1== 4'd3 && day0 == 4'd1 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                month0_inc = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end
            if (month1 == 4'd0 && month0 == 4'd7 && day1== 4'd3 && day0 == 4'd1 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                month0_inc = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end
            if (month1 == 4'd0 && month0 == 4'd6 && day1== 4'd3 && day0 == 4'd0 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                month0_inc = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end
            if (month1 == 4'd0 && month0 == 4'd5 && day1== 4'd3 && day0 == 4'd1 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                month0_inc = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end
            if (month1 == 4'd0 && month0 == 4'd4 && day1== 4'd3 && day0 == 4'd0 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                month0_inc = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end
            if (month1 == 4'd0 && month0 == 4'd3 && day1== 4'd3 && day0 == 4'd1 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                month0_inc = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end
            if (month1 == 4'd0 && month0 == 4'd2 && day1== 4'd2 && day0 == 4'd8 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                month0_inc = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end
            if (month1 == 4'd0 && month0 == 4'd1 && day1== 4'd3 && day0 == 4'd1 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                month0_inc = 1'b1;
                day1_reset  = 1'b1;
                day0_reset  = 1'b1;
            end
            if (day0 == 4'd9 && hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin   
                day1_inc = 1'b1;
            end 
            if (hr1 == 4'd2 && hr0 == 4'd3 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin 
                day0_inc = 1'b1;
                hr1_reset = 1'b1;
                hr0_reset = 1'b1;
            end
            if (hr0 == 4'd9 && min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin 
                hr1_inc = 1'b1;
                hr0_reset = 1'b1;
            end 
            if (min1 == 4'd5 && min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin
                hr0_inc = 1'b1;
                min1_reset = 1'b1;
            end
            if (min0 == 4'd9 && sec1 == 4'd5 && sec0 == 4'd9) begin 
                min1_inc = 1'b1;
                min0_reset = 1'b1;
            end
            if (sec1 == 4'd5 && sec0 == 4'd9) begin 
                min0_inc = 1'b1;
                sec1_reset = 1'b1;
            end 
            if (sec0 == 4'd9) begin 
                sec1_inc = 1'b1;
                sec0_reset = 1'b1;
            end
            sec0_inc = 1'b1;
        end    
        else begin
            year1_inc = 1'b0;
            year0_inc = 1'b1;
            month1_inc = 1'b0;
            month0_inc = 1'b1;
            day1_inc = 1'b0;
            day0_inc = 1'b1;
            hr1_inc = 1'b0;
            hr0_inc = 1'b1;
            min1_inc = 1'b0;
            min0_inc = 1'b1;
            sec1_inc = 1'b0;
            sec0_inc = 1'b1;
            year1_reset = 1'b0;
            year0_reset = 1'b0;
            month1_reset = 1'b0;
            month0_reset = 1'b0;
            day1_reset = 1'b0;
            day0_reset = 1'b0;
            hr1_reset = 1'b0;
            hr0_reset = 1'b0;
            min1_reset = 1'b0;
            min0_reset = 1'b0;
            sec1_reset = 1'b0;
            sec0_reset = 1'b0;
            limit_value_hr0 = 4'd9;
            limit_value_day0 = 4'd9;
            reset_value_mon0 = 4'd0;
            reset_value_day0 = 4'd0;
            limit_value_day1 = 4'd3;
            limit_value_mon0 = 4'd9;
            ////
            if (year0 == 4'd9 && pb_right_pu) begin
                year1_inc = 1'b1;
            end
            ////
            if (month1 == 4'd1) begin
                limit_value_mon0 = 4'd2;
                if (month0 == 4'd2 && pb_left_pu) month1_inc = 1'b1;
                reset_value_mon0 = 4'd1;
            end
            else begin
                limit_value_mon0 = 4'd9;    
                if (month0 == 4'd9 && pb_left_pu) month1_inc = 1'b1;
                reset_value_mon0 = 4'd0;
            end
            ////
            if (month1 == 4'd1 && month0 == 4'd2) begin 
                limit_value_day1 = 4'd3;
                if (day1 == 4'd3 && day0 == 4'd1) begin
                    limit_value_day0 = 4'd1;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end 
            if (month1 == 4'd1 && month0 == 4'd1) begin
                limit_value_day1 = 4'd3;
                if (day1 == 4'd3 && day0 == 4'd0) begin
                    limit_value_day0 = 4'd0;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end
            if (month1 == 4'd1 && month0 == 4'd0) begin
                limit_value_day1 = 4'd3;
                if (day1 == 4'd3 && day0 == 4'd1) begin
                    limit_value_day0 = 4'd1;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end
            if (month1 == 4'd0 && month0 == 4'd9) begin
                limit_value_day1 = 4'd3;
                if (day1 == 4'd3 && day0 == 4'd0) begin
                    limit_value_day0 = 4'd0;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end
            if (month1 == 4'd0 && month0 == 4'd8) begin
                limit_value_day1 = 4'd3;
                if (day1 == 4'd3 && day0 == 4'd1) begin
                    limit_value_day0 = 4'd1;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end
            if (month1 == 4'd0 && month0 == 4'd7) begin
                limit_value_day1 = 4'd3;
                if (day1 == 4'd3 && day0 == 4'd1) begin
                    limit_value_day0 = 4'd1;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end
            if (month1 == 4'd0 && month0 == 4'd6) begin
                limit_value_day1 = 4'd3;
                if (day1 == 4'd3 && day0 == 4'd0) begin
                    limit_value_day0 = 4'd0;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end
            if (month1 == 4'd0 && month0 == 4'd5) begin
                limit_value_day1 = 4'd3;
                if (day1 == 4'd3 && day0 == 4'd1) begin
                    limit_value_day0 = 4'd1;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end
            if (month1 == 4'd0 && month0 == 4'd4) begin
                limit_value_day1 = 4'd3;
                if (day1 == 4'd3 && day0 == 4'd0) begin
                    limit_value_day0 = 4'd0;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end
            if (month1 == 4'd0 && month0 == 4'd3) begin
                limit_value_day1 = 4'd3;
                if (day1 == 4'd3 && day0 == 4'd1) begin
                    limit_value_day0 = 4'd1;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end
            if (month1 == 4'd0 && month0 == 4'd2) begin
                limit_value_day1 = 4'd2;
                if (day1 == 4'd2 && day0 == 4'd8) begin
                    limit_value_day0 = 4'd8;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end
            if (month1 == 4'd0 && month0 == 4'd1 && day1== 4'd3 && day0 > 4'd1) begin
                limit_value_day1 = 4'd3;
                if (day1 == 4'd3 && day0 == 4'd1) begin
                    limit_value_day0 = 4'd1;
                    reset_value_day0 = 4'd1;
                    if (pb_right_pu) day1_inc = 1'b1;
                end 
                else begin
                    limit_value_day0 = 4'd9;
                    reset_value_day0 = 4'd0;
                end
            end
            if (day0 == 4'd9 && pb_right_pu) day1_inc = 1'b1;
          
            ////
            if (hr1 == 4'd2) begin 
                limit_value_hr0 = 4'd3;
                if (hr0 == 4'd3 && pb_left_pu) hr1_inc = 1'b1;
            end
            else begin
                if (hr0 == 4'd9 && pb_left_pu) hr1_inc = 1'b1;
                limit_value_hr0 = 4'd9;
            end
            
            if (min0 == 4'd9 && pb_right_pu) min1_inc = 1'b1;
            
            if (sec0 == 4'd9 && pb_right_pu) sec1_inc = 1'b1;
        end 
    end 
endmodule
