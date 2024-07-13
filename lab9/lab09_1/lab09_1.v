module lab09_1(
    clk,
    rst,
	pb_in,
    vgaRed,
    vgaGreen,
    vgaBlue,
    hsync,
    vsync
	);

	input clk;
    input rst;
	input pb_in;
    output [3:0] vgaRed;
    output [3:0] vgaGreen;
    output [3:0] vgaBlue;
    output hsync;
    output vsync;

	wire pb_debounced;
	wire pb_one_pulse;
	wire count;
	wire [11:0] data;
	wire clk_25MHz;
	wire clk_22;
	wire [16:0] pixel_addr;
	wire [11:0] pixel;
	wire valid;
	wire [9:0] h_cnt; //640
	wire [9:0] v_cnt;  //480

	assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;

	// Frequency Divider
	clock_divisor U0(
	    .clk(clk),
	    .clk1(clk_25MHz),
	    .clk22(clk_22)
		);
		
	debounce U1(
		.clk(clk_22),  //clock control
		.pb_in(pb_in),  //push botton input
		.pb_debounced(pb_debounced)  //debounced push botton output
		);
		
	one_pulse U2(
		.out_pulse(pb_one_pulse),  //output one pulse
		.clk(clk),  //clock input
		.in_trig(pb_debounced)  //input trigger
		);
	
	FSM U3(
		.state(count),
		.in(pb_one_pulse),
		.clk(clk),
		.rst(rst)
		);
		
	// Render the picture by VGA controller
	vga_controller U4(
	    .pclk(clk_25MHz),
	    .reset(rst),
	    .hsync(hsync),
	    .vsync(vsync),
	    .valid(valid),
	    .h_cnt(h_cnt),
	    .v_cnt(v_cnt)
		);

	// Reduce frame address from 640x480 to 320x240
	mem_addr_gen U5(
	    .clk(clk_22),
	    .rst(rst),
		.en(count),
	    .h_cnt(h_cnt),
	    .v_cnt(v_cnt),
	    .pixel_addr(pixel_addr)
		);
		 
	// Use reduced 320x240 address to output the saved picture from RAM 
	blk_mem_gen_0 U6(
	    .clka(clk_25MHz),
	    .wea(0),
	    .addra(pixel_addr),
	    .dina(data[11:0]),
	    .douta(pixel)
		); 

endmodule
