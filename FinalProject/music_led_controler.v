module music_led_controller( 
    input clk, clk_2, clk_20, clk_100, clk_10K, rst_n,
    input volume_up_in, volume_dw_in,
    input power,
    input state_0, state_1, state_2, state_3,
    input [3:0] new_num_0, new_num_1, new_num_2, new_num_3,
    input [3:0] current_num_0, current_num_1, current_num_2, current_num_3,
    input [3:0] last_num_0, last_num_1, last_num_2, last_num_3,
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_sdin,
    output reg [9:0] coins,
    output [15:0] leds
);
//reg [9:0] temp_coins;
wire music_0, music_1, music_2, op_music_1;
wire volume_up_out, volume_dw_out;
wire [15:0] volume, audio_in_left, audio_in_right;
wire [21:0] tune_left, tune_right;
wire power_neg_pulse, state_0_pulse, state_1_pulse, state_2_pulse, state_3_pulse;

state_detect U_ST(
    .clk_2(clk_2),
    .rst_n(rst_n),
    .new_num_0(new_num_0),
    .new_num_1(new_num_1),
    .new_num_2(new_num_2),
    .new_num_3(new_num_3),
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
//    .power_neg_pulse(power_neg_pulse),
//    .state_0_pulse(state_0_pulse),
//    .state_1_pulse(state_1_pulse),
//    .state_2_pulse(state_2_pulse),
//    .state_3_pulse(state_3_pulse),
    .music_0(music_0),
    .music_1(music_1),
    .music_2(music_2),
//    .coins(coins),
    .leds(leds)
);
one_pulse U_OP(
   .clk(clk_20),
   .rst_n(rst_n),
   .in_trig(music_1),
   .out_pulse(op_music_1)
);
one_pulse U_OPpower(
   .clk(clk_2),
   .rst_n(rst_n),
   .in_trig(~power),
   .out_pulse(power_neg_pulse)
);
one_pulse U_OPstate0(
   .clk(clk_2),
   .rst_n(rst_n),
   .in_trig(state_0),
   .out_pulse(state_0_pulse)
);
one_pulse U_OPstate1(
   .clk(clk_2),
   .rst_n(rst_n),
   .in_trig(state_1),
   .out_pulse(state_1_pulse)
);
one_pulse U_OPstate2(
   .clk(clk_2),
   .rst_n(rst_n),
   .in_trig(state_2),
   .out_pulse(state_2_pulse)
);
one_pulse U_OPstate3(
   .clk(clk_2),
   .rst_n(rst_n),
   .in_trig(state_3),
   .out_pulse(state_3_pulse)
);
music_select U_MS(
    .clk(clk_20),
    .rst_n(rst_n),
    .music_0(music_0),
    .music_1(op_music_1),
    .music_2(music_2),
    .tune_left(tune_left),
    .tune_right(tune_right)
);
volume_top U_VTup(
    .clk_100(clk_100),
    .clk_10K(clk_10K),
    .rst_n(rst_n), //active low rst_n
    .volume_in(volume_up_in), //push button input
    .volume_out(volume_up_out)
);
volume_top U_VTdw(
    .clk_100(clk_100),
    .clk_10K(clk_10K),
    .rst_n(rst_n), //active low rst_n
    .volume_in(volume_dw_in), //push button input
    .volume_out(volume_dw_out)
);
volume_select U_VS(
    .clk(clk_100),
    .rst_n(rst_n),
    .volume_up(volume_up_out),
    .volume_dw(volume_dw_out),
    .volume(volume)
);
buzzer_control Ung(
    .clk(clk), // clock from crystal
    .rst_n(rst_n), // active low reset 
    .volume(volume),
    .note_div_left(tune_left), // div for note generation 
    .note_div_right(tune_right),
    .audio_left(audio_in_left), // left sound audio 
    .audio_right(audio_in_right) // right sound audio 
);
speaker_control Usc( 
    .fcrystal(clk), // clock from the crystal 
    .rst_n(rst_n), // active low reset 
    .audio_left(audio_in_left), // left channel audio data input 
    .audio_right(audio_in_right), // right channel audio data input 
    .audio_mclk(audio_mclk), // master clock 
    .audio_lrck(audio_lrck), // left-right clock 
    .audio_sck(audio_sck), // serial clock 
    .audio_din(audio_sdin) // serial audio data input 
);

    always@(*) begin
        if (coins > 10'd0) begin
            if (power_neg_pulse) coins = coins + leds[15] + leds[14] + leds[13] + leds[12];
            else if (state_0_pulse && state_1_pulse && state_2_pulse && state_3_pulse) coins = coins - 10'd1;
            else coins = coins;
        end
        else coins = 10'd20;
    end
    
//    always@(posedge clk_2 or negedge rst_n) begin
//        if (~rst_n) begin
//            coins <= 10'd20;
//        end
//        else begin
//            coins <= temp_coins;
//        end
//    end
endmodule