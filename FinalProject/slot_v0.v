module slot_v0( 
    input clk, // clock from the crystal 
    input rst_n, // active low reset 
    input power,
    input rod_0,
    input rod_1,
    input rod_2,
    input rod_3,
    input volume_up,
    input volume_dw,
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_sdin,
    output [3:0] ssd_ctl,
    output [7:0] segs,
    output [15:0] leds
);
wire clk_1, clk_2, clk_100, clk_10K;
wire state_0, state_1, state_2, state_3;
wire [1:0] clk_s;
wire [3:0] ssd_in;
wire [3:0] new_num_0, current_num_0, last_num_0, new_num_1, current_num_1, last_num_1, new_num_2, current_num_2, last_num_2, new_num_3, current_num_3, last_num_3;
wire [9:0] coins;

clock_generator U_CG(
    .clk(clk),
    .rst_n(rst_n), 
    .clk_out1(clk_1), 
    .clk_out2(clk_2),
    .clk_out100(clk_100),
    .clk_out10K(clk_10K),
    .clk_ssd(clk_s)
);
random_num_generator U_RNG0(
    .clk(clk_2),
    .rst_n(rst_n),
    .power(power),
    .rod(rod_0),
    .range(4'd8),
    .start_rand(8'b00000001),
    .new_num(new_num_0),
    .current_num(current_num_0),
    .last_num(last_num_0),
    .state(state_0)
);
random_num_generator U_RNG1(
    .clk(clk_2),
    .rst_n(rst_n),
    .power(power),
    .rod(rod_1),
    .range(4'd8),
    .start_rand(8'b00000010),
    .new_num(new_num_1),
    .current_num(current_num_1),
    .last_num(last_num_1),
    .state(state_1)
);
random_num_generator U_RNG2(
    .clk(clk_2),
    .rst_n(rst_n),
    .power(power),
    .rod(rod_2),
    .range(4'd8),
    .start_rand(8'b00000011),
    .new_num(new_num_2),
    .current_num(current_num_2),
    .last_num(last_num_2),
    .state(state_2)
);
random_num_generator U_RNG3(
    .clk(clk_2), 
    .rst_n(rst_n),
    .power(power),
    .rod(rod_3),
    .range(4'd8),
    .start_rand(8'b00000100),
    .new_num(new_num_3),
    .current_num(current_num_3),
    .last_num(last_num_3),
    .state(state_3)
);
music_led_controller U_MLC( 
    .clk(clk),
    .clk_2(clk_2),
    .clk_100(clk_100),
    .clk_10K(clk_10K),
    .rst_n(rst_n),
    .volume_up_in(volume_up),
    .volume_dw_in(volume_dw), 
    .new_num_0(new_num_0),
    .new_num_1(new_num_1),
    .new_num_2(new_num_2),
    .new_num_3(new_num_3),
    .power(power),
    .current_num_0(current_num_0),
    .current_num_1(current_num_1),
    .current_num_2(current_num_2),
    .current_num_3(current_num_3),
    .last_num_0(last_num_0),
    .last_num_1(last_num_1),
    .last_num_2(last_num_2),
    .last_num_3(last_num_3),
    .state_0(state_0),
    .state_1(state_1),
    .state_2(state_2),
    .state_3(state_3),
    .audio_mclk(audio_mclk),
    .audio_lrck(audio_lrck),
    .audio_sck(audio_sck),
    .audio_sdin(audio_sdin),
    .coins(coins),
    .leds(leds) 
);
scanctl U_SC(
    .in_0(current_num_0),
    .in_1(current_num_1),
    .in_2(current_num_2),
    .in_3(current_num_3),
    .clk_ssd(clk_s),
    .ssd_in(ssd_in),
    .ssd_ctl(ssd_ctl)
);
SSDdisplay U_SD(
    .ssd_in(ssd_in),
    .segs(segs)
);
endmodule