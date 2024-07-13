module one_pulse(
    clk, // clock input
    reset, //active low reset
    in_trig, // input trigger
    out_pulse // output one pulse
);
// Declare I/Os
input clk; // clock input
input reset; //active low reset
input in_trig; // input trigger
output out_pulse; // output one pulse
reg out_pulse; // output one pulse
// Declare internal nodes
reg in_trig_delay;
// Buffer input
always @(posedge clk or negedge reset)
    if (~reset)
        in_trig_delay <= 1'b0;
    else
        in_trig_delay <= in_trig;
// Pulse generation
assign out_pulse_next = in_trig & (~in_trig_delay);
always @(posedge clk or negedge reset)
    if (~reset)
        out_pulse <=1'b0;
    else
        out_pulse <= out_pulse_next;
endmodule