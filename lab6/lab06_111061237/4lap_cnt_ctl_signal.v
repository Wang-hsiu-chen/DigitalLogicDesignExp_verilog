module lap_cnt_ctl_signal(
    input lap_cnt_ctl_switch,
    input reset,
    inout clk_counter,
    output reg lap_cnt_ctl
    );
    
    reg lap_cnt_ctl_next;
    
    always @*
        if (lap_cnt_ctl_switch)
            lap_cnt_ctl_next = ~lap_cnt_ctl;
        else 
            lap_cnt_ctl_next = lap_cnt_ctl;
    
    always @(posedge clk_counter or negedge reset)
        if (~reset)
            lap_cnt_ctl <= 1'b0;
        else
            lap_cnt_ctl <= lap_cnt_ctl_next;  
endmodule
