`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/02 18:03:02
// Design Name: 
// Module Name: LFSR
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LFSR(
    input clk, rst_n,
    input [7:0] start_rand,
    output reg [7:0] rand
);
reg [7:0] temp_rand;

always @(*) begin
    temp_rand[0] = rand[0] ^ rand[5] ^ rand[6] ^ rand[7];
    temp_rand[1] = rand[0];
    temp_rand[2] = rand[1];
    temp_rand[3] = rand[2];
    temp_rand[4] = rand[3];
    temp_rand[5] = rand[4];
    temp_rand[6] = rand[5];
    temp_rand[7] = rand[6];
end

always @(posedge clk, negedge rst_n) begin
    if (~rst_n) begin
        rand <= start_rand;
    end
    else begin
        rand <= temp_rand;
    end
end
endmodule
