`define BINGO_NUM 7
module state_detect(
    input clk_2, rst_n,
    input [3:0] new_num_0, new_num_1, new_num_2, new_num_3,
    input [3:0] current_num_0, current_num_1, current_num_2, current_num_3,
    input [3:0] last_num_0, last_num_1, last_num_2, last_num_3,
    input state_0,
    input state_1,
    input state_2,
    input state_3,
    input power_pulse,
    input power_neg_pulse,
    input state_0_pulse,
    input state_1_pulse,
    input state_2_pulse,
    input state_3_pulse,
    output reg music_0,
    output reg music_1,
    output reg music_2,
    output reg [9:0] coins,
    output reg [15:0] leds
);
reg [9:0] temp_coins;

always @(*) begin
    music_1 = 1'b0;
    //if machine is running, play music1
    if (state_0 || state_1 || state_2 || state_3)
        music_0 = 1'b1;
    else
        music_0 = 1'b0;
        // if ((current_num_0 == `BINGO_NUM && ~state_0) || (current_num_1 == `BINGO_NUM && ~state_1) || (current_num_2 == `BINGO_NUM && ~state_2) || (current_num_3 == `BINGO_NUM && ~state_3)) begin
        //     music_1 = 1'b1;
        //     if (current_num_0 == `BINGO_NUM && ~state_0) leds[15] = 1'b1;
        //     // else leds[15] = 1'b0;
        //     if (current_num_1 == `BINGO_NUM && ~state_1) leds[14] = 1'b1;
        //     // else leds[14] = 1'b0;
        //     if (current_num_2 == `BINGO_NUM && ~state_2) leds[13] = 1'b1;
        //     // else leds[13] = 1'b0;
        //     if (current_num_3 == `BINGO_NUM && ~state_3) leds[12] = 1'b1;
        //     // else leds[12] = 1'b0;
        //     if (current_num_0 == `BINGO_NUM && ~state_0 && current_num_1 == `BINGO_NUM && ~state_1 && current_num_2 == `BINGO_NUM && ~state_2 && current_num_3 == `BINGO_NUM && ~state_3) leds[11:0] = 12'b111111111111;
        //     // else leds[11:0] = 12'b000000000000;
        // end

    //detect each kind of situation, if bingo then add coins, the number of coins are different according to the bingo number
        // if (new_num_0 == current_num_1 == last_num_2/* && ~state_0 && ~state_1 && ~state_2 && ~state_3 */&& power_neg_pulse)begin
        //     if (new_num_0 == 4'd0 || new_num_0 == 4'd1 || new_num_0 == 4'd2 || new_num_0 == 4'd3 || new_num_0 == 4'd4) begin
        //         temp_coins = coins + 10'd10;
        //     end
        //     else if (new_num_0 == 4'd5 || new_num_0 == 4'd9) begin
        //         temp_coins = coins + 10'd20;
        //     end
        //     else if (new_num_0 == 4'd6 || new_num_0 == 4'd8) begin
        //         temp_coins = coins + 10'd30;
        //     end
        //     else begin
        //         temp_coins = coins + 10'd40;
        //     end
        // end
        // else begin
        //     temp_coins = coins;
        // end
        // if (new_num_1 == current_num_2 == last_num_3 /*&& ~state_1 && ~state_2 && ~state_3*/ && power_neg_pulse)begin
        //     if (new_num_1 == 4'd0 || new_num_1 == 4'd1 || new_num_1 == 4'd2 || new_num_1 == 4'd3 || new_num_1 == 4'd4) begin
        //         temp_coins = coins + 10'd10;
        //     end
        //     else if (new_num_1 == 4'd5 || new_num_1 == 4'd9) begin
        //         temp_coins = coins + 10'd20;
        //     end
        //     else if (new_num_1 == 4'd6 || new_num_1 == 4'd8) begin
        //         temp_coins = coins + 10'd30;
        //     end
        //     else begin
        //         temp_coins = coins + 10'd40;
        //     end
        // end
        // else begin
        //     temp_coins = coins;
        // end
        // if (new_num_3 == current_num_2 == last_num_1 /*&& ~state_1 && ~state_2 && ~state_3*/ && power_neg_pulse)begin
        //     if (new_num_3 == 4'd0 || new_num_3 == 4'd1 || new_num_3 == 4'd2 || new_num_3 == 4'd3 || new_num_3 == 4'd4) begin
        //         temp_coins = coins + 10'd10;
        //     end
        //     else if (new_num_3 == 4'd5 || new_num_3 == 4'd9) begin
        //         temp_coins = coins + 10'd20;
        //     end
        //     else if (new_num_3 == 4'd6 || new_num_3 == 4'd8) begin
        //         temp_coins = coins + 10'd30;
        //     end
        //     else begin
        //         temp_coins = coins + 10'd40;
        //     end
        // end
        // else begin
        //     temp_coins = coins;
        // end
        // if (new_num_2 == current_num_1 == last_num_0 /*&& ~state_1 && ~state_2 && ~state_3*/ && power_neg_pulse)begin
        //     if (new_num_2 == 4'd0 || new_num_2 == 4'd1 || new_num_2 == 4'd2 || new_num_2 == 4'd3 || new_num_2 == 4'd4) begin
        //         temp_coins = coins + 10'd10;
        //     end
        //     else if (new_num_2 == 4'd5 || new_num_2 == 4'd9) begin
        //         temp_coins = coins + 10'd20;
        //     end
        //     else if (new_num_2 == 4'd6 || new_num_2 == 4'd8) begin
        //         temp_coins = coins + 10'd30;
        //     end
        //     else begin
        //         temp_coins = coins + 10'd40;
        //     end
        // end
        // else begin
        //     temp_coins = coins;
        // end
        // if (((new_num_0 == new_num_1 == new_num_2 == new_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //     ~(current_num_0 == current_num_1 == current_num_2 == current_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //     ~(last_num_0 == last_num_1 == last_num_2 == last_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse)) ||
        //     (~(new_num_0 == new_num_1 == new_num_2 == new_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //     (current_num_0 == current_num_1 == current_num_2 == current_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //     ~(last_num_0 == last_num_1 == last_num_2 == last_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse)) ||
        //     (~(new_num_0 == new_num_1 == new_num_2 == new_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //     ~(current_num_0 == current_num_1 == current_num_2 == current_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //     (last_num_0 == last_num_1 == last_num_2 == last_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse)) ) begin
        //     temp_coins = coins + 10'd10;
        // end
        // else if (((new_num_0 == new_num_1 == new_num_2 == new_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //         (current_num_0 == current_num_1 == current_num_2 == current_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //         ~(last_num_0 == last_num_1 == last_num_2 == last_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse)) ||
        //         ((new_num_0 == new_num_1 == new_num_2 == new_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //         ~(current_num_0 == current_num_1 == current_num_2 == current_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //         (last_num_0 == last_num_1 == last_num_2 == last_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse)) ||
        //         (~(new_num_0 == new_num_1 == new_num_2 == new_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //         (current_num_0 == current_num_1 == current_num_2 == current_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //         (last_num_0 == last_num_1 == last_num_2 == last_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse)) ) begin
        //         temp_coins = coins + 10'd20;
        // end
        // else if ((new_num_0 == new_num_1 == new_num_2 == new_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //     (current_num_0 == current_num_1 == current_num_2 == current_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) &&
        //     (last_num_0 == last_num_1 == last_num_2 == last_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse)) begin
        //     temp_coins = coins + 10'd30;
        // end
        // else begin
        //     temp_coins = coins;
        // end
        // if (current_num_0 == current_num_1 == current_num_2 == current_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) begin
        //     if (current_num_0 == 4'd0 || current_num_0 == 4'd1 || current_num_0 == 4'd2 || current_num_0 == 4'd3 || current_num_0 == 4'd4) begin
        //         temp_coins = coins + 10'd10;
        //     end
        //     else if (current_num_0 == 4'd5 || current_num_0 == 4'd9) begin
        //         temp_coins = coins + 10'd20;
        //     end
        //     else if (current_num_0 == 4'd6 || current_num_0 == 4'd8) begin
        //         temp_coins = coins + 10'd30;
        //     end
        //     else begin
        //         temp_coins = coins + 10'd40;
        //     end
        // end
        // else begin
        //     temp_coins = coins;
        // end
        // if (last_num_0 == last_num_1 == last_num_2 == last_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3 && power_neg_pulse) begin
        //     if (last_num_0 == 4'd0 || last_num_0 == 4'd1 || last_num_0 == 4'd2 || last_num_0 == 4'd3 || last_num_0 == 4'd4) begin
        //         temp_coins = coins + 10'd10;
        //     end
        //     else if (last_num_0 == 4'd5 || last_num_0 == 4'd9) begin
        //         temp_coins = coins + 10'd20;
        //     end
        //     else if (last_num_0 == 4'd6 || last_num_0 == 4'd8) begin
        //         temp_coins = coins + 10'd30;
        //     end
        //     else begin
        //         temp_coins = coins + 10'd40;
        //     end
        // end
        // else begin
        //     temp_coins = coins;
        // end
    //if any kind of situation happened, lighted all led, play music2
    if (/*(new_num_0 == current_num_1 == last_num_2 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_1 == current_num_2 == last_num_3 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_3 == current_num_2 == last_num_1 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||*/
        (new_num_2 == current_num_1 == last_num_0 == 4'd7 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_2 == current_num_1 == last_num_0 == 4'd6 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_2 == current_num_1 == last_num_0 == 4'd5 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_2 == current_num_1 == last_num_0 == 4'd4 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_2 == current_num_1 == last_num_0 == 4'd3 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_2 == current_num_1 == last_num_0 == 4'd2 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_2 == current_num_1 == last_num_0 == 4'd1 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_0 == new_num_1 == new_num_2 == new_num_3 == 4'd7 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_0 == new_num_1 == new_num_2 == new_num_3 == 4'd6 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_0 == new_num_1 == new_num_2 == new_num_3 == 4'd5 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_0 == new_num_1 == new_num_2 == new_num_3 == 4'd4 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_0 == new_num_1 == new_num_2 == new_num_3 == 4'd3 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_0 == new_num_1 == new_num_2 == new_num_3 == 4'd2 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (new_num_0 == new_num_1 == new_num_2 == new_num_3 == 4'd1 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (current_num_0 == current_num_1 == current_num_2 == current_num_3 == 4'd7 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (current_num_0 == current_num_1 == current_num_2 == current_num_3 == 4'd6 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (current_num_0 == current_num_1 == current_num_2 == current_num_3 == 4'd5 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (current_num_0 == current_num_1 == current_num_2 == current_num_3 == 4'd4 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (current_num_0 == current_num_1 == current_num_2 == current_num_3 == 4'd3 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (current_num_0 == current_num_1 == current_num_2 == current_num_3 == 4'd2 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (current_num_0 == current_num_1 == current_num_2 == current_num_3 == 4'd1 && ~state_0 && ~state_1 && ~state_2 && ~state_3) ||
        (last_num_0 == last_num_1 == last_num_2 == last_num_3 == 4'd7 && ~state_0  && ~state_1 && ~state_2 && ~state_3) ||
        (last_num_0 == last_num_1 == last_num_2 == last_num_3 == 4'd6 && ~state_0  && ~state_1 && ~state_2 && ~state_3) ||
        (last_num_0 == last_num_1 == last_num_2 == last_num_3 == 4'd5 && ~state_0  && ~state_1 && ~state_2 && ~state_3) ||
        (last_num_0 == last_num_1 == last_num_2 == last_num_3 == 4'd4 && ~state_0  && ~state_1 && ~state_2 && ~state_3) ||
        (last_num_0 == last_num_1 == last_num_2 == last_num_3 == 4'd3 && ~state_0  && ~state_1 && ~state_2 && ~state_3) ||
        (last_num_0 == last_num_1 == last_num_2 == last_num_3 == 4'd2 && ~state_0  && ~state_1 && ~state_2 && ~state_3) ||
        (last_num_0 == last_num_1 == last_num_2 == last_num_3 == 4'd1 && ~state_0  && ~state_1 && ~state_2 && ~state_3)) begin
        music_2 = 1'b1;
        leds = 16'b1111111111111111;
        if (power_neg_pulse) temp_coins = coins + 10'd30;
    end
    else begin
        music_2 = 1'b0;
        leds = 16'b0000000000000000;
        temp_coins = coins - 10'd5;
    end
        // else begin
        //     // music_1 = 1'b0;
        //     leds = 16'b0000000000000000;
        // end
        // if(current_num_0 == `BINGO_NUM && ~state_0 && current_num_1 == `BINGO_NUM && ~state_1 && current_num_2 == `BINGO_NUM && ~state_2 && current_num_3 == `BINGO_NUM && ~state_3)
        //     music_2 = 1'b1;
        // else
        //     music_2 = 1'b0;
    
    if ((state_0_pulse && ~state_1_pulse && ~state_2_pulse && ~state_3_pulse) ||
        (~state_0_pulse && state_1_pulse && ~state_2_pulse && ~state_3_pulse) ||
        (~state_0_pulse && ~state_1_pulse && state_2_pulse && ~state_3_pulse) ||
        (~state_0_pulse && ~state_1_pulse && ~state_2_pulse && state_3_pulse)) temp_coins = coins - 10'd2;
    // else temp_coins = coins;
    else if ((state_0_pulse && state_1_pulse && ~state_2_pulse && ~state_3_pulse) ||
            (state_0_pulse && ~state_1_pulse && state_2_pulse && ~state_3_pulse) ||
            (state_0_pulse && ~state_1_pulse && ~state_2_pulse && state_3_pulse) ||
            (~state_0_pulse && state_1_pulse && state_2_pulse && ~state_3_pulse) ||
            (~state_0_pulse && state_1_pulse && ~state_2_pulse && state_3_pulse) ||
            (~state_0_pulse && ~state_1_pulse && state_2_pulse && state_3_pulse)) temp_coins = coins - 10'd4;
    // else temp_coins = coins;
    else if ((state_0_pulse && state_1_pulse && state_2_pulse && ~state_3_pulse) ||
            (state_0_pulse && state_1_pulse && ~state_2_pulse && state_3_pulse) ||
            (state_0_pulse && ~state_1_pulse && state_2_pulse && state_3_pulse) ||
            (~state_0_pulse && state_1_pulse && state_2_pulse && state_3_pulse)) temp_coins = coins - 10'd6;
    // else temp_coins = coins;
    else if ((state_0_pulse && state_1_pulse && state_2_pulse && state_3_pulse) || power_pulse) temp_coins = coins - 10'd8;
    else temp_coins = coins;
    
    if (temp_coins <= 10'd0) begin
        temp_coins = 10'd100;
    end
    else begin
        temp_coins = coins;
    end
end

always@(posedge clk_2 or negedge rst_n) begin
    if (~rst_n) begin
        coins <= 10'd100;
    end
    else begin
        coins <= temp_coins;
    end
end

endmodule