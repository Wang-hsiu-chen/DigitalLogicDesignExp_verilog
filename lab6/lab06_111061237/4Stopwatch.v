module Stopwatch(
    clk_counter,
    pb_left_pu,
    reset,
    reset_ctl,
    lap_cnt_ctl,
    counter_en,
    min1_stopwatch_display,
    min0_stopwatch_display,
    sec1_stopwatch_display,
    sec0_stopwatch_display
);
input clk_counter;
input pb_left_pu;
input reset;
input reset_ctl;
input lap_cnt_ctl;
input counter_en;
output [3:0] min1_stopwatch_display;
output [3:0] min0_stopwatch_display;
output [3:0] sec1_stopwatch_display;
output [3:0] sec0_stopwatch_display;
wire top0, top1, top2, top3;
wire [3:0] min1_stopwatch, min0_stopwatch, sec1_stopwatch, sec0_stopwatch;
wire [3:0] saved_s0, saved_s1, saved_m0, saved_m1;
    
BCD_counter MIN1(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(top2), .rst(reset_ctl), .zero(1'b1), .top(top3), .en(counter_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd5), .initial_reset_value_for_up(4'd0), .bcd_output(min1_stopwatch)
);
BCD_counter MIN0(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(top1), .rst(reset_ctl), .zero(1'b1), .top(top3), .en(counter_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd9), .initial_reset_value_for_up(4'd0), .bcd_output(min0_stopwatch)
);
BCD_counter SEC1(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(top0), .rst(reset_ctl), .zero(1'b1), .top(top3), .en(counter_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd5), .initial_reset_value_for_up(4'd0), .bcd_output(sec1_stopwatch)
);
BCD_counter SEC0(
    .clk(clk_counter), .reset(reset), .decrease(1'b0), .increase(1'b1), .rst(reset_ctl), .zero(1'b1), .top(top3), .en(counter_en), .mode_select(1'b1), .reset_value_for_down(4'd0), .limit_value_for_down(4'd0), .initial_reset_value_for_down(4'd0), .reset_value_for_up(4'd0), .limit_value_for_up(4'd9), .initial_reset_value_for_up(4'd0), .bcd_output(sec0_stopwatch)
);
    
time_register_for_lap LapRegister(
    .lap_ctl(pb_left_pu), .reset(reset), .rst(reset_ctl), .s0(sec0_stopwatch), .s1(sec1_stopwatch), .m0(min0_stopwatch), .m1(min1_stopwatch), .saved_s0(saved_s0), .saved_s1(saved_s1), .saved_m0(saved_m0), .saved_m1(saved_m1)
);
top_zero_detector TZD(
    .s0(sec0_stopwatch), .s1(sec1_stopwatch), .m0(min0_stopwatch), .m1(min1_stopwatch), .top0(top0), .top1(top1), .top2(top2), .top3(top3)
);
Lap_Cnt_result_selector LCSelector(
    .lap_cnt_ctl(lap_cnt_ctl), .lap_s0(saved_s0), .lap_s1(saved_s1), .lap_m0(saved_m0), .lap_m1(saved_m1), .cnt_s0(sec0_stopwatch), .cnt_s1(sec1_stopwatch), .cnt_m0(min0_stopwatch), .cnt_m1(min1_stopwatch), .display_s0(sec0_stopwatch_display), .display_s1(sec1_stopwatch_display), .display_m0(min0_stopwatch_display), .display_m1(min1_stopwatch_display)
);

endmodule
