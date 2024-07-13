module syndwcnt1_BCD(
    enable,
    q, // counter output
    borrow,
    clk, // global clock
    reset, // active low reset\
    counter_reset,
    leds
);

output [13:0] leds;
output [3:0] q; // counter output
output borrow;
input clk; // global clock
input reset; // active low reset
input counter_reset;
input [3:0] enable;

reg [13:0] leds;
reg [3:0] q, count_temp, enable_temp; // input to dff (in always block)
reg borrow;

always @* begin
    if (reset && ~counter_reset && enable == 4'd0 && q == 4'd0 && leds != 14'b11111111111111) begin
        leds = 14'b11111111111111;
        count_temp = 4'd5;
        borrow = 1;
    end
    else if (reset && ~counter_reset && enable == 4'd0 && q != 4'd0 && leds != 14'b11111111111111) begin
        count_temp = q - 1'b1;
        borrow = 0;
    end
    else begin
        count_temp = q;
        borrow = 0;
    end
    if (~reset) leds = 14'b00000000000000;
end
always @(posedge clk or negedge reset)
    if (~reset || counter_reset)
        q <= 4'd5;
    else 
        q <= count_temp;
endmodule