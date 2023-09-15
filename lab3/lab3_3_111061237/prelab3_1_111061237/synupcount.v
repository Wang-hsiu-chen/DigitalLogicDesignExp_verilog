module synupcount(
    q, // counter output
    clk, // global clock
    reset // active low reset
);

output reg[3:0] q; // counter output
input clk; // global clock
input reset; // active low reset
reg [3:0] tmp_cnt; // input to dff (in always block)

always @*
    tmp_cnt = q + 1'b1;

always @(posedge clk or negedge reset)
    if (~reset)
        q<=0;
    else 
        q<=tmp_cnt;
endmodule