module slot_v0( 
  input clk, // clock from the crystal 
  input rst_n, // active low reset 
  input slow,
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
wire [1:0] clk_s;
wire [3:0] ssd_in;
wire [3:0] new_num_0, current_num_0, last_num_0; 
wire [3:0] new_num_1, current_num_1, last_num_1; 
wire [3:0] new_num_2, current_num_2, last_num_2; 
wire [3:0] new_num_3, current_num_3, last_num_3;
wire valid;
wire [9:0] h_cnt;
wire [9:0] v_cnt;
wire [9:0] coins;
wire [14:0] pixel_addr;
wire [11:0] data;
wire [11:0] pixel_0, pixel_1, pixel_2, pixel_3;
wire [11:0] pixel_4, pixel_5, pixel_6, pixel_7;
wire [11:0] pixel_top, pixel_bottom, pixel_div;
wire [11:0] pixel_left, pixel_right_0, pixel_right_1;

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
  .clk(slow ? clk_2:clk_20),
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
  .clk(slow ? clk_2:clk_20),
  .rst_n(rst_n),
  .power(power),
  .rod(rod_1),
  .range(4'd8),
  .start_rand(8'b00000100),
  .new_num(new_num_1),
  .current_num(current_num_1),
  .last_num(last_num_1),
  .state(state_1)
);
random_num_generator U_RNG2(
  .clk(slow ? clk_2:clk_20),
  .rst_n(rst_n),
  .power(power),
  .rod(rod_2),
  .range(4'd8),
  .start_rand(8'b00000111),
  .new_num(new_num_2),
  .current_num(current_num_2),
  .last_num(last_num_2),
  .state(state_2)
);
random_num_generator U_RNG3(
  .clk(slow ? clk_2:clk_20), 
  .rst_n(rst_n),
  .power(power),
  .rod(rod_3),
  .range(4'd8),
  .start_rand(8'b00001001),
  .new_num(new_num_3),
  .current_num(current_num_3),
  .last_num(last_num_3),
  .state(state_3)
);
music_led_controller U_MLC( 
  .clk(clk),
  .clk_2(slow ? clk_2:clk_20),
  .clk_20(clk_20),
  .clk_100(clk_100),
  .clk_10K(clk_10K),
  .rst_n(rst_n),
  .volume_up_in(volume_up),
  .volume_dw_in(volume_dw), 
  .current_num_0(current_num_0),
  .current_num_1(current_num_1),
  .current_num_2(current_num_2),
  .current_num_3(current_num_3),
  .state_0(state_0),
  .state_1(state_1),
  .state_2(state_2),
  .state_3(state_3),
  .audio_mclk(audio_mclk),
  .audio_lrck(audio_lrck),
  .audio_sck(audio_sck),
  .audio_sdin(audio_sdin),
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

blk_mem_gen_top Ub8(
  .clka(clk_25M),
  .wea(0),
  .addra(pixel_addr),
  .dina(data[11:0]),
  .douta(pixel_top)
);

blk_mem_gen_left Ub9(
  .clka(clk_25M),
  .wea(0),
  .addra(pixel_addr),
  .dina(data[11:0]),
  .douta(pixel_left)
);

blk_mem_gen_bottom Ub10(
  .clka(clk_25M),
  .wea(0),
  .addra(pixel_addr),
  .dina(data[11:0]),
  .douta(pixel_bottom)
);

blk_mem_gen_right_0 Ub11(
  .clka(clk_25M),
  .wea(0),
  .addra(pixel_addr),
  .dina(data[11:0]),
  .douta(pixel_right_0)
);

blk_mem_gen_right_1 Ub12(
  .clka(clk_25M),
  .wea(0),
  .addra(pixel_addr),
  .dina(data[11:0]),
  .douta(pixel_right_1)
);

blk_mem_gen_div Ub13(
  .clka(clk_25M),
  .wea(0),
  .addra(pixel_addr),
  .dina(data[11:0]),
  .douta(pixel_div)
);

  always@* begin
    if (!valid)
      {vgaRed, vgaGreen, vgaBlue} = 12'h0;
    else if ((h_cnt < 113) | (h_cnt > 526) | (v_cnt < 80) | (v_cnt > 399))
      {vgaRed, vgaGreen, vgaBlue} = 12'h0;
    else if ((h_cnt > 112) & (h_cnt < 527) & (v_cnt > 79) & (v_cnt < 144))
      {vgaRed, vgaGreen, vgaBlue} = pixel_top;
    else if ((h_cnt > 112) & (h_cnt < 177) & (v_cnt > 143) & (v_cnt < 336))
      {vgaRed, vgaGreen, vgaBlue} = pixel_left;
    else if ((h_cnt > 462) & (h_cnt < 527) & (v_cnt > 143) & (v_cnt < 336)) begin
      if ((state_0 == 1'b0) & (state_1 == 1'b0) & (state_2 == 1'b0) & (state_3 == 1'b0))
        {vgaRed, vgaGreen, vgaBlue} = pixel_right_0;
      else
        {vgaRed, vgaGreen, vgaBlue} = pixel_right_1;
    end
    else if ((h_cnt > 112) & (h_cnt < 527) & (v_cnt > 335) & (v_cnt < 400))
      {vgaRed, vgaGreen, vgaBlue} = pixel_bottom;
    else if ((h_cnt > 176) & (h_cnt < 241) & (v_cnt > 143) & (v_cnt < 208))
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
    else if ((h_cnt > 176) & (h_cnt < 241) & (v_cnt > 207) & (v_cnt < 272))
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
    else if ((h_cnt > 176) & (h_cnt < 241) & (v_cnt > 271) & (v_cnt < 336))
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
    else if ((h_cnt > 240) & (h_cnt < 251) & (v_cnt > 143) & (v_cnt < 336))
      {vgaRed, vgaGreen, vgaBlue} = pixel_div;
    else if ((h_cnt > 250) & (h_cnt < 315) & (v_cnt > 143) & (v_cnt < 208))
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
    else if ((h_cnt > 250) & (h_cnt < 315) & (v_cnt > 207) & (v_cnt < 272))
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
    else if ((h_cnt > 250) & (h_cnt < 315) & (v_cnt > 271) & (v_cnt < 336))
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
    else if ((h_cnt > 314) & (h_cnt < 325) & (v_cnt > 143) & (v_cnt < 336))
      {vgaRed, vgaGreen, vgaBlue} = pixel_div;
    else if ((h_cnt > 324) & (h_cnt < 389) & (v_cnt > 143) & (v_cnt < 208))
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
    else if ((h_cnt > 324) & (h_cnt < 389) & (v_cnt > 207) & (v_cnt < 272))
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
    else if ((h_cnt > 324) & (h_cnt < 389) & (v_cnt > 271) & (v_cnt < 336))
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
    else if ((h_cnt > 388) & (h_cnt < 399) & (v_cnt > 143) & (v_cnt < 336))
      {vgaRed, vgaGreen, vgaBlue} = pixel_div;
    else if ((h_cnt > 398) & (h_cnt < 463) & (v_cnt > 143) & (v_cnt < 208))
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
    else if ((h_cnt > 398) & (h_cnt < 463) & (v_cnt > 207) & (v_cnt < 272))
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
    else if ((h_cnt > 398) & (h_cnt < 463) & (v_cnt > 271) & (v_cnt < 336))
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
    else
      {vgaRed, vgaGreen, vgaBlue} = 12'h0;
  end

endmodule
