`timescale 1ns / 1ps

`define SS_a 8'b00000101
`define SS_D 8'b10000101
`define SS_e 8'b01100001
`define SS_F 8'b01110001
`define SS_i 8'b11110011
`define SS_L 8'b11100011
`define SS_M 8'b10000001
`define SS_o 8'b11000101
`define SS_R 8'b11110101
`define SS_S 8'b01001001
`define SS_non 8'b11111111

module SSDdisplay(
    output reg[7:0] segs,
    input [3:0] bin
);

always @* begin
    case (bin)
        4'd1: begin
            segs = `SS_a;
        end
        4'd2: begin
            segs = `SS_D;
        end
        4'd3: begin
            segs = `SS_e;
        end
        4'd4: begin
            segs = `SS_F;
        end
        4'd5: begin
            segs = `SS_i;
        end
        4'd6: begin
            segs = `SS_L;
        end
        4'd7: begin
            segs = `SS_M;
        end
        4'd8: begin
            segs = `SS_o;
        end
        4'd9: begin
            segs = `SS_R;
        end
        4'd10: begin
            segs = `SS_S;
        end
        default: segs = 8'b11111111;
    endcase
end
endmodule
