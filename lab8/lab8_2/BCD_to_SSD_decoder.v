`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/18 01:29:22
// Design Name: 
// Module Name: BCD_to_SSD_decoder
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


`define ss_0 8'b0000_0011
`define ss_1 8'b1001_1111
`define ss_2 8'b0010_0101
`define ss_3 8'b0000_1101
`define ss_4 8'b1001_1001
`define ss_5 8'b0100_1001
`define ss_6 8'b0100_0001
`define ss_7 8'b0001_1111
`define ss_8 8'b0000_0001
`define ss_9 8'b0000_1001
`define ss_n 8'b1111_1111

module BCD_to_SSD_decoder(
    input [3:0] q,
    output reg [7:0] ssd_signal
    );
    
    always @*
        case(q)
            4'd0: ssd_signal = `ss_0;
            4'd1: ssd_signal = `ss_1;
            4'd2: ssd_signal = `ss_2;
            4'd3: ssd_signal = `ss_3;
            4'd4: ssd_signal = `ss_4;
            4'd5: ssd_signal = `ss_5;
            4'd6: ssd_signal = `ss_6;
            4'd7: ssd_signal = `ss_7;
            4'd8: ssd_signal = `ss_8;
            4'd9: ssd_signal = `ss_9;
            4'd15: ssd_signal = `ss_n;
            default: ssd_signal = `ss_n;
        endcase
endmodule
