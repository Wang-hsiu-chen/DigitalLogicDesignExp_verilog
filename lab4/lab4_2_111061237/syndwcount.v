module syndwcount(
    q, // counter output
    clk, // global clock
    reset // active low reset
);

output reg[3:0] q; // counter output
input clk; // global clock
input reset; // active low reset
reg [3:0] tmp_cnt; // input to dff (in always block)

//assign q = 4'd9;
always @* begin
    if (q == 0) begin
        tmp_cnt = 4'hF;
    end
    else
        tmp_cnt = q - 1'b1;
end
always @(posedge clk or negedge reset)
    if (~reset)
        q <= 4'hF;
    else 
        q <= tmp_cnt;
endmodule