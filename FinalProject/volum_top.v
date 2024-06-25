module volume_top(
    clk_100,
    clk_10K,
    rst_n, //active low rst_n
    volume_in, //push button input
    volume_out
);
input clk_100;
input clk_10K;
input rst_n; //active low rst_n
input volume_in; //push button input
output volume_out;
// Declare internal nodes
wire pb_deb; // push button debounced out

// debounce circuit
debounce_circuit U_dc(
    .clk(clk_10K), // clock control
    .rst_n(rst_n), // rst_n
    .pb_in(volume_in), //push button input
    .pb_deb(pb_deb) // debounced push button out
);
   // 1 pulse generation circuit
one_pulse U_op(
   .clk(clk_100), // clock input
   .rst_n(rst_n), //active low rst_n
   .in_trig(pb_deb), // input trigger
   .out_pulse(volume_out) // output one pulse
);
endmodule