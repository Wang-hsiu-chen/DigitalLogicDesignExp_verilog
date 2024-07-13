module synupcnt2_BCD(
    enable0,
    enable1,
    rst,
    q,
    q_out, // counter output
    clk, // global clock
    reset, // active low reset
    lap
);

output [3:0] q, q_out; // counter output
input clk; // global clock
input reset; // active low reset
input lap;
input [3:0] enable0;
input [3:0] enable1;
input rst;
reg [3:0] q, q_out, count_temp;

always @* begin
    if (enable0 == 4'd9 && enable1 == 4'd5 && q < 4'd9) begin
        count_temp = q + 1'b1;
    end
    else if (enable0 == 4'd9 && enable1 == 4'd5 && q == 4'd9) begin
        count_temp = 4'd0;
    end
    else
        count_temp = q;
    
    if (lap != 1) begin
        q_out = q;
    end
    else begin
        q_out = q_out;
    end
end

always @(posedge clk or negedge reset)
    if (~reset || rst)
        q <= 4'd0;
    else 
        q <= count_temp;
endmodule