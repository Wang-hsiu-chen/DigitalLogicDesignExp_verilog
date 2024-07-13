`timescale 1ns / 1ps

module timer50to0(
    clk, // clock from oscillator
    reset, // active low reset
    speedup,
    pause_in,
    rst_in,
    segs,
    ssd_ctl,
    led
);

input clk; // clock from cristal
input reset; // active low reset
input pause_in; //push button input
input rst_in;
input speedup;
output [15:0] led;
output [7:0] segs;
output [3:0] ssd_ctl;
wire clk_d, clk_100, borrow0, borrow1;
wire [1:0] clk_s;
wire [3:0] cnt_digit0, cnt_digit1, ssd_in, counter_pause, counter_reset; // binary counter output

// Frequency Divider
clock_generator U_FD0(
    .clk_out1(clk_d), //divided clock output
    .clk_out100(clk_100),
    .clk_ssd(clk_s),
    .clk(clk), // clock from the 40MHz oscillator
    .reset(reset), // low active reset
    .speedup(speedup)
);
// Binary Counter
syndwcnt0_BCD U_SC0(
    .enable(counter_pause),
    .q(cnt_digit0), //counter output
    .borrow(borrow0),
    .clk(clk_d), // clock
    .reset(reset), //active low reset
    .counter_reset(counter_reset),
    .leds(led)
);
syndwcnt1_BCD U_SC1(
    .enable(cnt_digit0),
    .q(cnt_digit1), //counter output
    .borrow(borrow1),
    .clk(clk_d), // clock
    .reset(reset), //active low reset
    .counter_reset(counter_reset),
    .leds(led)
);
scanctl_2bitBCD U_SC(
    .ssd_ctl(ssd_ctl), // ssd display control signal 
    .ssd_in(ssd_in), // output to ssd display
    .in0(cnt_digit1), // 1st input
    .in1(cnt_digit0), // 2nd input
    .in2(4'd0), // 3st input
    .in3(4'd0), // 4nd input
    .clk_ssd(clk_s) // divided clock for scan control
);
// SSD display
SSDdisplay_2bitBCD U_SD(
    .segs(segs),
    .bin(ssd_in)
);
pause_top U_PT(
    .clk(clk),
    .reset(reset),
    .pause_in(pause_in),
    .counter_enable(counter_pause)
);
reset_top U_RT(
    .clk(clk),
    .reset(reset),
    .rst_in(rst_in),
    .counter_reset(counter_reset)
);
endmodule
   