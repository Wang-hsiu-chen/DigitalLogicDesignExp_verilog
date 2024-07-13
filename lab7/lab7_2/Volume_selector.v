`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/23 00:37:57
// Design Name: 
// Module Name: Volume_selector
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


module Volume_selector(
    input [3:0] volume_code,
    output reg [15:0] volume_min,
    output reg [15:0] volume_max
    );
    
    always @* begin 
        case (volume_code)
            4'd0: begin
                volume_max = 16'h0000;
                volume_min = 16'h0000;
            end
            4'd1: begin
                volume_max = 16'h07FF;
                volume_min = 16'hF800;
            end
            4'd2: begin
                volume_max = 16'h0FFF;
                volume_min = 16'hF000;
            end
            4'd3: begin
                volume_max = 16'h17FF;
                volume_min = 16'hE800;
            end
            4'd4: begin
                volume_max = 16'h1FFF;
                volume_min = 16'hE000;
            end
            4'd5: begin
                volume_max = 16'h27FF;
                volume_min = 16'hD800;
            end
            4'd6: begin
                volume_max = 16'h2FFF;
                volume_min = 16'hD000;
            end
            4'd7: begin
                volume_max = 16'h37FF;
                volume_min = 16'hC800;
            end
            4'd8: begin
                volume_max = 16'h3FFF;
                volume_min = 16'hC000;
            end
            4'd9: begin
                volume_max = 16'h47FF;
                volume_min = 16'hB800;
            end
            4'd10: begin
                volume_max = 16'h4FFF;
                volume_min = 16'hB000;
            end
            4'd11: begin
                volume_max = 16'h57FF;
                volume_min = 16'hA800;
            end
            4'd12: begin
                volume_max = 16'h5FFF;
                volume_min = 16'hA000;
            end
            4'd13: begin
                volume_max = 16'h67FF;
                volume_min = 16'h9800;
            end
            4'd14: begin
                volume_max = 16'h6FFF;
                volume_min = 16'h9000;
            end
            4'd15: begin
                volume_max = 16'h77FF;
                volume_min = 16'h8800;
            end
            default: begin
                volume_max = 16'h0;
                volume_min = 16'h0;
            end
        endcase
    end
endmodule
