module volume_select(
    input clk,
    input rst_n,
    input volume_up,
    input volume_dw,
    output reg [3:0] volum_level,
    output reg [15:0] volume
);
reg [3:0] temp_volum_level;// ??„é?ˆä¿®?”¹
reg [15:0] temp_volume;

always @* begin
    if (~volume_up && volume_dw && volume < 16'h7800 && volume >= 16'h0000) begin
        temp_volume = volume + 16'h0800;
        temp_volum_level = volum_level - 1'b1;
    end
    else if (volume_up && ~volume_dw && volume <= 16'h7800 && volume > 16'h0000) begin
        temp_volume = volume - 16'h0800;
        temp_volum_level = volum_level + 1'b1;
    end
    else begin
        temp_volume = volume;
        temp_volum_level = volum_level;
    end
end

always @(posedge clk or negedge rst_n)
    if (~rst_n)
        volume <=  16'h7800;
    else
        volume <= temp_volume;
always @(posedge clk or negedge rst_n)
    if (~rst_n)
        volum_level <=  4'd0;
    else
        volum_level <= temp_volum_level;
endmodule