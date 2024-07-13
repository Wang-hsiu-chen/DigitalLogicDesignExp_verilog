`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/16 16:35:18
// Design Name: 
// Module Name: one_pulse_and_long_press_detect
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


module one_pulse_and_long_press_detect(
    input in_trig,
    input rst_n,
    input clk,
    output out_pulse,
    output out_pulse_long,
    input switch_clk
    );
    
    reg [1:0] in_trig_delay;
    reg [99:0] in_trig_delay_long;
    reg out_pulse, out_pulse_long;
    wire q0, q1, q2;
    
    
    
    assign q0 = in_trig & (~in_trig_delay[0]);
    assign q1 = in_trig & in_trig_delay[0] & (~in_trig_delay[1]); 
    assign q2 = in_trig & in_trig_delay_long[98] & (~in_trig_delay_long[99]);
   
    always @(posedge clk or negedge rst_n)
        if (~rst_n)
            in_trig_delay <= 2'd0;
        else
            in_trig_delay <= {in_trig_delay[0],in_trig};   
                 
    always @(posedge clk or negedge rst_n)
        if (~rst_n)
            in_trig_delay_long <= 100'd0;
        else
            in_trig_delay_long <= {in_trig_delay_long[98:0],in_trig};
    always @(posedge clk or negedge rst_n)
        if (~rst_n)
        begin
            out_pulse <= 1'b0;
            out_pulse_long <= 1'b0;
        end
        
        else
        begin        
            out_pulse <= q0;
            if (~switch_clk)
                out_pulse_long <= q1;
            else 
                out_pulse_long <= q2; 
        end
endmodule

