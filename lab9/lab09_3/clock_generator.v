module clock_generator(
    clk_1Hz,  //generated 1Hz clock
    clk_10Hz,
    clk_100Hz,  //generated 100Hz clock
    clk_ssd,  //generated clock for ssd_ctl
    clk25MHz,
    clk  //clock from crystal
    );
    
    output reg clk_1Hz;  //generated 1Hz clock
    output reg clk_10Hz;
    output reg clk_100Hz;  //generated 100Hz clock
    output reg [1:0]clk_ssd;  //generated clock for ssd_ctl
    output clk25MHz;
    input clk;  //clock from crystal
    
    reg [25:0]cnt_1Hz;
    reg [25:0]cnt_1Hz_next;
    reg clk_1Hz_next;
    reg [22:0]cnt_10Hz;
    reg [22:0]cnt_10Hz_next;
    reg clk_10Hz_next;
    reg [8:0]cnt_h;
    reg [14:0]cnt_l;
    reg [18:0]cnt_100Hz;
    reg [18:0]cnt_100Hz_next;
    reg clk_100Hz_next;
    reg [21:0] num;
    wire [21:0] next_num;
    
    always@*
        if({cnt_h,clk_ssd,cnt_l} == 26'd50000000-1)
            begin
                cnt_1Hz_next = 26'd0;
                clk_1Hz_next = ~clk_1Hz;
            end
        else
            begin
                cnt_1Hz_next = {cnt_h,clk_ssd,cnt_l} + 1'b1;
                clk_1Hz_next = clk_1Hz;
            end

    always@(posedge clk)
        begin
            {cnt_h,clk_ssd,cnt_l} <= cnt_1Hz_next;
            clk_1Hz <=  clk_1Hz_next;
        end
        
    always@*
        if(cnt_100Hz == 19'd500000-1)
            begin
                cnt_100Hz_next = 19'd0;
                clk_100Hz_next = ~clk_100Hz;
            end
        else
            begin
                cnt_100Hz_next = cnt_100Hz + 1'b1;
                clk_100Hz_next = clk_100Hz;
            end
    always@*
        if(cnt_10Hz == 23'd5000000-1)
            begin
                cnt_10Hz_next = 23'd0;
                clk_10Hz_next = ~clk_10Hz;
            end
        else
            begin
                cnt_10Hz_next = cnt_10Hz + 1'b1;
                clk_10Hz_next = clk_10Hz;
            end
        
    always@(posedge clk)
        begin
            num <= next_num;
            cnt_100Hz <= cnt_100Hz_next;
            clk_100Hz <= clk_100Hz_next;
            cnt_10Hz <= cnt_10Hz_next;
            clk_10Hz <= clk_10Hz_next;
        end
    
    assign next_num = num + 1'b1;
    assign clk25MHz = num[1];
endmodule