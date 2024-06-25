module synupcnt_BCD(
    enable,
    q, // counter output
    carry,
    clk, // global clock
    reset // active low reset
);

output [3:0] q; // counter output
output carry;
input clk; // global clock
input reset; // active low reset
input [3:0] enable;
reg [3:0] q, count_temp; // input to dff (in always block)
reg carry;

always @* begin
    if (enable == 4'd9 && q == 4'd9) begin
        count_temp = 4'd0;
        carry = 1;
    end
    else if (enable == 4'd9 && q != 4'd9) begin
        count_temp = q + 1'b1;
        carry = 0;
    end
    else
        count_temp = q;
        carry = 0;
end
always @(posedge clk or negedge reset)
    if (~reset)
        q <= 1'b0;
    else 
        q <= count_temp;
endmodule