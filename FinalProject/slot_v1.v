`timescale 1ns / 1ps
module slot_v1( 
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
    output [15:0] leds,
    output reg [3:0] vgaRed,
    output reg [3:0] vgaGreen,
    output reg [3:0] vgaBlue,
    output hsync,
    output vsync
);

wire rst;
wire clk_1, clk_2, clk_20, clk_100, clk_10K, clk_25M;
wire state_0, state_1, state_2, state_3;
wire [9:0] coins;
wire [1:0] clk_s;
wire [3:0] ssd_in;
wire [3:0] new_num_0, current_num_0, last_num_0; 
wire [3:0] new_num_1, current_num_1, last_num_1; 
wire [3:0] new_num_2, current_num_2, last_num_2; 
wire [3:0] new_num_3, current_num_3, last_num_3;
wire valid;
wire [9:0] h_cnt;
wire [9:0] v_cnt;
wire [13:0] pixel_addr;
wire [11:0] data;
wire [11:0] pixel_0, pixel_1, pixel_2, pixel_3;
wire [11:0] pixel_4, pixel_5, pixel_6, pixel_7;

assign rst = ~rst_n;

clock_generator U_CG(
    .clk(clk),
    .rst_n(rst_n),
    .clk_out1(clk_1),
    .clk_out2(clk_2),
    .clk_out20(clk_20),
    .clk_out100(clk_100),
    .clk_out10K(clk_10K),
    .clk_out25M(clk_25M),
    .clk_ssd(clk_s)
);
random_num_generator U_RNG0(
    .clk(clk_20),
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
    .clk(clk_20),
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
    .clk(clk_20),
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
    .clk(clk_20), 
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
    .clk_2(clk_20),
    .clk_100(clk_100),
    .clk_10K(clk_10K),
    .rst_n(rst_n),
    .volume_up_in(volume_up),
    .volume_dw_in(volume_dw), 
    .power(power),
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
    .audio_mclk(audio_mclk),
    .audio_lrck(audio_lrck),
    .audio_sck(audio_sck),
    .audio_sdin(audio_sdin),
    .coins(coins),
    .leds(leds) 
);
scan_ctl U_SC(
    .in_0((coins - (coins % 10'd1000)) / 10'd1000),
    .in_1(((coins % 10'd1000) - (coins % 10'd100)) / 10'd100),
    .in_2(((coins % 10'd100) - (coins % 10'd10)) / 10'd10),
    .in_3(coins % 10'd10),
    .clk_ssd(clk_s),
    .ssd_in(ssd_in),
    .ssd_ctl(ssd_ctl)
);
SSD_display U_SD(
    .ssd_in(ssd_in),
    .segs(segs)
);

// Render the picture by VGA controller
vga_controller U_VC(
    .pclk(clk_25M),
    .reset(rst),
    .hsync(hsync),
    .vsync(vsync),
    .valid(valid),
    .h_cnt(h_cnt),
    .v_cnt(v_cnt)
);

mem_addr_gen U_MAG(
    .h_cnt(h_cnt),
    .v_cnt(v_cnt),
    .pixel_addr(pixel_addr)
);

// pixel_gen U_PG(
//     .h_cnt(h_cnt),
//     .v_cnt(h_cnt),
//     .valid(valid),
//     .new_num_0(new_num_0), .current_num_0(current_num_0), .last_num_0(last_num_0),
//     .new_num_1(new_num_1), .current_num_1(current_num_1), .last_num_1(last_num_1),
//     .new_num_2(new_num_2), .current_num_2(current_num_2), .last_num_2(last_num_2),
//     .new_num_3(new_num_3), .current_num_3(current_num_3), .last_num_3(last_num_3),
//     .pixel_0(pixel_0), .pixel_1(pixel_1), .pixel_2(pixel_2), .pixel_3(pixel_3),
//     .pixel_4(pixel_4), .pixel_5(pixel_5), .pixel_6(pixel_6), .pixel_7(pixel_7),
//     .vgaRed(vgaRed),
//     .vgaGreen(vgaGreen),
//     .vgaBlue(vgaBlue)
// );

blk_mem_gen_0 Ub0(
    .clka(clk_25M),
    .wea(0),
    .addra(pixel_addr),
    .dina(data[11:0]),
    .douta(pixel_0)
);

blk_mem_gen_1 Ub1(
    .clka(clk_25M),
    .wea(0),
    .addra(pixel_addr),
    .dina(data[11:0]),
    .douta(pixel_1)
);

blk_mem_gen_2 Ub2(
    .clka(clk_25M),
    .wea(0),
    .addra(pixel_addr),
    .dina(data[11:0]),
    .douta(pixel_2)
);

blk_mem_gen_3 Ub3(
    .clka(clk_25M),
    .wea(0),
    .addra(pixel_addr),
    .dina(data[11:0]),
    .douta(pixel_3)
);

blk_mem_gen_4 Ub4(
    .clka(clk_25M),
    .wea(0),
    .addra(pixel_addr),
    .dina(data[11:0]),
    .douta(pixel_4)
);

blk_mem_gen_5 Ub5(
    .clka(clk_25M),
    .wea(0),
    .addra(pixel_addr),
    .dina(data[11:0]),
    .douta(pixel_5)
);

blk_mem_gen_6 Ub6(
    .clka(clk_25M),
    .wea(0),
    .addra(pixel_addr),
    .dina(data[11:0]),
    .douta(pixel_6)
);

blk_mem_gen_7 Ub7(
    .clka(clk_25M),
    .wea(0),
    .addra(pixel_addr),
    .dina(data[11:0]),
    .douta(pixel_7)
);

always@* begin
      if (!valid)
        {vgaRed, vgaGreen, vgaBlue} = 12'h0;
      else if ((h_cnt < 34) | (h_cnt > 605) | (v_cnt < 48) | (v_cnt > 431))
        {vgaRed, vgaGreen, vgaBlue} = 12'h0;
      else if ((h_cnt > 33) & (h_cnt < 162) & (v_cnt > 47) & (v_cnt < 176))
          case (last_num_0)
            4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
            4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
            4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
            4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
            4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
            4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
            4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
            4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
            default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
          endcase
      else if ((h_cnt > 33) & (h_cnt < 162) & (v_cnt > 175) & (v_cnt < 304))
        case (current_num_0)
          4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
          4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
          4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
          4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
          4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
          4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
          4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
          4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
          default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        endcase
      else if ((h_cnt > 33) & (h_cnt < 162) & (v_cnt > 303) & (v_cnt < 432))
            case (new_num_0)
              4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
              4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
              4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
              4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
              4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
              4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
              4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
              4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
              default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
            endcase
      else if ((h_cnt > 161) & (h_cnt < 182))
          {vgaRed, vgaGreen, vgaBlue} = 12'h0;
     else if ((h_cnt > 181) & (h_cnt < 310) & (v_cnt > 47) & (v_cnt < 176))
            case (last_num_1)
              4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
              4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
              4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
              4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
              4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
              4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
              4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
              4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
              default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
            endcase
      else if ((h_cnt > 181) & (h_cnt < 310) & (v_cnt > 175) & (v_cnt < 304))
        case (current_num_1)
          4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
          4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
          4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
          4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
          4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
          4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
          4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
          4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
          default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        endcase
      else if ((h_cnt > 181) & (h_cnt < 310) & (v_cnt > 303) & (v_cnt < 432))
            case (new_num_1)
              4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
              4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
              4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
              4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
              4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
              4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
              4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
              4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
              default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
            endcase
      else if ((h_cnt > 309) & (h_cnt < 330))
        {vgaRed, vgaGreen, vgaBlue} = 12'h0;
      else if ((h_cnt > 329) & (h_cnt < 458) & (v_cnt > 47) & (v_cnt < 176))
          case (last_num_2)
            4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
            4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
            4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
            4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
            4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
            4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
            4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
            4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
            default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
          endcase
      else if ((h_cnt > 329) & (h_cnt < 458) & (v_cnt > 175) & (v_cnt < 304))
        case (current_num_2)
          4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
          4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
          4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
          4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
          4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
          4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
          4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
          4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
          default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        endcase
      else if ((h_cnt > 329) & (h_cnt < 458) & (v_cnt > 303) & (v_cnt < 432))
            case (new_num_2)
              4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
              4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
              4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
              4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
              4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
              4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
              4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
              4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
              default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
            endcase
      else if ((h_cnt > 457) & (h_cnt < 478))
        {vgaRed, vgaGreen, vgaBlue} = 12'h0;
      else if ((h_cnt > 477) & (h_cnt < 606) & (v_cnt > 47) & (v_cnt < 176))
          case (last_num_3)
            4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
            4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
            4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
            4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
            4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
            4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
            4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
            4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
            default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
          endcase
      else if ((h_cnt > 477) & (h_cnt < 606) & (v_cnt > 175) & (v_cnt < 304))
        case (current_num_3)
          4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
          4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
          4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
          4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
          4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
          4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
          4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
          4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
          default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        endcase
      else if ((h_cnt > 477) & (h_cnt < 606) & (v_cnt > 303) & (v_cnt < 432))
          case (new_num_3)
            4'd0: {vgaRed, vgaGreen, vgaBlue} = pixel_0;
            4'd1: {vgaRed, vgaGreen, vgaBlue} = pixel_1;
            4'd2: {vgaRed, vgaGreen, vgaBlue} = pixel_2;
            4'd3: {vgaRed, vgaGreen, vgaBlue} = pixel_3;
            4'd4: {vgaRed, vgaGreen, vgaBlue} = pixel_4;
            4'd5: {vgaRed, vgaGreen, vgaBlue} = pixel_5;
            4'd6: {vgaRed, vgaGreen, vgaBlue} = pixel_6;
            4'd7: {vgaRed, vgaGreen, vgaBlue} = pixel_7;
            default: {vgaRed, vgaGreen, vgaBlue} = 12'h0;
          endcase
      else
        {vgaRed, vgaGreen, vgaBlue} = 12'h0;
    end

endmodule
