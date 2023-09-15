module ring_counter1Hz(
    clk, // clock from oscillator
    reset, // active low reset
    count
);

input clk; // clock from oscillator
input reset; // active low reset
output [7:0]count;
wire clk_d; // frequency-divided clock
wire [7:0] count; // binary counter output

// Frequency Divider
count50M U_FD0(
    .clk_out(clk_d), //divided clock output
    .clk(clk), // clock from the 40MHz oscillator
    .reset(reset) // low active reset
);
// Binary Counter
ring_counter U_RC(
    .count(count), //counter output
    .clk(clk_d), // clock
    .reset(reset) //active low reset
);

endmodule
   