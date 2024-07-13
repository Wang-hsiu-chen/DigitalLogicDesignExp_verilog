module alarm_on_off_ctl(
    input alarm_switch,
    input clk_counter,
    input reset,
    output reg alarm_ctl
    );
    
     reg alarm_ctl_next;
    
    always @*
        if (alarm_switch)
            alarm_ctl_next = ~alarm_ctl;
        else 
            alarm_ctl_next = alarm_ctl;
    
    always @(posedge clk_counter or negedge reset)
        if (~reset)
            alarm_ctl <= 1'b0;
        else
            alarm_ctl <= alarm_ctl_next;  
endmodule
