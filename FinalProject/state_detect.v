`define BINGO_1 1
`define BINGO_2 2
`define BINGO_3 3
`define BINGO_4 4
`define BINGO_5 5
`define BINGO_6 6
`define BINGO_7 7
module state_detect(
    input clk_2, rst_n,
    input [3:0] new_num_0, new_num_1, new_num_2, new_num_3,
    input [3:0] current_num_0, current_num_1, current_num_2, current_num_3,
    input [3:0] last_num_0, last_num_1, last_num_2, last_num_3,
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
    if ((current_num_0 == `BINGO_7 && ~state_0) || (current_num_1 == `BINGO_7 && ~state_1) || (current_num_2 == `BINGO_7 && ~state_2) || (current_num_3 == `BINGO_7 && ~state_3)) begin
        music_1 = 1'b1;
        if (current_num_0 == `BINGO_7 && ~state_0) leds[15] = 1'b1;
        else leds[15] = 1'b0;
        if (current_num_1 == `BINGO_7 && ~state_1) leds[14] = 1'b1;
        else leds[14] = 1'b0;
        if (current_num_2 == `BINGO_7 && ~state_2) leds[13] = 1'b1;
        else leds[13] = 1'b0;
        if (current_num_3 == `BINGO_7 && ~state_3) leds[12] = 1'b1;
        else leds[12] = 1'b0;
        if (current_num_0 == `BINGO_7 && ~state_0 && current_num_1 == `BINGO_7 && ~state_1 && current_num_2 == `BINGO_7 && ~state_2 && current_num_3 == `BINGO_7 && ~state_3) leds[11:0] = 12'b111111111111;
        else leds[11:0] = 12'b000000000000;
    end
    else begin
        music_1 = 1'b0;
        leds = 16'b0000000000000000;
    end
    if(current_num_0 == `BINGO_7 && ~state_0 && current_num_1 == `BINGO_7 && ~state_1 && current_num_2 == `BINGO_7 && ~state_2 && current_num_3 == `BINGO_7 && ~state_3)
        music_2 = 1'b1;
    else
        music_2 = 1'b0;
end

endmodule