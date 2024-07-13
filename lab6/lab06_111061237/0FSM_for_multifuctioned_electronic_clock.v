`define DIS_Y 0
`define DIS_MD 1
`define DIS_HM 2
`define DIS_S 3

`define SET_Y 0
`define SET_MON 1
`define SET_DAY 2
`define SET_HR 3
`define SET_MIN 4
`define SET_S 5

`define STA_CLK_DIS_HM 0
`define STA_CLK_DIS_S 1
`define STA_CLK_DIS_MD 2
`define STA_CLK_DIS_Y 3
`define STA_CLK_SET_H 4
`define STA_CLK_SET_MIN 5
`define STA_CLK_SET_S 6
`define STA_CLK_SET_Y 7
`define STA_CLK_SET_MON 8
`define STA_CLK_SET_D 9
`define STA_ALR_DIS 10
`define STA_ALR_SET 11

`define STA_STP_STOP 13
`define STA_STP_CNT 14


module FSM_for_multifuctioned_electronic_clock(
    input clk_counter,
    input reset,
    input pb_left_pu,
    input pb_center_pu,
    input pb_right_pu,
    input pb_left_pu_long,
    input pb_right_pu_long,
    input lap_cnt_ctl,
    output reg setting_mode_for_clock,
    output reg setting_mode_for_alarm,
    output reg [2:0] setting_ctl_for_clock,
    output reg [1:0] change_display_ctl_for_clock,
    output reg alarm_switch,
    output reg lap_cnt_ctl_switch,
    output reg counter_en_for_stopwatch,
    output reg reset_ctl_for_stopwatch,
    output reg clock_display,
    output reg alarm_display,
    output reg stopwatch_display
);
    
reg [3:0] state, next_state;
    
