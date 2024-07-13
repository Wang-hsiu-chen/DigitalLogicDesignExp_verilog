module syndwcnt3_BCD(
    leds,
    q_out, // counter output
    clk, // global clock
    clk_faster,
    reset, // active low reset
    stop,
    enable0,
    enable1,
    enable2,
    pb_set,
    setting
);

output [11:0] leds;
output [3:0] q_out; // counter output
input clk; // global clock
input clk_faster;
input reset; // active low reset
input stop;
input pb_set;
input setting;
input [3:0] enable0, enable1, enable2;

reg clk_counter, finish;
reg [3:0] q, q_out, count_temp, num;
reg [11:0] leds;

always @* begin
if (leds != 12'b111111111111 && ~stop && ~setting) begin
    clk_counter = clk;
    if (enable0 == 4'd0 && enable1 == 4'd0 && enable2 == 4'd0 && q > 4'd0) begin
        leds = 12'b000000000000;
        count_temp = q - 1'b1;
        num = num ;
    end
    else if (enable0 == 4'd0 && enable1 == 4'd0 && enable2 == 4'd0 && q == 4'd0) begin
        leds = 12'b111111111111;
        count_temp = 4'd5;
        num = num ;
    end
    else begin
        leds = 12'b000000000000;
        count_temp = q;
        num = num ;
    end
end
else if (leds != 12'b111111111111 &&  ~stop && setting) begin
    clk_counter = clk_faster;
    if (pb_set && enable2 == 4'd9 && q != 4'd5) begin
        leds = 12'b000000000000;
        count_temp = q + 1'b1;
        num = num + 1'b1;
    end
    else if (pb_set && enable2 == 4'd9 && q == 4'd5) begin
        leds = 12'b000000000000;
        count_temp = 4'd0;
        num = 1'b0;
    end
    else begin
        leds = 12'b000000000000;
        count_temp = q;
        num = num ;
    end
end
else if (leds != 12'b111111111111 && stop && ~setting) begin
    leds = 12'b000000000000;
    clk_counter = clk;
    count_temp = num;
    num = num;
end
else if (leds == 12'b111111111111 && ~stop && ~setting) begin
    if (~reset) leds = 12'b000000000000;
    else leds = 12'b111111111111;
    clk_counter = clk;
    count_temp = q;
    num = 0;
end
//else if (~reset) begin
//    leds = 12'b0000000000;
//    finish = 1'b0;
//end
else begin
    leds = leds;
    clk_counter = clk;
    count_temp = q;
    num = num ;
end

q_out = q;
end

always @(posedge clk_counter or negedge reset) begin
    if (~reset)
        q <= 4'd0;
    else 
        q <= count_temp;
end
endmodule