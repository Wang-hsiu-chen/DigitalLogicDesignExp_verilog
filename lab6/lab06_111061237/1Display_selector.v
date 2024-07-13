module Display_selector(
    input clock_display,
    input alarm_display,
    input stopwatch_display,
    input [3:0] ssd1_clock,
    input [3:0] ssd2_clock,
    input [3:0] ssd3_clock,
    input [3:0] ssd4_clock,
    input [3:0] hr1_alarm,
    input [3:0] hr0_alarm,
    input [3:0] min1_alarm,
    input [3:0] min0_alarm,
    input [3:0] min1_stopwatch,
    input [3:0] min0_stopwatch,
    input [3:0] sec1_stopwatch,
    input [3:0] sec0_stopwatch,
    output reg [3:0] display_s0,
    output reg [3:0] display_s1,
    output reg [3:0] display_m0,
    output reg [3:0] display_m1
    );
    
    always @* begin
        if (clock_display) begin
            display_m1 = ssd1_clock;
            display_m0 = ssd2_clock;
            display_s1 = ssd3_clock;
            display_s0 = ssd4_clock;
        end
        else if (alarm_display) begin
            display_m1 = hr1_alarm;
            display_m0 = hr0_alarm;
            display_s1 = min1_alarm;
            display_s0 = min0_alarm;   
        end
        else if (stopwatch_display) begin
            display_m1 = min1_stopwatch;
            display_m0 = min0_stopwatch;
            display_s1 = sec1_stopwatch;
            display_s0 = sec0_stopwatch;
        end
        else begin
            display_m1 = 4'd0;
            display_m0 = 4'd0;
            display_s1 = 4'd0;
            display_s0 = 4'd0;
        end
    end
endmodule
