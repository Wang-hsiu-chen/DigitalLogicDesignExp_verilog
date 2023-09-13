module ssd(SSD, d, i, ssd_ctl);
output [3:0] ssd_ctl, d;
output [7:0] SSD; 
input [3:0] i;

display U0(.SSD(SSD), .d(d), .i(i));
    assign ssd_ctl = 4'b1110;
endmodule
