`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/22 23:48:15
// Design Name: 
// Module Name: Volume_fsm
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


module Volume_fsm(
    input clk,
    input rst_n,
    input pb_up_pu,
    input pb_down_pu,
    output reg [3:0] volume_code,
    output reg [3:0] n1,
    output reg [3:0] n0
    );
    
    reg [3:0] state, next_state;
    
    always @* begin
        case(state)
            4'd0: begin
                if (pb_down_pu) begin
                    next_state = 4'd0;
                    volume_code = 4'd0;
                    n1 = 4'd0;
                    n0 = 4'd0;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd1;
                    volume_code = 4'd1;
                    n1 = 4'd0;
                    n0 = 4'd1;
                end
                else begin
                    next_state = 4'd0;
                    volume_code = 4'd0;
                    n1 = 4'd0;
                    n0 = 4'd0;
                end
            end
            4'd1: begin
                if (pb_down_pu) begin
                    next_state = 4'd0;
                    volume_code = 4'd0;
                    n1 = 4'd0;
                    n0 = 4'd0;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd2;
                    volume_code = 4'd2;
                    n1 = 4'd0;
                    n0 = 4'd2;
                end
                else begin
                    next_state = 4'd1;
                    volume_code = 4'd1;
                    n1 = 4'd0;
                    n0 = 4'd1;
                end
            end
            4'd2: begin
                if (pb_down_pu) begin
                    next_state = 4'd1;
                    volume_code = 4'd1;
                    n1 = 4'd0;
                    n0 = 4'd1;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd3;
                    volume_code = 4'd3;
                    n1 = 4'd0;
                    n0 = 4'd3;
                end
                else begin
                    next_state = 4'd2;
                    volume_code = 4'd2;
                    n1 = 4'd0;
                    n0 = 4'd2;
                end
            end
            4'd3: begin
                if (pb_down_pu) begin
                    next_state = 4'd2;
                    volume_code = 4'd2;
                    n1 = 4'd0;
                    n0 = 4'd2;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd4;
                    volume_code = 4'd4;
                    n1 = 4'd0;
                    n0 = 4'd4;
                end
                else begin
                    next_state = 4'd3;
                    volume_code = 4'd3;
                    n1 = 4'd0;
                    n0 = 4'd3;
                end
            end
            4'd4: begin
                if (pb_down_pu) begin
                    next_state = 4'd3;
                    volume_code = 4'd3;
                    n1 = 4'd0;
                    n0 = 4'd3;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd5;
                    volume_code = 4'd5;
                    n1 = 4'd0;
                    n0 = 4'd5;
                end
                else begin
                    next_state = 4'd4;
                    volume_code = 4'd4;
                    n1 = 4'd0;
                    n0 = 4'd4;
                end
            end
            4'd5: begin
                if (pb_down_pu) begin
                    next_state = 4'd4;
                    volume_code = 4'd4;
                    n1 = 4'd0;
                    n0 = 4'd4;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd6;
                    volume_code = 4'd6;
                    n1 = 4'd0;
                    n0 = 4'd6;
                end
                else begin
                    next_state = 4'd5;
                    volume_code = 4'd5;
                    n1 = 4'd0;
                    n0 = 4'd5;
                end
            end
            4'd6: begin
                if (pb_down_pu) begin
                    next_state = 4'd5;
                    volume_code = 4'd5;
                    n1 = 4'd0;
                    n0 = 4'd5;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd7;
                    volume_code = 4'd7;
                    n1 = 4'd0;
                    n0 = 4'd7;
                end
                else begin
                    next_state = 4'd6;
                    volume_code = 4'd6;
                    n1 = 4'd0;
                    n0 = 4'd6;
                end
            end
            4'd7: begin
                if (pb_down_pu) begin
                    next_state = 4'd6;
                    volume_code = 4'd6;
                    n1 = 4'd0;
                    n0 = 4'd6;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd8;
                    volume_code = 4'd8;
                    n1 = 4'd0;
                    n0 = 4'd8;
                end
                else begin
                    next_state = 4'd7;
                    volume_code = 4'd7;
                    n1 = 4'd0;
                    n0 = 4'd7;
                end
            end
            4'd8: begin
                if (pb_down_pu) begin
                    next_state = 4'd7;
                    volume_code = 4'd7;
                    n1 = 4'd0;
                    n0 = 4'd7;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd9;
                    volume_code = 4'd9;
                    n1 = 4'd0;
                    n0 = 4'd9;
                end
                else begin
                    next_state = 4'd8;
                    volume_code = 4'd8;
                    n1 = 4'd0;
                    n0 = 4'd8;
                end
            end
            4'd9: begin
                if (pb_down_pu) begin
                    next_state = 4'd8;
                    volume_code = 4'd8;
                    n1 = 4'd0;
                    n0 = 4'd8;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd10;
                    volume_code = 4'd10;
                    n1 = 4'd1;
                    n0 = 4'd0;
                end
                else begin
                    next_state = 4'd9;
                    volume_code = 4'd9;
                    n1 = 4'd0;
                    n0 = 4'd9;
                end
            end
            4'd10: begin
                if (pb_down_pu) begin
                    next_state = 4'd9;
                    volume_code = 4'd9;
                    n1 = 4'd0;
                    n0 = 4'd9;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd11;
                    volume_code = 4'd11;
                    n1 = 4'd1;
                    n0 = 4'd1;
                end
                else begin
                    next_state = 4'd10;
                    volume_code = 4'd10;
                    n1 = 4'd1;
                    n0 = 4'd0;
                end
            end
            4'd11: begin
                if (pb_down_pu) begin
                    next_state = 4'd10;
                    volume_code = 4'd10;
                    n1 = 4'd1;
                    n0 = 4'd0;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd12;
                    volume_code = 4'd12;
                    n1 = 4'd1;
                    n0 = 4'd2;
                end
                else begin
                    next_state = 4'd11;
                    volume_code = 4'd11;
                    n1 = 4'd1;
                    n0 = 4'd1;
                end
            end
            4'd12: begin
                if (pb_down_pu) begin
                    next_state = 4'd11;
                    volume_code = 4'd11;
                    n1 = 4'd1;
                    n0 = 4'd1;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd13;
                    volume_code = 4'd13;
                    n1 = 4'd1;
                    n0 = 4'd3;
                end
                else begin
                    next_state = 4'd12;
                    volume_code = 4'd12;
                    n1 = 4'd1;
                    n0 = 4'd2;
                end
            end
            4'd13: begin
                if (pb_down_pu) begin
                    next_state = 4'd12;
                    volume_code = 4'd12;
                    n1 = 4'd1;
                    n0 = 4'd2;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd14;
                    volume_code = 4'd14;
                    n1 = 4'd1;
                    n0 = 4'd4;
                end
                else begin
                    next_state = 4'd13;
                    volume_code = 4'd13;
                    n1 = 4'd1;
                    n0 = 4'd3;
                end
            end
            4'd14: begin
                if (pb_down_pu) begin
                    next_state = 4'd13;
                    volume_code = 4'd13;
                    n1 = 4'd1;
                    n0 = 4'd3;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd15;
                    volume_code = 4'd15;
                    n1 = 4'd1;
                    n0 = 4'd5;
                end
                else begin
                    next_state = 4'd14;
                    volume_code = 4'd14;
                    n1 = 4'd1;
                    n0 = 4'd4;
                end
            end
            4'd15: begin
                if (pb_down_pu) begin
                    next_state = 4'd14;
                    volume_code = 4'd14;
                    n1 = 4'd1;
                    n0 = 4'd4;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd15;
                    volume_code = 4'd15;
                    n1 = 4'd1;
                    n0 = 4'd5;
                end
                else begin
                    next_state = 4'd15;
                    volume_code = 4'd15;
                    n1 = 4'd1;
                    n0 = 4'd5;
                end
            end
            default: begin
                if (pb_down_pu) begin
                    next_state = 4'd0;
                    volume_code = 4'd0;
                    n1 = 4'd0;
                    n0 = 4'd0;
                end
                else if (pb_up_pu) begin
                    next_state = 4'd1;
                    volume_code = 4'd1;
                    n1 = 4'd0;
                    n0 = 4'd1;
                end
                else begin
                    next_state = 4'd0;
                    volume_code = 4'd0;
                    n1 = 4'd0;
                    n0 = 4'd0;
                end
            end
        endcase 
    end
    
    always @(posedge clk or negedge rst_n)
        if (~rst_n)
            state <= 4'd0;
        else
            state <= next_state;    
endmodule
