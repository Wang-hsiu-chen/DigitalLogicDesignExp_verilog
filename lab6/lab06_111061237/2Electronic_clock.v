module Electronic_clock(
    clk_counter,
    reset,
    setting_mode_for_clock,
    setting_ctl,
    change_display_ctl,
    pb_left_pu,
    pb_right_pu,
    ssd1, 
    ssd2, 
    ssd3, 
    ssd4,
    hr1_clock,
    hr0_clock,
    min1_clock,
    min0_clock
);
input clk_counter;
input reset;
input setting_mode_for_clock;
input [2:0] setting_ctl;
input [1:0] change_display_ctl;
input pb_left_pu;
input pb_right_pu;
output [3:0] ssd1; 
output [3:0] ssd2; 
output [3:0] ssd3; 
output [3:0] ssd4;
output [3:0] hr1_clock;
output [3:0] hr0_clock;
output [3:0] min1_clock;
output [3:0] min0_clock;

wire [3:0] hr1, hr0, min1, min0, sec1, sec0;
wire [3:0] year1, year0, month1, month0, day1, day0;
wire year1_inc, year0_inc, month1_inc, month0_inc, day1_inc, day0_inc, hr1_inc, hr0_inc, min1_inc, min0_inc, sec1_inc, sec0_inc;
wire year1_reset, year0_reset, month1_reset, month0_reset, day1_reset, day0_reset, hr1_reset, hr0_reset, min1_reset, min0_reset, sec1_reset, sec0_reset;
wire year1_en, year0_en, month1_en, month0_en, day1_en, day0_en, hr1_en, hr0_en, min1_en, min0_en, sec1_en, sec0_en;
wire [3:0] limit_value_hr0, limit_value_day0, limit_value_day1, limit_value_mon0;
wire [3:0] reset_value_mon0, reset_value_day0;
    
BCD_counter YEAR1(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(year1_inc), .rst(year1_reset), .zero(1'b1), .top(1'b0), .en(year1_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd9), .initial_reset_value_for_up(4'd0), .bcd_output(year1)
);
BCD_counter YEAR0(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(year0_inc), .rst(year0_reset), .zero(1'b1), .top(1'b0), .en(year0_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd9), .initial_reset_value_for_up(4'd0), .bcd_output(year0)
);
BCD_counter MON1(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(month1_inc), .rst(month1_reset), .zero(1'b1), .top(1'b0), .en(month1_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd1), .initial_reset_value_for_up(4'd0), .bcd_output(month1)
);
BCD_counter MON0(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(month0_inc), .rst(month0_reset), .zero(1'b1), .top(1'b0), .en(month0_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(reset_value_mon0), .limit_value_for_up(limit_value_mon0), .initial_reset_value_for_up(4'd1), .bcd_output(month0)
);
BCD_counter DAY1(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(day1_inc), .rst(day1_reset), .zero(1'b1), .top(1'b0), .en(day1_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(limit_value_day1), .initial_reset_value_for_up(4'd0), .bcd_output(day1)
);
BCD_counter DAY0(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(day0_inc), .rst(day0_reset), .zero(1'b1), .top(1'b0), .en(day0_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(reset_value_day0), .limit_value_for_up(limit_value_day0), .initial_reset_value_for_up(4'd1), .bcd_output(day0)
);
BCD_counter HR1(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(hr1_inc), .rst(hr1_reset), .zero(1'b1), .top(1'b0), .en(hr1_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd2), .initial_reset_value_for_up(4'd0), .bcd_output(hr1)
);
BCD_counter HR0(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(hr0_inc), .rst(hr0_reset), .zero(1'b1), .top(1'b0), .en(hr0_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(limit_value_hr0), .initial_reset_value_for_up(4'd0), .bcd_output(hr0)
);
BCD_counter MIN1(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(min1_inc), .rst(min1_reset), .zero(1'b1), .top(1'b0), .en(min1_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd5), .initial_reset_value_for_up(4'd0), .bcd_output(min1)
);
BCD_counter MIN0(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(min0_inc), .rst(min0_reset), .zero(1'b1), .top(1'b0), .en(min0_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd9), .initial_reset_value_for_up(4'd0), .bcd_output(min0)
);
BCD_counter SEC1(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(sec1_inc), .rst(sec1_reset), .zero(1'b1), .top(1'b0), .en(sec1_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd5), .initial_reset_value_for_up(4'd0), .bcd_output(sec1)
);
BCD_counter SEC0(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(sec0_inc), .rst(sec0_reset), .zero(1'b1), .top(1'b0), .en(sec0_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd9), .initial_reset_value_for_up(4'd0), .bcd_output(sec0)
); 
    
    
top_detector_for_electronic_clock TOP_DETECTOR(
    .setting_mode(setting_mode_for_clock),
    .pb_left_pu(pb_left_pu),
    .pb_right_pu(pb_right_pu),
    .year1(year1),
    .year0(year0),
    .month1(month1),
    .month0(month0),
    .day1(day1),
    .day0(day0),
    .hr1(hr1),
    .hr0(hr0),
    .min1(min1),
    .min0(min0),
    .sec1(sec1),
    .sec0(sec0),
    .year1_inc(year1_inc),
    .year0_inc(year0_inc),
    .month1_inc(month1_inc),
    .month0_inc(month0_inc),
    .day1_inc(day1_inc),
    .day0_inc(day0_inc),
    .hr1_inc(hr1_inc),
    .hr0_inc(hr0_inc),
    .min1_inc(min1_inc),
    .min0_inc(min0_inc),
    .sec1_inc(sec1_inc),
    .sec0_inc(sec0_inc),
    .year1_reset(year1_reset),
    .year0_reset(year0_reset),
    .month1_reset(month1_reset),
    .month0_reset(month0_reset),
    .day1_reset(day1_reset),
    .day0_reset(day0_reset),
    .hr1_reset(hr1_reset),
    .hr0_reset(hr0_reset),
    .min1_reset(min1_reset),
    .min0_reset(min0_reset),    
    .sec1_reset(sec1_reset),
    .sec0_reset(sec0_reset),
    .limit_value_hr0(limit_value_hr0), 
    .limit_value_day0(limit_value_day0),
    .reset_value_mon0(reset_value_mon0),
    .reset_value_day0(reset_value_day0),
    .limit_value_day1(limit_value_day1),
    .limit_value_mon0(limit_value_mon0)
);
    
Electronic_clock_display_selector ECDS(
    .year1(year1),
    .year0(year0),
    .month1(month1),
    .month0(month0),
    .day1(day1),
    .day0(day0),
    .hr1(hr1),
    .hr0(hr0),
    .min1(min1),
    .min0(min0),
    .sec1(sec1),
    .sec0(sec0),
    .setting_mode(setting_mode_for_clock),
    .setting_ctl(setting_ctl),
    .change_display_ctl(change_display_ctl),
    .pb_left_pu(pb_left_pu),
    .pb_right_pu(pb_right_pu),
    .ssd1(ssd1),
    .ssd2(ssd2),
    .ssd3(ssd3),
    .ssd4(ssd4),
    .year1_en(year1_en),
    .year0_en(year0_en),
    .month1_en(month1_en),
    .month0_en(month0_en),
    .day1_en(day1_en),
    .day0_en(day0_en),
    .hr1_en(hr1_en),
    .hr0_en(hr0_en),
    .min1_en(min1_en),
    .min0_en(min0_en),
    .sec1_en(sec1_en),
    .sec0_en(sec0_en),
    .hr1_clock(hr1_clock),
    .hr0_clock(hr0_clock),
    .min1_clock(min1_clock),
    .min0_clock(min0_clock)
);
endmodule
