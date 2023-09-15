`timescale 1ns / 1ps

`include "constant.v"
module display_marquee(
  segs, // 14-segment segs output
  bin  // binary input
);
output reg[7:0] segs; // 7-segment segs out
input [9:0] bin; // binary input

// Combinatioanl Logic
always @*
	case (bin)
		10'b0000000001: segs = `SS_1;
		10'b0000000010: segs = `SS_1;
		10'b0000000100: segs = `SS_1;
		10'b0000001000: segs = `SS_0;
		10'b0000010000: segs = `SS_0;
		10'b0000100000: segs = `SS_6;
		10'b0001000000: segs = `SS_1;
		10'b0010000000: segs = `SS_2;
		10'b0100000000: segs = `SS_3;
		10'b1000000000: segs = `SS_7;
		default: segs = `SSD_DEF;
  	endcase

endmodule
