module stop_top(
    clk, // Clock from crystal
    reset, //active low reset
    stop_in, //push button input
    stop
);
// Declare I/Os
input clk; // Clock from crystal
input reset; //active low reset
input stop_in; //push button input
output stop;
// Declare internal nodes
wire [1:0] clk_s;
wire pb_deb, clk_1, clk_10, clk_100, one_in; // push button debounced out
// Clock generator module
clock_generator U_cg(
    .clk(clk), // clock from crystal
    .reset(reset), // active low reset
    .speedup(1'b0),
    .clk_out1(clk_1), // generated 1 Hz clock
    .clk_out10(clk_10),
    .clk_out100(clk_100), // generated 100 Hz clock
    .clk_ssd(clk_s)
);
// debounce circuit
debounce_circuit U_dc(
    .clk(clk_100), // clock control
    .reset(reset), // reset
    .pb_in(stop_in), //push button input
    .pb_deb(pb_deb) // debounced push button out
);
   // 1 pulse generation circuit
one_pulse U_op(
    .clk(clk_100), // clock input
    .reset(reset), //active low reset
    .in_trig(pb_deb), // input trigger
    .out_pulse(stop) // output one pulse
);
// stop_fsm U_pf(
//     .clk(clk),
//     .reset(reset),
//     .in(one_in),
//     .counter_stop(stop)
// );
endmodule
   