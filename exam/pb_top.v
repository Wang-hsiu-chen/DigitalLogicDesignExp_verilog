module pb_top(
    clk_100,
    clk_10K,
    rst_n, //active low rst_n
    pb_in, //push button input
    pb_out
);
input clk_100;
input clk_10K;
input rst_n; //active low rst_n
input pb_in; //push button input
output pb_out;
// Declare internal nodes
wire pb_deb; // push button debounced out

// debounce circuit
debounce_circuit U_dc(
    .clk(clk_100), // clock control
    .rst_n(rst_n), // rst_n
    .pb_in(pb_in), //push button input
    .pb_deb(pb_deb) // debounced push button out
);
   // 1 pulse generation circuit
one_pulse U_op(
   .clk(clk_100), // clock input
   .rst_n(rst_n), //active low rst_n
   .in_trig(pb_deb), // input trigger
   .out_pulse(pb_out) // output one pulse
);
endmodule