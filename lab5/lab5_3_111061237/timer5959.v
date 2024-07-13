`timescale 1ns / 1ps

module timer5959(
    clk, // clock from oscillator
    reset, // active low reset
    speedup,
    setting,
    pause_in,
    stop_in,
    set_min_in,
    set_sec_in,
    leds,
    segs,
    ssd_ctl,
    pause,
    stop,
    set_sec,
    set_min
);

input clk, reset;
input speedup, setting;
input pause_in, stop_in;
input set_min_in, set_sec_in;
output [11:0] leds;
output [7:0] segs;
output [3:0] ssd_ctl;
output pause, stop, set_sec, set_min;

wire finish, clk_d, clk_10, clk_100;
wire [1:0]clk_s;
wire [3:0] cnt_digit0, cnt_digit1, cnt_digit2, cnt_digit3, ssd_in; // binary counter output

// Frequency Divider
clock_generator U_FD0(
    .clk_out1(clk_d), //divided clock output
    .clk_out10(clk_10),
    .clk_out100(clk_100),
    .clk_ssd(clk_s),
    .clk(clk), // clock from the 40MHz oscillator
    .reset(reset), // low active reset
    .speedup(speedup)
);
// Binary Counter
syndwcnt0_BCD U_SC0(
    .q_out(cnt_digit0),
    .clk(clk_d), // clock
    .clk_faster(clk_d),
    .reset(reset), //active low reset
    .setting(setting),
    .stop(stop),
    .pause(pause),
    .pb_set(set_sec),
    .leds(leds)
);
syndwcnt1_BCD U_SC1(
    .q_out(cnt_digit1),
    .clk(clk_d), // clock
    .clk_faster(clk_d),
    .reset(reset), //active low reset
    .setting(setting),
    .stop(stop),
    .enable(cnt_digit0),
    .pb_set(set_sec),
    .leds(leds)
);
syndwcnt2_BCD U_SC2(
    .q_out(cnt_digit2),
    .clk(clk_d), // clock
    .clk_faster(clk_d),
    .reset(reset), //active low reset
    .setting(setting),
    .stop(stop),
    .enable0(cnt_digit0),
    .enable1(cnt_digit1),
    .pb_set(set_min),
    .leds(leds)
);
syndwcnt3_BCD U_SC3(
    .leds(leds),
    .q_out(cnt_digit3),
    .clk(clk_d), // clock
    .clk_faster(clk_d),
    .reset(reset), //active low reset
    .setting(setting),
    .stop(stop),
    .enable0(cnt_digit0),
    .enable1(cnt_digit1),
    .enable2(cnt_digit2),
    .pb_set(set_min)
);
scanctl_2bitBCD U_SC(
    .ssd_ctl(ssd_ctl), // ssd display control signal 
    .ssd_in(ssd_in), // output to ssd display
    .in0(cnt_digit3), // 1st input
    .in1(cnt_digit2), // 2nd input
    .in2(cnt_digit1), // 3st input
    .in3(cnt_digit0), // 4nd input
    .clk_ssd(clk_s) // divided clock for scan control
);
// SSD display
SSDdisplay_2bitBCD U_SD(
    .segs(segs),
    .bin(ssd_in)
);
pause_top U_LT(
    .clk(clk),
    .reset(reset),
    .pause_in(pause_in),
    .pause(pause)
);
stop_top U_ST(
    .clk(clk),
    .reset(reset),
    .stop_in(stop_in),
    .stop(stop)
);
set_top U_SST(
    .clk(clk),
    .reset(reset),
    .set_in(set_sec_in),
    .counter_set(set_sec)
);
set_top U_SMT(
    .clk(clk),
    .reset(reset),
    .set_in(set_min_in),
    .counter_set(set_min)
);
endmodule
   