`timescale 1ns / 1ps

`include "constant.v"
module ringcounter_marquee(
    output reg[8:0] count, 
    input clk, rst_n
);

always @(posedge clk, negedge rst_n) begin
    if (~rst_n) begin
        count <= 9'b000000001;
    end
    else begin
        count[0] <= count[8];
        count[1] <= count[0];
        count[2] <= count[1];
        count[3] <= count[2];
        count[4] <= count[3];
        count[5] <= count[4];
        count[6] <= count[5];
        count[7] <= count[6];
        count[8] <= count[7];
    end
end
endmodule