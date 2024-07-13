`timescale 1ns / 1ps

module stopwatch(
    clk, // clock from oscillator
    reset, // active low reset
    speedup,
    lap_in,
    stop_in,
    segs,
    ssd_ctl,
    lap,
    stop
);

input clk; // clock from cristal
input reset; // active low reset
input lap_in; //push button input
input stop_in;
input speedup;
output [7:0] segs;
output [3:0] ssd_ctl;
output lap, stop;
wire rst, clk_d, clk_100;
wire [1:0]clk_s;
wire [3:0] q0, q1, q2, cnt_digit0, cnt_digit1, cnt_digit2, cnt_digit3, ssd_in; // binary counter output

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
synupcnt0_BCD U_SC0(
    .enable(~stop),
    .q(q0),
    .q_out(cnt_digit0),
    .rst(rst),
    .clk(clk_d), // clock
    .reset(reset), //active low reset
    .lap(lap)
);
synupcnt1_BCD U_SC1(
    .enable(q0),
    .q(q1),
    .q_out(cnt_digit1),
    .rst(rst),
    .clk(clk_d), // clock
    .reset(reset), //active low reset
    .lap(lap)
);
synupcnt2_BCD U_SC2(
    .enable0(q0),
    .enable1(q1),
    .q(q2),
    .q_out(cnt_digit2),
    .rst(rst),
    .clk(clk_d), // clock
    .reset(reset), //active low reset
    .lap(lap)
);
synupcnt3_BCD U_SC3(
    .enable0(q0),
    .enable1(q1),
    .enable2(q2),
    .q_out(cnt_digit3),
    .rst(rst),
    .clk(clk_d), // clock
    .reset(reset), //active low reset
    .lap(lap)
);
scanctl_2bitBCD U_SC(
    .ssd_ctl(ssd_ctl), // ssd display control signal 
    .ssd_in(ssd_in), // output to ssd display
    .in0(cnt_digit3), // 1st input
    .in1(cnt_digit2), // 2nd input
    .in2(cnt_digit1), // 3st input
    .in3(cnt_digit0), // 4nd inpt
    .clk_ssd(clk_s) // divided clock for scan control
);
// SSD display
SSDdisplay_2bitBCD U_SD(
    .segs(segs),
    .bin(ssd_in)
);
lap_top U_LT(
    .clk(clk),
    .reset(reset),
    .speedup(speedup),
    .lap_in(lap_in),
    .lap(lap)
);
stop_top U_ST(
    .clk(clk),
    .reset(reset),
    .speedup(speedup),
    .stop_in(stop_in),
    .stop(stop)
);
endmodule
   