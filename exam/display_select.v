`timescale 1ns / 1ps
`include "constant.v"
module display_select(
	input [3:0] id,
	output reg [7:0] SSD
);

// Combinatioanl Logic
always @*
	case (id)
		4'd0: SSD = `SS_0;
		4'd1: SSD = `SS_1;
		4'd2: SSD = `SS_2;
		4'd3: SSD = `SS_3;
		4'd4: SSD = `SS_4;
		4'd5: SSD = `SS_5;
		4'd6: SSD = `SS_6;
		4'd7: SSD = `SS_7;
		4'd8: SSD = `SS_8;
		4'd9: SSD = `SS_9;
		default: SSD = `SS_0;
	endcase
endmodule
