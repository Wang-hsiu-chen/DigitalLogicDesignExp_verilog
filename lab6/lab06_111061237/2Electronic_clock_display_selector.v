`define DIS_Y 0
`define DIS_MD 1
`define DIS_HM 2
`define DIS_S 3

`define SET_Y 0
`define SET_MON 1
`define SET_DAY 2
`define SET_HR 3
`define SET_MIN 4
`define SET_S 5

module Electronic_clock_display_selector(
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
    input setting_mode,
    input [2:0] setting_ctl,
    input [1:0] change_display_ctl,
    input pb_left_pu,
    input pb_right_pu,
    output reg [3:0] ssd1,
    output reg [3:0] ssd2,
    output reg [3:0] ssd3,
    output reg [3:0] ssd4,
    output reg year1_en,
    output reg year0_en,
    output reg month1_en,
    output reg month0_en,
    output reg day1_en,
    output reg day0_en,
    output reg hr1_en,
    output reg hr0_en,
    output reg min1_en,
    output reg min0_en,
    output reg sec1_en,
    output reg sec0_en,
    output reg [3:0] hr1_clock,
    output reg [3:0] hr0_clock,
    output reg [3:0] min1_clock,
    output reg [3:0] min0_clock
    );
    
always @* begin
    if (setting_mode == 1'b0) begin
        case (change_display_ctl)
            `DIS_Y: begin
                ssd1 = 4'd0;
                ssd2 = 4'd0;
                ssd3 = year1;
                ssd4 = year0;
                year1_en = 1'b1;
                year0_en = 1'b1;
                month1_en = 1'b1;
                month0_en = 1'b1;
                day1_en = 1'b1;
                day0_en = 1'b1;
                hr1_en = 1'b1;
                hr0_en = 1'b1;
                min1_en = 1'b1;
                min0_en = 1'b1;
                sec1_en = 1'b1;
                sec0_en = 1'b1;
            end
            `DIS_MD: begin
                ssd1 = month1;
                ssd2 = month0;
                ssd3 = day1;
                ssd4 = day0;
                year1_en = 1'b1;
                year0_en = 1'b1;
                month1_en = 1'b1;
                month0_en = 1'b1;
                day1_en = 1'b1;
                day0_en = 1'b1;
                hr1_en = 1'b1;
                hr0_en = 1'b1;
                min1_en = 1'b1;
                min0_en = 1'b1;
                sec1_en = 1'b1;
                sec0_en = 1'b1;
            end
            `DIS_HM: begin
                ssd1 = hr1;
                ssd2 = hr0;
                ssd3 = min1;
                ssd4 = min0;
                year1_en = 1'b1;
                year0_en = 1'b1;
                month1_en = 1'b1;
                month0_en = 1'b1;
                day1_en = 1'b1;
                day0_en = 1'b1;
                hr1_en = 1'b1;
                hr0_en = 1'b1;
                min1_en = 1'b1;
                min0_en = 1'b1;
                sec1_en = 1'b1;
                sec0_en = 1'b1;
            end
            `DIS_S: begin
                ssd1 = 4'd0; 
                ssd2 = 4'd0; 
                ssd3 = sec1;
                ssd4 = sec0;
                year1_en = 1'b1;
                year0_en = 1'b1;
                month1_en = 1'b1;
                month0_en = 1'b1;
                day1_en = 1'b1;
                day0_en = 1'b1;
                hr1_en = 1'b1;
                hr0_en = 1'b1;
                min1_en = 1'b1;
                min0_en = 1'b1;
                sec1_en = 1'b1;
                sec0_en = 1'b1;
            end
            default: begin 
                ssd1 = 4'd0;
                ssd2 = 4'd0;
                ssd3 = year1;
                ssd4 = year0;
                year1_en = 1'b1;
                year0_en = 1'b1;
                month1_en = 1'b1;
                month0_en = 1'b1;
                day1_en = 1'b1;
                day0_en = 1'b1;
                hr1_en = 1'b1;
                hr0_en = 1'b1;
                min1_en = 1'b1;
                min0_en = 1'b1;
                sec1_en = 1'b1;
                sec0_en = 1'b1;
            end
        endcase
    end
    else begin
        case (setting_ctl)
            `SET_Y: begin
                ssd1 = 4'd0;
                ssd2 = 4'd0;
                ssd3 = year1;
                ssd4 = year0;
                year1_en = 1'b1;
                year0_en = pb_right_pu;
                month1_en = 1'b0;
                month0_en = 1'b0;
                day1_en = 1'b0;
                day0_en = 1'b0;
                hr1_en = 1'b0;
                hr0_en = 1'b0;
                min1_en = 1'b0;
                min0_en = 1'b0;
                sec1_en = 1'b0;
                sec0_en = 1'b0;
            end
            `SET_MON: begin
                ssd1 = month1;
                ssd2 = month0;
                ssd3 = day1;
                ssd4 = day0;
                year1_en = 1'b0;
                year0_en = 1'b0;
                month1_en = 1'b1;
                month0_en = pb_left_pu;
                day1_en = 1'b0;
                day0_en = 1'b0;
                hr1_en = 1'b0;
                hr0_en = 1'b0;
                min1_en = 1'b0;
                min0_en = 1'b0;
                sec1_en = 1'b0;
                sec0_en = 1'b0;
            end
            `SET_DAY: begin
                ssd1 = month1;
                ssd2 = month0;
                ssd3 = day1;
                ssd4 = day0;
                year1_en = 1'b0;
                year0_en = 1'b0;
                month1_en = 1'b0;
                month0_en = 1'b0;
                day1_en = 1'b1;
                day0_en = pb_right_pu;
                hr1_en = 1'b0;
                hr0_en = 1'b0;
                min1_en = 1'b0;
                min0_en = 1'b0;
                sec1_en = 1'b0;
                sec0_en = 1'b0;
            end
            `SET_HR: begin
                ssd1 = hr1; 
                ssd2 = hr0; 
                ssd3 = min1;
                ssd4 = min0;
                year1_en = 1'b0;
                year0_en = 1'b0;
                month1_en = 1'b0;
                month0_en = 1'b0;
                day1_en = 1'b0;
                day0_en = 1'b0;
                hr1_en = 1'b1;
                hr0_en = pb_left_pu;
                min1_en = 1'b0;
                min0_en = 1'b0;
                sec1_en = 1'b0;
                sec0_en = 1'b0;
            end
            `SET_MIN: begin
                ssd1 = hr1; 
                ssd2 = hr0; 
                ssd3 = min1;
                ssd4 = min0;
                year1_en = 1'b0;
                year0_en = 1'b0;
                month1_en = 1'b0;
                month0_en = 1'b0;
                day1_en = 1'b0;
                day0_en = 1'b0;
                hr1_en = 1'b0;
                hr0_en = 1'b0;
                min1_en = 1'b1;
                min0_en = pb_right_pu;
                sec1_en = 1'b0;
                sec0_en = 1'b0;
            end
                `SET_S: begin
                ssd1 = 4'd0; 
                ssd2 = 4'd0; 
                ssd3 = sec1;
                ssd4 = sec0;
                year1_en = 1'b0;
                year0_en = 1'b0;
                month1_en = 1'b0;
                month0_en = 1'b0;
                day1_en = 1'b0;
                day0_en = 1'b0;
                hr1_en = 1'b0;
                hr0_en = 1'b0;
                min1_en = 1'b0;
                min0_en = 1'b0;
                sec1_en = 1'b1;
                sec0_en = pb_right_pu;
            end
            default: begin
                ssd1 = 4'd0;
                ssd2 = 4'd0;
                ssd3 = year1;
                ssd4 = year0;
                year1_en = 1'b1;
                year0_en = pb_right_pu;
                month1_en = 1'b0;
                month0_en = 1'b0;
                day1_en = 1'b0;
                day0_en = 1'b0;
                hr1_en = 1'b0;
                hr0_en = 1'b0;
                min1_en = 1'b0;
                min0_en = 1'b0;
                sec1_en = 1'b0;
                sec0_en = 1'b0;
            end 
        endcase
    end 
end
    
always @* begin
    hr1_clock =  hr1;
    hr0_clock = hr0;
    min1_clock = min1;
    min0_clock = min0;
end     
endmodule
