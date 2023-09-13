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

module display(SSD, d, i);
output [7:0] SSD; 
output [3:0] d;
input [3:0] i;
reg [7:0] SSD; 
reg [3:0] d;
always @* begin
    case (i)
        4'h0: begin
            SSD = `SS_0;
            d = 4'd0;
        end
        4'h1: begin
            SSD = `SS_1;
            d = 4'd1;
        end
        4'h2: begin
            SSD = `SS_2;
            d = 4'd2;
        end
        4'h3: begin
            SSD = `SS_3;
            d = 4'd4;
        end
        4'h4: begin
            SSD = `SS_4;
            d = 4'd4;
        end
        4'h5: begin
            SSD = `SS_5;
            d = 4'd5;
        end
        4'h6: begin
            SSD = `SS_6;
            d = 4'd6;
        end
        4'h7: begin
            SSD = `SS_7;
            d = 4'd7;
        end
        4'h8: begin
            SSD = `SS_8;
            d = 4'd8;
        end
        4'h9: begin
            SSD = `SS_9;
            d = 4'd9;
        end
        4'hA: begin
            SSD = `SS_A;
            d = 4'd10;
        end
        4'hB: begin
            SSD = `SS_B;
            d = 4'd11;
        end
        4'hC: begin
            SSD = `SS_C;
            d = 4'd12;
        end
        4'hD: begin
            SSD = `SS_D;
            d = 4'd13;
        end
        4'hE: begin
            SSD = `SS_E;
            d = 4'd14;
        end
        4'hF: begin
            SSD = `SS_F;
            d = 4'd15;
        end
        default: SSD = 8'b0000000;
    endcase
    end
endmodule
