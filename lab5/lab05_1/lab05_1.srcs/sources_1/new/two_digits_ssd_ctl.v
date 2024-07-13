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


module two_digits_ssd_ctl(
    input clk_scan,
    output [3:0] code,
    output [3:0] ssd_ctl,
    input [3:0] q0,
    input [3:0] q1
    );
    
    reg [3:0] code, ssd_ctl;
    
    always @*
        case(clk_scan)
            1'b0:
            begin
                ssd_ctl = 4'b0111;
                code = q0;
            end
            1'b1:
            begin
                ssd_ctl = 4'b1011;
                code = q1;
            end
            default:
            begin
                ssd_ctl = 4'b1101;
                code = 4'b0000;
            end
        endcase
endmodule
