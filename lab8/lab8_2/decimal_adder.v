`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/30 19:24:16
// Design Name: 
// Module Name: decimal_adder
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


module decimal_adder(
    input [3:0] A,
    input [3:0] B,
    input cin,
    output reg [3:0] n0,
    output reg [3:0] n1
    );
    
    reg [3:0] S0, A0;
    reg cout, K;
    
    always @* begin
        {K, S0} = A + B + cin;
        cout = (S0[3] & S0[2]) | (S0[3] & S0[1]) | K;
        if (cout) begin
            A0 = 4'b0110;
            n1 = 4'd1;
        end
        else begin
            A0 =4'b0000;
            n1 = 4'd0;
        end
        n0 = S0 + A0;
    end
    
endmodule
