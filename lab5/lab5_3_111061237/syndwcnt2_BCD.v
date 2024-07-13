module syndwcnt2_BCD(
    q_out, // counter output
    clk, // global clock
    clk_faster,
    reset, // active low reset
    stop,
    enable0,
    enable1,
    pb_set,
    setting,
    leds
);

output [3:0] q_out; // counter output
input clk; // global clock
input clk_faster;
input reset; // active low reset
input stop;
input pb_set;
input setting;
input [3:0] enable0, enable1;
input [11:0] leds;

reg [3:0] q, q_out, count_temp, num;
reg clk_counter;

always @* begin
if (leds != 12'b111111111111 && ~stop && ~setting) begin
    clk_counter = clk;
    if (enable0 == 4'd0 && enable1 == 4'd0 && q > 4'd0) begin
        count_temp = q - 1'b1;
        num = num ;
    end
    else if (enable0 == 4'd0 && enable1 == 4'd0 && q == 4'd0) begin
        count_temp = 4'd9;
        num = num ;
    end
    else begin
        count_temp = q;
        num = num ;
    end
end
else if (leds != 12'b111111111111 &&  ~stop && setting) begin
    clk_counter = clk_faster;
    if (pb_set == 1'b1 && q != 4'd9) begin
        count_temp = q + 1'b1;
        num = num + 1'b1;
    end
    else if (pb_set == 1'b1 && q == 4'd9) begin
        count_temp = 4'd0;
        num = 1'b0;
    end
    else begin
        count_temp = q;
        num = num ;
    end
end
else if (leds !== 12'b111111111111 && stop && ~setting) begin
    clk_counter = clk;
    count_temp = num;
    num = num;
end
else if (leds == 12'b111111111111 && ~stop && ~setting) begin
    clk_counter = clk;
    count_temp = q;
    num = 0;
end
else begin
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