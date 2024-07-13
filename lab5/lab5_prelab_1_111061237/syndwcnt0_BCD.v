module syndwcnt0_BCD(
    enable,
    q, // counter output
    borrow,
    clk, // global clock
    reset, // active low reset
    counter_reset,
    leds
);

output [3:0] q; // counter output
output borrow;
input clk; // global clock
input reset; // active low reset
input counter_reset;
input enable;
input [13:0] leds;

reg [3:0] q, count_temp; // input to dff (in always block)
reg borrow;

always @* begin
    if (reset && ~counter_reset && enable == 1'b1 && q > 4'd0 && leds != 14'b11111111111111) begin
        count_temp = q - 1'b1;
        borrow = 0;
    end
    else if (reset && ~counter_reset && enable == 1'b1 && q == 4'd0 && leds != 14'b11111111111111) begin
        count_temp = 4'd9;
        borrow = 1;
    end
    else if (leds == 14'b11111111111111) count_temp = q;
    else
        count_temp = q;
        borrow = 0;
end
always @(posedge clk or negedge reset)
    if (~reset || counter_reset)
        q <= 4'd0;
    else 
        q <= count_temp;
endmodule