`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/25 19:07:02
// Design Name: 
// Module Name: Forty_sec_down_counter
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


module Forty_sec_down_counter(
    input rst_n,
    input fcrystal,
    input switch_clk,
    input reset_pt,
    input pa_st_pt,
    output [7:0] ssd_signal,
    output [3:0] ssd_ctl,
    output reg [15:0] LEDS
    );

    wire clk_debounce, clk_counter;
    wire clk_1Hz, clk_100Hz, clk_10KHz, clk_scan;
    wire reset_de, pa_st_de;
    wire reset_ctl, pa_st_ctl;
    wire cnt_en;
    wire [3:0] q0, q1;
    wire [3:0] code;
    reg zero;
    
    clock_generator CLK(.fcrystal(fcrystal), .rst_n(rst_n), .clk_1Hz(clk_1Hz), .clk_100Hz(clk_100Hz), .clk_10KHz(clk_10KHz), .clk_scan(clk_scan));
    Switch_clk SWC(.switch_clk(switch_clk), .clk_1Hz(clk_1Hz), .clk_100Hz(clk_100Hz), .clk_10KHz(clk_10KHz), .clk_counter(clk_counter), .clk_debounce(clk_debounce)); 
    
    debounce_circuit Reset(.clk(clk_debounce), .rst_n(rst_n), .pb_in(reset_pt), .pb_debounced(reset_de));
    debounce_circuit Pause(.clk(clk_debounce), .rst_n(rst_n), .pb_in(pa_st_pt), .pb_debounced(pa_st_de));
    one_pulse Reset_pu(.clk(clk_counter), .rst_n(rst_n), .in_trig(reset_de), .out_pulse(reset_ctl));
    one_pulse Pause_pu(.clk(clk_counter), .rst_n(rst_n), .in_trig(pa_st_de), .out_pulse(pa_st_ctl));
    FSM_for_counter_enable FSM(.rst_n(rst_n), .clk(clk_counter), .pa_st(pa_st_ctl), .reset(reset_ctl), .cnt_en(cnt_en));
    
    BCD_down_counter_for_digit CNTD(.rst_n(rst_n), .clk(clk_counter), .reset(reset_ctl), .zero(zero), .en(cnt_en), .q0(q0));
    BCD_down_counter_for_tens CNTT(.rst_n(rst_n), .clk(clk_counter), .reset(reset_ctl), .zero(zero), .en(cnt_en), .q0(q0), .q1(q1));     
    
    two_digits_ssd_ctl SSD_CTL(.clk_scan(clk_scan), .code(code), .ssd_ctl(ssd_ctl), .q0(q0), .q1(q1));
    BCD_to_SSD_decoder SSD_DCD(.q(code), .ssd_signal(ssd_signal));
    
    always @*
        if (q0 == 4'd0 && q1 == 4'd0) begin
            zero = 1;
            LEDS = 16'b1111_1111_1111_1111;
        end
        else begin
            zero = 0;
            LEDS = 16'b0000_0000_0000_0000;
        end
endmodule