always @* begin
    setting_mode_for_clock = 1'b0;           
    setting_mode_for_alarm = 1'b0;     
    setting_ctl_for_clock = 3'd0;
    change_display_ctl_for_clock = 2'd0;
        
    alarm_switch = 1'b0;
        
    reset_ctl_for_stopwatch = 1'b0;
    lap_cnt_ctl_switch = 1'b0; 
    counter_en_for_stopwatch = 1'b0;
    clock_display = 1'b0;  
    alarm_display = 1'b0;   
    stopwatch_display = 1'b0;
    case (state)
        `STA_CLK_DIS_HM: begin
            if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                next_state = `STA_CLK_DIS_HM;
                change_display_ctl_for_clock = `DIS_HM;
                clock_display = 1'b1;
            end
            else if (pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_CLK_DIS_S;
                change_display_ctl_for_clock = `DIS_S;
                clock_display = 1'b1;
            end
            else if (!pb_left_pu && pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_CLK_SET_H;
                setting_ctl_for_clock = `SET_HR;
                setting_mode_for_clock = 1'b1;
                clock_display = 1'b1;
            end
            else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_CLK_DIS_MD;
                change_display_ctl_for_clock = `DIS_MD;
                clock_display = 1'b1;
            end
            else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && pb_right_pu_long) begin
                next_state = `STA_ALR_DIS;
                alarm_switch = 1'b0;                    
                setting_mode_for_alarm = 1'b0;
                alarm_display = 1'b1;
            end
            else begin
                next_state = `STA_CLK_DIS_HM;
                change_display_ctl_for_clock = `DIS_HM;
                clock_display = 1'b1;
            end
        end
        `STA_CLK_DIS_S: begin
            if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                next_state = `STA_CLK_DIS_S;
                change_display_ctl_for_clock = `DIS_S;
                clock_display = 1'b1;
            end
            else if (pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_CLK_DIS_HM;
                change_display_ctl_for_clock = `DIS_HM;
                clock_display = 1'b1;
            end
            else if (!pb_left_pu && pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_CLK_SET_H;
                setting_ctl_for_clock = `SET_HR;
                setting_mode_for_clock = 1'b1;
                clock_display = 1'b1;
            end
            else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_CLK_DIS_MD;
                change_display_ctl_for_clock = `DIS_MD;
                clock_display = 1'b1; 
            end
            else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && pb_right_pu_long) begin
                next_state = `STA_ALR_DIS;
                alarm_switch = 1'b0;
                setting_mode_for_alarm = 1'b0;
                alarm_display = 1'b1;
            end
            else begin
                next_state = `STA_CLK_DIS_S;
                change_display_ctl_for_clock = `DIS_S;
                clock_display = 1'b1;
            end
        end
        `STA_CLK_DIS_MD: begin
            if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                next_state = `STA_CLK_DIS_MD;
                change_display_ctl_for_clock = `DIS_MD;
                clock_display = 1'b1;
            end
            else if (pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_CLK_DIS_Y;
                change_display_ctl_for_clock = `DIS_Y;
                clock_display = 1'b1;
            end
            else if (!pb_left_pu && pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_CLK_SET_MON;
                setting_ctl_for_clock = `SET_MON;
                setting_mode_for_clock = 1'b1;
                clock_display = 1'b1;
            end
            else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_CLK_DIS_HM;
                change_display_ctl_for_clock = `DIS_HM;
                clock_display = 1'b1; 
            end
            else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && pb_right_pu_long) begin
                next_state = `STA_ALR_DIS;
                alarm_switch = 1'b0;
                setting_mode_for_alarm = 1'b0;
                alarm_display = 1'b1;
            end
                else begin
                    next_state = `STA_CLK_DIS_MD;
                    change_display_ctl_for_clock = `DIS_MD;
                    clock_display = 1'b1;
                end
            end
            `STA_CLK_DIS_Y: begin
                if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                    next_state = `STA_CLK_DIS_Y;
                    change_display_ctl_for_clock = `DIS_Y;
                    clock_display = 1'b1;
                end
                else if (pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                    next_state = `STA_CLK_DIS_MD;
                    change_display_ctl_for_clock = `DIS_MD;
                    clock_display = 1'b1;
                end
                else if (!pb_left_pu && pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                    next_state = `STA_CLK_SET_MON;
                    setting_ctl_for_clock = `SET_MON;
                    clock_display = 1'b1;
                    setting_mode_for_clock = 1'b1;
                end
                else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && pb_left_pu_long && !pb_right_pu_long) begin
                    next_state = `STA_CLK_DIS_HM;
                    change_display_ctl_for_clock = `DIS_HM; 
                    clock_display = 1'b1;
                end
                else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && pb_right_pu_long) begin
                    next_state = `STA_ALR_DIS;
                    alarm_switch = 1'b0;
                    setting_mode_for_alarm = 1'b0;
                    alarm_display = 1'b1;
                end
                else begin
                    next_state = `STA_CLK_DIS_Y;
                    change_display_ctl_for_clock = `DIS_Y;
                    clock_display = 1'b1;
                end
            end
            `STA_CLK_SET_H: begin
                if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                    setting_mode_for_clock = 1'b1;
                    next_state = `STA_CLK_SET_H;
                    setting_ctl_for_clock = `SET_HR;
                    clock_display = 1'b1;
                end
                else if (!pb_left_pu && pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                    setting_mode_for_clock = 1'b1;
                    next_state = `STA_CLK_SET_MIN;
                    setting_ctl_for_clock = `SET_MIN;
                    clock_display = 1'b1;
                end
                else begin
                    setting_mode_for_clock = 1'b1;
                    next_state = `STA_CLK_SET_H;
                    setting_ctl_for_clock = `SET_HR;
                    clock_display = 1'b1;
                end
            end
            `STA_CLK_SET_MIN: begin
                if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                    setting_mode_for_clock = 1'b1;
                    next_state = `STA_CLK_SET_MIN;
                    setting_ctl_for_clock = `SET_MIN;
                    clock_display = 1'b1;
                end
                else if (!pb_left_pu && pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                    setting_mode_for_clock = 1'b1;
                    next_state = `STA_CLK_SET_S;
                    setting_ctl_for_clock = `SET_S;
                    clock_display = 1'b1;
                end
                else begin
                    setting_mode_for_clock = 1'b1;
                    next_state = `STA_CLK_SET_MIN;
                    setting_ctl_for_clock = `SET_MIN;
                    clock_display = 1'b1;
                end
            end
        `STA_CLK_SET_S: begin
            if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                setting_mode_for_clock = 1'b1;
                next_state = `STA_CLK_SET_S;
                setting_ctl_for_clock = `SET_S;
                clock_display = 1'b1;
            end
            else if (!pb_left_pu && pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                setting_mode_for_clock = 1'b0;
                next_state = `STA_CLK_DIS_HM;
                setting_ctl_for_clock = `DIS_HM;
                clock_display = 1'b1;
            end
            else begin
                setting_mode_for_clock = 1'b1;
                next_state = `STA_CLK_SET_S;
                setting_ctl_for_clock = `SET_S;
                clock_display = 1'b1;
            end
        end
        `STA_CLK_SET_MON: begin
            if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                setting_mode_for_clock = 1'b1;
                next_state = `STA_CLK_SET_MON;
                setting_ctl_for_clock = `SET_MON;
                clock_display = 1'b1;
            end
            else if (!pb_left_pu && pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                setting_mode_for_clock = 1'b1;
                next_state = `STA_CLK_SET_D;
                setting_ctl_for_clock = `SET_DAY;
                clock_display = 1'b1;
            end
            else begin
                setting_mode_for_clock = 1'b1;
                next_state = `STA_CLK_SET_MON;
                setting_ctl_for_clock = `SET_MON;
                clock_display = 1'b1;
            end
        end
        `STA_CLK_SET_D: begin
            if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                setting_mode_for_clock = 1'b1;
                next_state = `STA_CLK_SET_D;
                setting_ctl_for_clock = `SET_DAY;
                clock_display = 1'b1;
            end
            else if (!pb_left_pu && pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                setting_mode_for_clock = 1'b1;
                next_state = `STA_CLK_SET_Y;
                setting_ctl_for_clock = `SET_Y;
                clock_display = 1'b1;
            end
            else begin
                setting_mode_for_clock = 1'b1;
                next_state = `STA_CLK_SET_D;
                setting_ctl_for_clock = `SET_DAY;
                clock_display = 1'b1;
            end
        end
        `STA_CLK_SET_Y: begin
            if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                setting_mode_for_clock = 1'b1;
                next_state = `STA_CLK_SET_Y;
                setting_ctl_for_clock = `SET_Y;
                clock_display = 1'b1;
            end
            else if (!pb_left_pu && pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                setting_mode_for_clock = 1'b0;
                next_state = `STA_CLK_DIS_MD;
                setting_ctl_for_clock = `DIS_MD;
                clock_display = 1'b1;
                
            end
            else begin
                setting_mode_for_clock = 1'b1;
                next_state = `STA_CLK_SET_Y;
                setting_ctl_for_clock = `SET_Y;
                clock_display = 1'b1;
            end
        end
        `STA_ALR_DIS: begin
            if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                next_state = `STA_ALR_DIS;
                setting_mode_for_alarm = 1'b0;
                alarm_switch = 1'b0;
                alarm_display = 1'b1;
            end
            else if (!pb_left_pu && pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                next_state = `STA_ALR_SET;
                setting_mode_for_alarm = 1'b1;
                alarm_switch = 1'b0;
                alarm_display = 1'b1;
            end
            else if (pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                next_state = `STA_ALR_DIS;
                setting_mode_for_alarm = 1'b0;
                alarm_switch = 1'b1;
                alarm_display = 1'b1;
            end
            else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && pb_right_pu_long) begin
                next_state = `STA_STP_STOP;
                counter_en_for_stopwatch = 1'b0;
                lap_cnt_ctl_switch = 1'b0;
                stopwatch_display = 1'b1;
            end
            else begin
                next_state = `STA_ALR_DIS;
                setting_mode_for_alarm = 1'b0;
                alarm_switch = 1'b0;
                alarm_display = 1'b1;
            end
        end
        `STA_ALR_SET: begin
            if (!pb_left_pu && !pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                next_state = `STA_ALR_SET;
                setting_mode_for_alarm = 1'b1;
                alarm_switch = 1'b0;
                alarm_display = 1'b1;
            end
            else if (!pb_left_pu && pb_center_pu && !pb_left_pu_long && !pb_right_pu && !pb_right_pu_long) begin
                next_state = `STA_ALR_DIS;
                setting_mode_for_alarm = 1'b0;
                alarm_switch = 1'b0;
                alarm_display = 1'b1;
            end
            else begin
                next_state = `STA_ALR_SET;
                setting_mode_for_alarm = 1'b1;
                alarm_switch = 1'b0; 
                alarm_display = 1'b1;
            end
        end
        `STA_STP_STOP: begin
            if (!pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_STP_STOP;
                counter_en_for_stopwatch = 1'b0;
                lap_cnt_ctl_switch = 1'b0;
                reset_ctl_for_stopwatch = 1'b0;
                stopwatch_display = 1'b1;
            end
            else if (!pb_left_pu && !pb_center_pu && pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_STP_CNT;
                counter_en_for_stopwatch = 1'b1;
                lap_cnt_ctl_switch = 1'b0;
                reset_ctl_for_stopwatch = 1'b0;
                stopwatch_display = 1'b1;
            end
            else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_STP_STOP;
                counter_en_for_stopwatch = 1'b0;
                lap_cnt_ctl_switch = 1'b0;
                reset_ctl_for_stopwatch = 1'b1;
                stopwatch_display = 1'b1;
            end
            else if (pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_STP_STOP;
                counter_en_for_stopwatch = 1'b0;
                lap_cnt_ctl_switch = 1'b1;
                reset_ctl_for_stopwatch = 1'b0;
                stopwatch_display = 1'b1;
            end
            else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && pb_right_pu_long) begin
                next_state = `STA_CLK_DIS_HM;
                change_display_ctl_for_clock = `DIS_HM;
                counter_en_for_stopwatch = 1'b0;
                reset_ctl_for_stopwatch = 1'b1;
                if (lap_cnt_ctl == 1'b1) lap_cnt_ctl_switch = 1'b1;
                else lap_cnt_ctl_switch = 1'b0;
                clock_display = 1'b1;
            end
            else begin
                next_state = `STA_STP_STOP;
                counter_en_for_stopwatch = 1'b0;
                lap_cnt_ctl_switch = 1'b0;
                reset_ctl_for_stopwatch = 1'b0;
                stopwatch_display = 1'b1;
            end
        end
        `STA_STP_CNT: begin
            if (!pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_STP_CNT;
                counter_en_for_stopwatch = 1'b1;
                lap_cnt_ctl_switch = 1'b0;
                reset_ctl_for_stopwatch = 1'b0;
                stopwatch_display = 1'b1;
            end
            else if (pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_STP_CNT;
                counter_en_for_stopwatch = 1'b1;
                lap_cnt_ctl_switch = 1'b1;
                reset_ctl_for_stopwatch = 1'b0;
                stopwatch_display = 1'b1;
            end
            else if (!pb_left_pu && !pb_center_pu && pb_right_pu && !pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_STP_STOP;
                counter_en_for_stopwatch = 1'b0;
                lap_cnt_ctl_switch = 1'b0;
                reset_ctl_for_stopwatch = 1'b0;
                stopwatch_display = 1'b1;
            end
            else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && pb_left_pu_long && !pb_right_pu_long) begin
                next_state = `STA_STP_STOP;
                counter_en_for_stopwatch = 1'b0;
                if (lap_cnt_ctl == 1'b1) lap_cnt_ctl_switch = 1'b1;
                else lap_cnt_ctl_switch = 1'b0;
                reset_ctl_for_stopwatch = 1'b1;
                stopwatch_display = 1'b1;
            end
            else if (!pb_left_pu && !pb_center_pu && !pb_right_pu && !pb_left_pu_long && pb_right_pu_long) begin
                next_state = `STA_CLK_DIS_HM;
                change_display_ctl_for_clock = `DIS_HM;
                counter_en_for_stopwatch = 1'b0;
                reset_ctl_for_stopwatch = 1'b1;
                if (lap_cnt_ctl == 1'b1) lap_cnt_ctl_switch = 1'b1;
                else lap_cnt_ctl_switch = 1'b0;
                clock_display = 1'b1;
            end
            else begin
                next_state = `STA_STP_CNT;
                counter_en_for_stopwatch = 1'b1;
                lap_cnt_ctl_switch = 1'b0;
                reset_ctl_for_stopwatch = 1'b0;
                stopwatch_display = 1'b1;
            end  
        end
    endcase
end
    
always @(posedge clk_counter or negedge reset)
    if (~reset)
        state <= `STA_CLK_DIS_HM;
    else
        state <= next_state;         
endmodule
