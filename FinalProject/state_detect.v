`define BINGO_NUM 7
module state_detect(
    input clk_2,
    input [3:0] current_num_0,
    input [3:0] current_num_1,
    input [3:0] current_num_2,
    input [3:0] current_num_3,
    input state_0,
    input state_1,
    input state_2,
    input state_3,
    output reg music_0,
    output reg music_1,
    output reg music_2,
    output reg [15:0] leds
);

always @(*) begin
    if (state_0 || state_1 || state_2 || state_3)
        music_0 = 1'b1;
    else
        music_0 = 1'b0;
    if ((current_num_0 == `BINGO_NUM && ~state_0) || (current_num_1 == `BINGO_NUM && ~state_1) || (current_num_2 == `BINGO_NUM && ~state_2) || (current_num_3 == `BINGO_NUM && ~state_3)) begin
        music_1 = 1'b1;
        if (current_num_0 == `BINGO_NUM && ~state_0) leds[15] = 1'b1;
        else leds[15] = 1'b0;
        if (current_num_1 == `BINGO_NUM && ~state_1) leds[14] = 1'b1;
        else leds[14] = 1'b0;
        if (current_num_2 == `BINGO_NUM && ~state_2) leds[13] = 1'b1;
        else leds[13] = 1'b0;
        if (current_num_3 == `BINGO_NUM && ~state_3) leds[12] = 1'b1;
        else leds[12] = 1'b0;
        if (current_num_0 == `BINGO_NUM && ~state_0 && current_num_1 == `BINGO_NUM && ~state_1 && current_num_2 == `BINGO_NUM && ~state_2 && current_num_3 == `BINGO_NUM && ~state_3) leds[11:0] = 12'b111111111111;
        else leds[11:0] = 12'b000000000000;
    end
    else begin
        music_1 = 1'b0;
        leds = 16'b0000000000000000;
    end
    if(current_num_0 == `BINGO_NUM && ~state_0 && current_num_1 == `BINGO_NUM && ~state_1 && current_num_2 == `BINGO_NUM && ~state_2 && current_num_3 == `BINGO_NUM && ~state_3)
        music_2 = 1'b1;
    else
        music_2 = 1'b0;
end

endmodule