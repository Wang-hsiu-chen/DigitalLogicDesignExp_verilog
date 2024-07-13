module Lap_Cnt_result_selector(
    input lap_cnt_ctl,
    input [3:0] lap_s0,
    input [3:0] lap_s1,
    input [3:0] lap_m0,
    input [3:0] lap_m1,
    input [3:0] cnt_s0,
    input [3:0] cnt_s1,
    input [3:0] cnt_m0,
    input [3:0] cnt_m1,
    output [3:0] display_s0,
    output [3:0] display_s1,
    output [3:0] display_m0,
    output [3:0] display_m1
    );
    
    reg [3:0] display_s0, display_s1, display_m0, display_m1;
    
    always @* begin
        if (lap_cnt_ctl) begin 
            display_s0 = lap_s0;
            display_s1 = lap_s1;
            display_m0 = lap_m0;
            display_m1 = lap_m1;
        end
        else begin
            display_s0 = cnt_s0;
            display_s1 = cnt_s1;
            display_m0 = cnt_m0;
            display_m1 = cnt_m1;
        end
    end
endmodule
