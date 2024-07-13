module synupcnt0_BCD(
    enable,
    q, 
    q_out,
    rst,
    clk, // global clock
    reset, // active low reset
    lap
);

output [3:0] q, q_out;
output rst;
input clk; // global clock
input reset; // active low reset
input lap;
input enable;

reg [3:0] q, q_out, count_temp; // input to dff (in always block)
reg rst;

always @* begin
    rst = (enable == 0 & lap == 1);
    if (enable == 1'b1 && q < 4'd9) begin
        count_temp = q + 1'b1;
    end
    else if (enable == 1'b1 && q == 4'd9) begin
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