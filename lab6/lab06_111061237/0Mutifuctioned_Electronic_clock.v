module Mutifuctioned_Electronic_clock(
    fcrystal,
    reset,
    switch_clk,
    switch_clk1,
    pb_left,
    pb_center,
    pb_right,
    ssd_signal,
    ssd_ctl,
    LEDS
);

input fcrystal;
input reset;
input switch_clk;
input switch_clk1;
input pb_left;
input pb_center;
input pb_right;
output [7:0] ssd_signal;
output [3:0] ssd_ctl;
output [15:0] LEDS;

wire clk_1Hz, clk_100Hz, clk_10KHz, clk_1000KHz;
wire [1:0] clk_scan;
wire clk_counter, clk_debounce;
wire pb_left_de, pb_center_de, pb_right_de;
wire pb_left_pu, pb_left_long_pu, pb_center_pu, pb_right_pu, pb_right_long_pu;
    
wire setting_mode_for_clock, setting_mode_for_alarm;
wire [2:0] setting_ctl_for_clock;
wire [1:0] change_display_ctl_for_clock;
wire [3:0] ssd1_clock, ssd2_clock, ssd3_clock, ssd4_clock;
wire [3:0] hr1_clock, hr0_clock, min1_clock, min0_clock;
wire [3:0] hr1_alarm, hr0_alarm, min1_alarm, min0_alarm;
wire [3:0] min1_stopwatch, min0_stopwatch, sec1_stopwatch, sec0_stopwatch;
wire lap_cnt, lap_cnt_ctl, counter_en_for_stopwatch, reset_ctl_for_stopwatch;
wire alarm_switch, alarm_ctl;
wire clock_display, alarm_display, stopwatch_display;
    
wire [3:0] display_s0, display_s1, display_m0, display_m1;
wire [3:0] code;
    
clock_generator CLK(
    .fcrystal(fcrystal), .reset(reset), .clk_1Hz(clk_1Hz), .clk_100Hz(clk_100Hz), .clk_10KHz(clk_10KHz), .clk_1000KHz(clk_1000KHz), .clk_scan(clk_scan)
);
Switch_clk CLKSW(
    .switch_clk(switch_clk), .switch_clk1(switch_clk1), .clk_1Hz(clk_1Hz), .clk_100Hz(clk_100Hz), .clk_10KHz(clk_10KHz), .clk_1000KHz(clk_1000KHz), .clk_100MHz(fcrystal), .clk_counter(clk_counter), .clk_debounce(clk_debounce)
);
    
debounce_circuit PB_LEFT(
    .clk(clk_debounce), .reset(reset), .pb_in(pb_left), .pb_debounced(pb_left_de)
);
debounce_circuit PB_CENTER(
    .clk(clk_debounce), .reset(reset), .pb_in(pb_center), .pb_debounced(pb_center_de)
);
debounce_circuit PB_RIGHT(
    .clk(clk_debounce), .reset(reset), .pb_in(pb_right), .pb_debounced(pb_right_de)
);
one_pulse_and_long_press_detect PB_LEFT_PU(
    .in_trig(pb_left_de), .reset(reset), .clk(clk_counter), .out_pulse(pb_left_pu), .out_pulse_long(pb_left_long_pu), .switch_clk(switch_clk)
);
one_pulse_and_long_press_detect PB_CENTER_PU(
    .in_trig(pb_center_de), .reset(reset), .clk(clk_counter), .out_pulse(pb_center_pu), .switch_clk(switch_clk)
);
one_pulse_and_long_press_detect PB_RIGHT_PU(
    .in_trig(pb_right_de), .reset(reset), .clk(clk_counter), .out_pulse(pb_right_pu), .out_pulse_long(pb_right_long_pu), .switch_clk(switch_clk)
);
    
    
    
