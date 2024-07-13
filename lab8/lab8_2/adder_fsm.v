`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/30 19:48:32
// Design Name: 
// Module Name: adder_fsm
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


module adder_fsm(
    input fcrystal,
    input rst_n,
    input clk_1Hz,
    input clk_100Hz,
    input [8:0] last_change,
    input [511:0] key_down,
    input key_valid,
    output reg [3:0] in1,
    output reg [3:0] in0
    );
    
    reg state, next_state;
    reg [3:0] in_tem;
    
    always @* begin
        if (key_valid && key_down) begin
            case (state)
                1'b0: begin
                    next_state = 1'b1;
                    case (last_change)
                        // up
                        9'h045: in_tem= 4'd0;  // 0
                        9'h016: in_tem= 4'd1;  // 1
                        9'h01e: in_tem= 4'd2;  // 2
                        9'h026: in_tem= 4'd3;  // 3
                        9'h025: in_tem= 4'd4;  // 4
                        9'h02e: in_tem= 4'd5;  // 5
                        9'h036: in_tem= 4'd6;  // 6
                        9'h03d: in_tem= 4'd7;  // 7
                        9'h03e: in_tem= 4'd8;  // 8
                        9'h046: in_tem= 4'd9;  // 9
                        // right
                        9'h070: in_tem= 4'd0;  // 0
                        9'h069: in_tem= 4'd1;  // 1
                        9'h072: in_tem= 4'd2;  // 2
                        9'h07a: in_tem= 4'd3;  // 3
                        9'h06b: in_tem= 4'd4;  // 4
                        9'h073: in_tem= 4'd5;  // 5
                        9'h074: in_tem= 4'd6;  // 6
                        9'h06c: in_tem= 4'd7;  // 7
                        9'h075: in_tem= 4'd8;  // 8
                        9'h07d: in_tem= 4'd9;  // 9
                        default: in_tem = 4'd15;
                    endcase     
                end
                1'b1: begin
                    next_state = 1'b0;
                    case (last_change)
                        // up
                        9'h045: in_tem= 4'd0;  // 0
                        9'h016: in_tem= 4'd1;  // 1
                        9'h01e: in_tem= 4'd2;  // 2
                        9'h026: in_tem= 4'd3;  // 3
                        9'h025: in_tem= 4'd4;  // 4
                        9'h02e: in_tem= 4'd5;  // 5
                        9'h036: in_tem= 4'd6;  // 6
                        9'h03d: in_tem= 4'd7;  // 7
                        9'h03e: in_tem= 4'd8;  // 8
                        9'h046: in_tem= 4'd9;  // 9
                        // right
                        9'h070: in_tem= 4'd0;  // 0
                        9'h069: in_tem= 4'd1;  // 1
                        9'h072: in_tem= 4'd2;  // 2
                        9'h07a: in_tem= 4'd3;  // 3
                        9'h06b: in_tem= 4'd4;  // 4
                        9'h073: in_tem= 4'd5;  // 5
                        9'h074: in_tem= 4'd6;  // 6
                        9'h06c: in_tem= 4'd7;  // 7
                        9'h075: in_tem= 4'd8;  // 8
                        9'h07d: in_tem= 4'd9;  // 9
                        default: in_tem = 4'd15;
                    endcase     
                end
                default: begin
                    next_state = 1'b1;
                    case (last_change)
                        // up
                        9'h045: in_tem= 4'd0;  // 0
                        9'h016: in_tem= 4'd1;  // 1
                        9'h01e: in_tem= 4'd2;  // 2
                        9'h026: in_tem= 4'd3;  // 3
                        9'h025: in_tem= 4'd4;  // 4
                        9'h02e: in_tem= 4'd5;  // 5
                        9'h036: in_tem= 4'd6;  // 6
                        9'h03d: in_tem= 4'd7;  // 7
                        9'h03e: in_tem= 4'd8;  // 8
                        9'h046: in_tem= 4'd9;  // 9
                        // righ
                        9'h070: in_tem= 4'd0;  // 0
                        9'h069: in_tem= 4'd1;  // 1
                        9'h072: in_tem= 4'd2;  // 2
                        9'h07a: in_tem= 4'd3;  // 3
                        9'h06b: in_tem= 4'd4;  // 4
                        9'h073: in_tem= 4'd5;  // 5
                        9'h074: in_tem= 4'd6;  // 6
                        9'h06c: in_tem= 4'd7;  // 7
                        9'h075: in_tem= 4'd8;  // 8
                        9'h07d: in_tem= 4'd9;  // 9
                        default:in_tem = 4'd15;
                    endcase     
                end
            endcase 
        end
        else begin
            next_state = state;
            in_tem = in_tem;
        end
    end
    
    always @(posedge fcrystal or negedge rst_n)
        if (~rst_n) 
            state <= 1'b0;
        else 
            state <= next_state;
    always @(posedge clk_100Hz or negedge rst_n)
        if (~rst_n) begin
            in0 <= 4'd0;
            in1 <= 4'd0;     
        end
        else begin
            if (state)
                in1 <= in_tem;
            else 
                in0 <= in_tem;
        end
    
    
endmodule
