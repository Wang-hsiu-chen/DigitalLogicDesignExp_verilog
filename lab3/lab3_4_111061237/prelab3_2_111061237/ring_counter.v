module ring_counter(
    output reg[7:0] count,
    input clk, reset
);

always @(posedge clk, negedge reset) begin
    if (~reset) begin
        count <= 8'b11011101;
    end
    else begin
        count[0] <= count[7];
        count[1] <= count[0];
        count[2] <= count[1];
        count[3] <= count[2];
        count[4] <= count[3];
        count[5] <= count[4];
        count[6] <= count[5];
        count[7] <= count[6];
    end
end
endmodule