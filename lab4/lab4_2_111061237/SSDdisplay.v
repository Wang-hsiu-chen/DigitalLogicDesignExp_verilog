// de ne segment codes
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
`define SS_A 8'b00010001
`define SS_B 8'b11000001
`define SS_C 8'b01100011
`define SS_D 8'b10000101
`define SS_E 8'b01100001
`define SS_F 8'b01110001

module SSDdisplay(ssd_in, ssd_ctl, cnt_out);
output reg[7:0] ssd_in; 
output [3:0] ssd_ctl;
input [3:0] cnt_out;

assign ssd_ctl = 4'b1110;
always @* begin
    case (cnt_out)
        4'h0:
            ssd_in = `SS_0;
        4'h1:
            ssd_in = `SS_1;
        4'h2:
            ssd_in = `SS_2;
        4'h3:
            ssd_in = `SS_3;
        4'h4:
            ssd_in = `SS_4;
        4'h5:
            ssd_in = `SS_5;
        4'h6:
            ssd_in = `SS_6;
        4'h7:
            ssd_in = `SS_7;
        4'h8:
            ssd_in = `SS_8;
        4'h9:
            ssd_in = `SS_9;
        4'hA:
            ssd_in = `SS_A;
        4'hB:
            ssd_in = `SS_B;
        4'hC:
            ssd_in = `SS_C;
        4'hD:
            ssd_in = `SS_D;
        4'hE:
            ssd_in = `SS_E;
        4'hF:
            ssd_in = `SS_F;
        default: ssd_in = 8'b0000000;
    endcase
end
endmodule
