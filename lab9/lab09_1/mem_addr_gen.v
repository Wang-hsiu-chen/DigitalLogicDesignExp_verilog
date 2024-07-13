module mem_addr_gen(
  input clk,
  input rst,
  input en,
  input [9:0] h_cnt,
  input [9:0] v_cnt,
  output [16:0] pixel_addr
);
    
reg [7:0] position;
reg [7:0] position_next;

assign pixel_addr = ((h_cnt>>1)+320*(v_cnt>>1)+ position*320 )% 76800;  //640*480 --> 320*240 

always@*
  if(rst)
    position_next = 0;
  else if(position < 239 & en == 1'b1)
    position_next = position + 1;
  else if(position < 239 & en == 1'b0)
    position_next = position;
  else
    position_next = 0;
	

always@(posedge clk or posedge rst)
	if(rst)
		position <= 8'b0;
	else position <= position_next;
    
endmodule
