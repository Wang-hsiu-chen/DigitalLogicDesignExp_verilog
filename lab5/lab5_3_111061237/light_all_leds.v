module lightup_all_leds(
    clk, // global clock
    reset, // active low reset
    q_in0,
    q_in3,
    stop,
    all_leds
);

output stop;
output [11:0] all_leds;
input clk; // global clock
input reset; // active low reset
input [3:0] q_in0;
input [3:0] q_in3;

reg stop;
reg [11:0] all_leds;

always @* begin
    if (q_in0 == 4'd0 && q_in3 == 4'd0) begin
        stop = 1'b1;
        all_leds = 12'b111111111111;
    end
    else begin
        stop = 1'b0;
        all_leds = 12'b000000000000;
    end
end
endmodule