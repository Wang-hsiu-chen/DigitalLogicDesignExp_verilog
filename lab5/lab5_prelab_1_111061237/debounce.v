module debounce_circuit(
    clk, // clock control
    reset, // reset
    pb_in, //push button input
    pb_deb // debounced push button output
);
// declare the I/Os
input clk; // clock control
input reset; // reset
input pb_in; //push button input
output pb_deb; // debounced push button output
reg pb_deb; // debounced push button output
// declare the internal nodes
reg [3:0] debounce_window; // shift register flip flop
reg pb_debounced_next; // debounce result
// Shift register
always @(posedge clk or negedge reset)
    if (~reset)
        debounce_window <= 4'd0;
    else
        debounce_window <= {debounce_window[2:0], pb_in};
// debounce circuit
always @*
    if (debounce_window == 4'b1111)
        pb_debounced_next = 1'b1;
    else
        pb_debounced_next = 1'b0;
always @(posedge clk or negedge reset)
    if (~reset)
        pb_deb <= 1'b0;
    else
        pb_deb <= pb_debounced_next;
endmodule
