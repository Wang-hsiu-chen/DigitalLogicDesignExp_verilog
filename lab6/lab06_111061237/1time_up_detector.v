module time_up_detector(
    input alarm_ctl,
    input [3:0] hr1_clock,
    input [3:0] hr0_clock,
    input [3:0] min1_clock,
    input [3:0] min0_clock,
    input [3:0] hr1_alarm,
    input [3:0] hr0_alarm,
    input [3:0] min1_alarm,
    input [3:0] min0_alarm,
    output reg on_off_signal,
    output reg time_up_signal
    );
    
    always @*
        if (alarm_ctl == 1'b1) begin
            on_off_signal = 1'b1;
            if (hr1_clock == hr1_alarm && hr0_clock == hr0_alarm && min1_clock == min1_alarm && min0_clock == min0_alarm) 
                time_up_signal = 1'b1;
            else
                time_up_signal = 1'b0;
        end
        else begin
            on_off_signal = 1'b0;
            time_up_signal = 1'b0;
        end
endmodule
