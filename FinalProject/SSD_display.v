`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/02 18:08:17
// Design Name: 
// Module Name: SSD_display
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


`define SS_0 8'b00000011
`define SS_1 8'b10011111
`define SS_2 8'b00100101
`define SS_3 8'b00001101
`define SS_4 8'b10011001
`define SS_5 8'b01001001
`define SS_6 8'b01000001
`define SS_7 8'b00011111
`define SS_8 8'b00000001
`define SS_9 8'b00001001

module SSD_display(
    input [3:0] ssd_in,
    output reg [7:0] segs
);

always @* begin
    case (ssd_in)
        4'd0: begin
            segs = `SS_0;
        end
        4'd1: begin
            segs = `SS_1;
        end
        4'd2: begin
            segs = `SS_2;
        end
        4'd3: begin
            segs = `SS_3;
        end
        4'd4: begin
            segs = `SS_4;
        end
        4'd5: begin
            segs = `SS_5;
        end
        4'd6: begin
            segs = `SS_6;
        end
        4'd7: begin
            segs = `SS_7;
        end
        4'd8: begin
            segs = `SS_8;
        end
        4'd9: begin
            segs = `SS_9;
        end
        default: segs = 8'b0000000;
    endcase
end
endmodule
