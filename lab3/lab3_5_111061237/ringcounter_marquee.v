`timescale 1ns / 1ps

`include "constant.v"
module ringcounter_marquee(
    output reg[9:0] count, 
    input clk, reset
);

always @(posedge clk, negedge reset) begin
    if (~reset) begin
        count <= 10'b0000000001;
    end
    else begin
        count[0] <= count[9];
        count[1] <= count[0];
        count[2] <= count[1];
        count[3] <= count[2];
        count[4] <= count[3];
        count[5] <= count[4];
        count[6] <= count[5];
        count[7] <= count[6];
        count[8] <= count[7];
        count[9] <= count[8];
    end
end
endmodule