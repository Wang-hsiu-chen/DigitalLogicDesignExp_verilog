module counter(
    mode_selection,
    pb_l,
    counter_num, // counter output
    clk, // global clock
    rst_n // active low rst_n
);

output reg[3:0] counter_num; // counter output
input clk; // global clock
input rst_n, mode_selection; // active low rst_n
input pb_l;
reg [3:0] tmp_cnt; // input to dff (in always block)

always @*
if (mode_selection) begin
        if (pb_l && counter_num != 4'd9) begin
            tmp_cnt = counter_num + 1'b1;
        end
        else if (pb_l && counter_num == 4'd9) begin
            tmp_cnt = 4'd0;
        end
        else tmp_cnt = counter_num;
end
else begin
    tmp_cnt = counter_num;
end

always @(posedge clk or negedge rst_n)
    if (~rst_n)
        counter_num <= 4'd1;
    else 
        counter_num <= tmp_cnt;
endmodule