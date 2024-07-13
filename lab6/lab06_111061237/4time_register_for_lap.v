module time_register_for_lap(
    input lap_ctl,
    input reset,
    input rst,
    input [3:0] s0,
    input [3:0] s1,
    input [3:0] m0,
    input [3:0] m1,
    output [3:0] saved_s0,
    output [3:0] saved_s1,
    output [3:0] saved_m0,
    output [3:0] saved_m1
);
    
reg [3:0] s0_tem, s1_tem, m0_tem, m1_tem;
reg [3:0] saved_s0, saved_s1, saved_m0, saved_m1;
    
always @* begin
    s0_tem = s0;
    s1_tem = s1;
    m0_tem = m0;
    m1_tem = m1;
end
    
always @(posedge lap_ctl or negedge reset)
    if (~reset || rst) begin
        saved_s0 <= 4'd0;
        saved_s1 <= 4'd0;
        saved_m0 <= 4'd0;
        saved_m1 <= 4'd0;
    end
    else begin 
        saved_s0 <= s0_tem;
        saved_s1 <= s1_tem;
        saved_m0 <= m0_tem;
        saved_m1 <= m1_tem;
    end
            
endmodule
