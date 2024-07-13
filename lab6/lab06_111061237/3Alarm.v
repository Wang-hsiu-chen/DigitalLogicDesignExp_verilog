module Alarm(
clk_counter,
reset,
setting_mode,
pb_left_pu,
pb_right_pu,
hr1_alarm,
hr0_alarm,
min1_alarm,
min0_alarm
);
input clk_counter;
input reset;
input setting_mode;
input pb_left_pu;
input pb_right_pu;
output [3:0] hr1_alarm;
output [3:0] hr0_alarm;
output [3:0] min1_alarm;
output [3:0] min0_alarm;

wire hr1_inc, hr0_inc, min1_inc, min0_inc;
wire hr1_reset, hr0_reset, min1_reset, min0_reset;
wire hr1_en, hr0_en, min1_en, min0_en;
wire [3:0] limit_value_hr0;
    
BCD_counter HR1(
    .clk(clk_counter),
    .reset(reset), 
    .decrease(1'b0), 
    .increase(hr1_inc), 
    .rst(hr1_reset), 
    .zero(1'b1), 
    .top(1'b0), 
    .en(hr1_en), 
    .mode_select(1'b1), 
    .reset_value_for_down(4'd0), 
    .limit_value_for_down(4'd0), 
    .initial_reset_value_for_down(4'd0), 
    .reset_value_for_up(4'd0), 
    .limit_value_for_up(4'd2), 
    .initial_reset_value_for_up(4'd0), 
    .bcd_output(hr1_alarm)
);
BCD_counter HR0(
    .clk(clk_counter), 
    .reset(reset), 
    .decrease(1'b0), 
    .increase(hr0_inc), 
    .rst(hr0_reset), 
    .zero(1'b1), 
    .top(1'b0), 
    .en(hr0_en), 
    .mode_select(1'b1), 
    .reset_value_for_down(4'd0), 
    .limit_value_for_down(4'd0), 
    .initial_reset_value_for_down(4'd0), 
    .reset_value_for_up(4'd0), 
    .limit_value_for_up(limit_value_hr0), 
    .initial_reset_value_for_up(4'd0), 
    .bcd_output(hr0_alarm)
);
BCD_counter MIN1(
    .clk(clk_counter), 
    .reset(reset), 
    .decrease(1'b0), 
    .increase(min1_inc), 
    .rst(min1_reset), 
    .zero(1'b1), 
    .top(1'b0), 
    .en(min1_en), 
    .mode_select(1'b1), 
    .reset_value_for_down(4'd0), 
    .limit_value_for_down(4'd0), 
    .initial_reset_value_for_down(4'd0), 
    .reset_value_for_up(4'd0), 
    .limit_value_for_up(4'd5), 
    .initial_reset_value_for_up(4'd0), 
    .bcd_output(min1_alarm)
);
BCD_counter MIN0(
    .clk(clk_counter), 
    .reset(reset), 
    .decrease(1'b0), 
    .increase(min0_inc), 
    .rst(min0_reset), 
    .zero(1'b1), 
    .top(1'b0), 
    .en(min0_en), 
    .mode_select(1'b1), 
    .reset_value_for_down(4'd0), 
    .limit_value_for_down(4'd0), 
    .initial_reset_value_for_down(4'd0), 
    .reset_value_for_up(4'd0), 
    .limit_value_for_up(4'd9), 
    .initial_reset_value_for_up(4'd0), 
    .bcd_output(min0_alarm)
);
    
top_detector_for_alarm U_TDFA(
    .hr1(hr1_alarm),
    .hr0(hr0_alarm),
    .min1(min1_alarm),
    .min0(min0_alarm),
    .setting_mode(setting_mode),
    .pb_left_pu(pb_left_pu),
    .pb_right_pu(pb_right_pu),
    .hr1_inc(hr1_inc),
    .hr0_inc(hr0_inc),
    .min1_inc(min1_inc),
    .min0_inc(min0_inc),
    .hr1_reset(hr1_reset),
    .hr0_reset(hr0_reset),
    .min1_reset(min1_reset),
    .min0_reset(min0_reset),
    .hr1_en(hr1_en),
    .hr0_en(hr0_en),
    .min1_en(min1_en),
    .min0_en(min0_en),
    .limit_value_hr0(limit_value_hr0)
);
endmodule
