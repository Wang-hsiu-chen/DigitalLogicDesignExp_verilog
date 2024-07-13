`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/18 21:29:47
// Design Name: 
// Module Name: two_digits_ssd_ctl
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


module SSD_CTL(
    input [1:0] clk_scan,
    output [3:0] code,
    output [3:0] ssd_ctl,
    input [3:0] q0,
    input [3:0] q1,
    input [3:0] q2,
    input [3:0] q3
    );
    
    reg [3:0] code, ssd_ctl;
    
    always @*
        case(clk_scan)
            2'b00:
            begin
                ssd_ctl = 4'b0111;
                code = q0;
            end
            2'b01:
            begin
                ssd_ctl = 4'b1011;
                code = q1;
            end
            2'b10:
            begin
                ssd_ctl = 4'b1101;
                code = q2;
            end
            2'b11:
            begin
                ssd_ctl = 4'b1110;
                code = q3;
            end
            
            default:
            begin
                ssd_ctl = 4'b1101;
                code = 4'b0000;
            end
        endcase
endmodule
