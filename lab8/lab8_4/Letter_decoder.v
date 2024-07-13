`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/08 21:52:35
// Design Name: 
// Module Name: Letter_decoder
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


module Letter_decoder(
    input [511:0] key_down,
    input caps_lock,
    output reg [6:0] ascii,
    output reg [3:0] s0,
    output reg [3:0] s1,
    output reg [3:0] s2
    );
    
    always @* begin
        ascii = 7'd0;
        if (caps_lock && !(key_down[9'h059] == 1'b1 || key_down[9'h012] == 1'b1)) begin
            if (key_down[9'h01C]) ascii = 7'd65;
            if (key_down[9'h032]) ascii = 7'd66;
            if (key_down[9'h021]) ascii = 7'd67;
            if (key_down[9'h023]) ascii = 7'd68;
            if (key_down[9'h024]) ascii = 7'd69;
            if (key_down[9'h02B]) ascii = 7'd70;
            if (key_down[9'h034]) ascii = 7'd71;
            if (key_down[9'h033]) ascii = 7'd72;
            if (key_down[9'h043]) ascii = 7'd73;
            if (key_down[9'h03B]) ascii = 7'd74;
            if (key_down[9'h042]) ascii = 7'd75;
            if (key_down[9'h04B]) ascii = 7'd76;
            if (key_down[9'h03A]) ascii = 7'd77;
            if (key_down[9'h031]) ascii = 7'd78;
            if (key_down[9'h044]) ascii = 7'd79;
            if (key_down[9'h04D]) ascii = 7'd80;
            if (key_down[9'h015]) ascii = 7'd81;
            if (key_down[9'h02D]) ascii = 7'd82;
            if (key_down[9'h01B]) ascii = 7'd83;
            if (key_down[9'h02C]) ascii = 7'd84;
            if (key_down[9'h03C]) ascii = 7'd85;
            if (key_down[9'h02A]) ascii = 7'd86;
            if (key_down[9'h01D]) ascii = 7'd87;
            if (key_down[9'h022]) ascii = 7'd88;
            if (key_down[9'h035]) ascii = 7'd89;
            if (key_down[9'h01A]) ascii = 7'd90;
        end
        else if (caps_lock && (key_down[9'h059] == 1'b1 || key_down[9'h012] == 1'b1)) begin
            if (key_down[9'h01C]) ascii = 7'd65 + 7'd32;
            if (key_down[9'h032]) ascii = 7'd66 + 7'd32;
            if (key_down[9'h021]) ascii = 7'd67 + 7'd32;
            if (key_down[9'h023]) ascii = 7'd68 + 7'd32;
            if (key_down[9'h024]) ascii = 7'd69 + 7'd32;
            if (key_down[9'h02B]) ascii = 7'd70 + 7'd32;
            if (key_down[9'h034]) ascii = 7'd71 + 7'd32;
            if (key_down[9'h033]) ascii = 7'd72 + 7'd32;
            if (key_down[9'h043]) ascii = 7'd73 + 7'd32;
            if (key_down[9'h03B]) ascii = 7'd74 + 7'd32;
            if (key_down[9'h042]) ascii = 7'd75 + 7'd32;
            if (key_down[9'h04B]) ascii = 7'd76 + 7'd32;
            if (key_down[9'h03A]) ascii = 7'd77 + 7'd32;
            if (key_down[9'h031]) ascii = 7'd78 + 7'd32;
            if (key_down[9'h044]) ascii = 7'd79 + 7'd32;
            if (key_down[9'h04D]) ascii = 7'd80 + 7'd32;
            if (key_down[9'h015]) ascii = 7'd81 + 7'd32;
            if (key_down[9'h02D]) ascii = 7'd82 + 7'd32;
            if (key_down[9'h01B]) ascii = 7'd83 + 7'd32;
            if (key_down[9'h02C]) ascii = 7'd84 + 7'd32;
            if (key_down[9'h03C]) ascii = 7'd85 + 7'd32;
            if (key_down[9'h02A]) ascii = 7'd86 + 7'd32;
            if (key_down[9'h01D]) ascii = 7'd87 + 7'd32;
            if (key_down[9'h022]) ascii = 7'd88 + 7'd32;
            if (key_down[9'h035]) ascii = 7'd89 + 7'd32;
            if (key_down[9'h01A]) ascii = 7'd90 + 7'd32;
        end
        else if (!caps_lock && (key_down[9'h059] == 1'b1 || key_down[9'h012] == 1'b1)) begin
            if (key_down[9'h01C]) ascii = 7'd65;
            if (key_down[9'h032]) ascii = 7'd66;
            if (key_down[9'h021]) ascii = 7'd67;
            if (key_down[9'h023]) ascii = 7'd68;
            if (key_down[9'h024]) ascii = 7'd69;
            if (key_down[9'h02B]) ascii = 7'd70;
            if (key_down[9'h034]) ascii = 7'd71;
            if (key_down[9'h033]) ascii = 7'd72;
            if (key_down[9'h043]) ascii = 7'd73;
            if (key_down[9'h03B]) ascii = 7'd74;
            if (key_down[9'h042]) ascii = 7'd75;
            if (key_down[9'h04B]) ascii = 7'd76;
            if (key_down[9'h03A]) ascii = 7'd77;
            if (key_down[9'h031]) ascii = 7'd78;
            if (key_down[9'h044]) ascii = 7'd79;
            if (key_down[9'h04D]) ascii = 7'd80;
            if (key_down[9'h015]) ascii = 7'd81;
            if (key_down[9'h02D]) ascii = 7'd82;
            if (key_down[9'h01B]) ascii = 7'd83;
            if (key_down[9'h02C]) ascii = 7'd84;
            if (key_down[9'h03C]) ascii = 7'd85;
            if (key_down[9'h02A]) ascii = 7'd86;
            if (key_down[9'h01D]) ascii = 7'd87;
            if (key_down[9'h022]) ascii = 7'd88;
            if (key_down[9'h035]) ascii = 7'd89;
            if (key_down[9'h01A]) ascii = 7'd90;
        end
        else begin
            if (key_down[9'h01C]) ascii = 7'd65 + 7'd32;
            if (key_down[9'h032]) ascii = 7'd66 + 7'd32;
            if (key_down[9'h021]) ascii = 7'd67 + 7'd32;
            if (key_down[9'h023]) ascii = 7'd68 + 7'd32;
            if (key_down[9'h024]) ascii = 7'd69 + 7'd32;
            if (key_down[9'h02B]) ascii = 7'd70 + 7'd32;
            if (key_down[9'h034]) ascii = 7'd71 + 7'd32;
            if (key_down[9'h033]) ascii = 7'd72 + 7'd32;
            if (key_down[9'h043]) ascii = 7'd73 + 7'd32;
            if (key_down[9'h03B]) ascii = 7'd74 + 7'd32;
            if (key_down[9'h042]) ascii = 7'd75 + 7'd32;
            if (key_down[9'h04B]) ascii = 7'd76 + 7'd32;
            if (key_down[9'h03A]) ascii = 7'd77 + 7'd32;
            if (key_down[9'h031]) ascii = 7'd78 + 7'd32;
            if (key_down[9'h044]) ascii = 7'd79 + 7'd32;
            if (key_down[9'h04D]) ascii = 7'd80 + 7'd32;
            if (key_down[9'h015]) ascii = 7'd81 + 7'd32;
            if (key_down[9'h02D]) ascii = 7'd82 + 7'd32;
            if (key_down[9'h01B]) ascii = 7'd83 + 7'd32;
            if (key_down[9'h02C]) ascii = 7'd84 + 7'd32;
            if (key_down[9'h03C]) ascii = 7'd85 + 7'd32;
            if (key_down[9'h02A]) ascii = 7'd86 + 7'd32;
            if (key_down[9'h01D]) ascii = 7'd87 + 7'd32;
            if (key_down[9'h022]) ascii = 7'd88 + 7'd32;
            if (key_down[9'h035]) ascii = 7'd89 + 7'd32;
            if (key_down[9'h01A]) ascii = 7'd90 + 7'd32;
        end
    end
    
    always @* begin
        s0 = ascii % 10;
        s1 = (ascii / 10) % 10;
        s2 = (ascii / 10) / 10;
    end
        
endmodule
