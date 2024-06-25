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

module SSDdisplay_BCD(ssd_in, ssd_ctl, cnt_out);
output reg[7:0] ssd_in; 
output [3:0] ssd_ctl;
input [3:0] cnt_out;

assign ssd_ctl = 4'b1110;
always @* begin
    case (cnt_out)
        4'd0: begin
            ssd_in = `SS_0;
        end
        4'd1: begin
            ssd_in = `SS_1;
        end
        4'd2: begin
            ssd_in = `SS_2;
        end
        4'd3: begin
            ssd_in = `SS_3;
        end
        4'd4: begin
            ssd_in = `SS_4;
        end
        4'd5: begin
            ssd_in = `SS_5;
        end
        4'd6: begin
            ssd_in = `SS_6;
        end
        4'd7: begin
            ssd_in = `SS_7;
        end
        4'd8: begin
            ssd_in = `SS_8;
        end
        4'd9: begin
            ssd_in = `SS_9;
        end
        default: ssd_in = 8'b0000000;
    endcase
end
endmodule