Electronic_clock ECLK(
    .clk_counter(clk_counter),
    .reset(reset),
    .setting_mode_for_clock(setting_mode_for_clock),
    .setting_ctl(setting_ctl_for_clock),
    .change_display_ctl(change_display_ctl_for_clock),
    .pb_left_pu(pb_left_pu),
    .pb_right_pu(pb_right_pu),
    .ssd1(ssd1_clock), 
    .ssd2(ssd2_clock), 
    .ssd3(ssd3_clock), 
    .ssd4(ssd4_clock),
    .hr1_clock(hr1_clock),
    .hr0_clock(hr0_clock),
    .min1_clock(min1_clock),
    .min0_clock(min0_clock)
);
Alarm Alarm(
    .clk_counter(clk_counter),
    .reset(reset),
    .setting_mode(setting_mode_for_alarm),
    .pb_left_pu(pb_left_pu),
    .pb_right_pu(pb_right_pu),
    .hr1_alarm(hr1_alarm),
    .hr0_alarm(hr0_alarm),
    .min1_alarm(min1_alarm),
    .min0_alarm(min0_alarm)
);
Stopwatch SW(
    .clk_counter(clk_counter),
    .reset(reset),
    .reset_ctl(reset_ctl_for_stopwatch),
    .pb_left_pu(pb_left_pu),
    .lap_cnt_ctl(lap_cnt_ctl),
    .counter_en(counter_en_for_stopwatch),
    .min1_stopwatch_display(min1_stopwatch),
    .min0_stopwatch_display(min0_stopwatch),
    .sec1_stopwatch_display(sec1_stopwatch),
    .sec0_stopwatch_display(sec0_stopwatch)
);
    
FSM_for_multifuctioned_electronic_clock FSM(
    .clk_counter(clk_counter),
    .reset(reset),
    .pb_left_pu(pb_left_pu),
    .pb_center_pu(pb_center_pu),
    .pb_right_pu(pb_right_pu),
    .pb_left_pu_long(pb_left_long_pu),
    .pb_right_pu_long(pb_right_long_pu),
    .lap_cnt_ctl(lap_cnt_ctl),
    .setting_mode_for_clock(setting_mode_for_clock),
    .setting_mode_for_alarm(setting_mode_for_alarm),
    .setting_ctl_for_clock(setting_ctl_for_clock),
    .change_display_ctl_for_clock(change_display_ctl_for_clock),
    .alarm_switch(alarm_switch),
    .lap_cnt_ctl_switch(lap_cnt),
    .counter_en_for_stopwatch(counter_en_for_stopwatch),
    .reset_ctl_for_stopwatch(reset_ctl_for_stopwatch),
    .clock_display(clock_display),
    .alarm_display(alarm_display),
    .stopwatch_display(stopwatch_display)
);
    
lap_cnt_ctl_signal LAP_CNT_CTL(
    .lap_cnt_ctl_switch(lap_cnt),
    .reset(reset),
    .clk_counter(clk_counter),
    .lap_cnt_ctl(lap_cnt_ctl)
);
    
time_up_detector TIME_UP_DET(
    .alarm_ctl(alarm_ctl),
    .hr1_clock(hr1_clock),
    .hr0_clock(hr0_clock),
    .min1_clock(min1_clock),
    .min0_clock(min0_clock),
    .hr1_alarm(hr1_alarm),
    .hr0_alarm(hr0_alarm),
    .min1_alarm(min1_alarm),
    .min0_alarm(min0_alarm),
    .on_off_signal(LEDS[0]),
    .time_up_signal(LEDS[15])
);
    
alarm_on_off_ctl ALR_CTL(
    .alarm_switch(alarm_switch),
    .clk_counter(clk_counter),
    .reset(reset),
    .alarm_ctl(alarm_ctl)
);

Display_selector DS(
    .clock_display(clock_display),
    .alarm_display(alarm_display),
    .stopwatch_display(stopwatch_display),
    .ssd1_clock(ssd1_clock),
    .ssd2_clock(ssd2_clock),
    .ssd3_clock(ssd3_clock),
    .ssd4_clock(ssd4_clock),
    .hr1_alarm(hr1_alarm),
    .hr0_alarm(hr0_alarm),
    .min1_alarm(min1_alarm),
    .min0_alarm(min0_alarm),
    .min1_stopwatch(min1_stopwatch),
    .min0_stopwatch(min0_stopwatch),
    .sec1_stopwatch(sec1_stopwatch),
    .sec0_stopwatch(sec0_stopwatch),
    .display_s0(display_s0),
    .display_s1(display_s1),
    .display_m0(display_m0),
    .display_m1(display_m1)
    );
    
SSD_CTL SSD_CTL(
    .clk_scan(clk_scan), .code(code), .ssd_ctl(ssd_ctl), .q0(display_s0), .q1(display_s1), .q2(display_m0), .q3(display_m1)
);
BCD_to_SSD_decoder BCD_Decoder(
    .q(code), .ssd_signal(ssd_signal)
);
endmodule
