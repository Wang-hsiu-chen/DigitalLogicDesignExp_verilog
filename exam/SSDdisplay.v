`timescale 1ns / 1ps
`include "constant.v"
module SSDdisplay(
	output reg[7:0] segs, // 14-segment segs output
	input [9:0] bin,  // binary input
	input [7:0] SSD_1, SSD_2, SSD_3, SSD_4, SSD_5, SSD_6, SSD_7, SSD_8, SSD_9
);

// Combinatioanl Logic
always @*
	case (bin)
		9'b000000001: segs = SSD_1;
		9'b000000010: segs = SSD_2;
		9'b000000100: segs = SSD_3;
		9'b000001000: segs = SSD_4;
		9'b000010000: segs = SSD_5;
		9'b000100000: segs = SSD_6;
		9'b001000000: segs = SSD_7;
		9'b010000000: segs = SSD_8;
		9'b100000000: segs = SSD_9;
		default: segs = `SSD_DEF;
  	endcase

endmodule
