`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/07 13:46:54
// Design Name: 
// Module Name: mem_addr_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mem_addr_gen(
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    output reg [14:0] pixel_addr
    );
    
    always@*
      if ((h_cnt < 113) | (h_cnt > 526) | (v_cnt < 80) | (v_cnt > 399))
        pixel_addr = 12'h0;
      else if ((h_cnt > 112) & (h_cnt < 527) & (v_cnt > 79) & (v_cnt < 144))
        pixel_addr = (h_cnt - 113) + (v_cnt - 80) * 414;
      else if ((h_cnt > 112) & (h_cnt < 177) & (v_cnt > 143) & (v_cnt < 336))
        pixel_addr = (h_cnt - 113) + (v_cnt - 144) * 64;
      else if ((h_cnt > 462) & (h_cnt < 527) & (v_cnt > 143) & (v_cnt < 336))
        pixel_addr = (h_cnt - 463) + (v_cnt - 144) * 64;
      else if ((h_cnt > 112) & (h_cnt < 527) & (v_cnt > 335) & (v_cnt < 400))
        pixel_addr = (h_cnt - 113) + (v_cnt - 336) * 414;
      else if ((h_cnt > 176) & (h_cnt < 241) & (v_cnt > 143) & (v_cnt < 208))
        pixel_addr = (h_cnt - 177) + (v_cnt - 144) * 64;
      else if ((h_cnt > 176) & (h_cnt < 241) & (v_cnt > 207) & (v_cnt < 272))
        pixel_addr = (h_cnt - 177) + (v_cnt - 208) * 64;
      else if ((h_cnt > 176) & (h_cnt < 241) & (v_cnt > 271) & (v_cnt < 336))
        pixel_addr = (h_cnt - 177) + (v_cnt - 272) * 64;
      else if ((h_cnt > 240) & (h_cnt < 251) & (v_cnt > 143) & (v_cnt < 336))
        pixel_addr = (h_cnt - 241) + (v_cnt - 144) * 10;
      else if ((h_cnt > 250) & (h_cnt < 315) & (v_cnt > 143) & (v_cnt < 208))
        pixel_addr = (h_cnt - 251) + (v_cnt - 144) * 64;
      else if ((h_cnt > 250) & (h_cnt < 315) & (v_cnt > 207) & (v_cnt < 272))
        pixel_addr = (h_cnt - 251) + (v_cnt - 208) * 64;
      else if ((h_cnt > 250) & (h_cnt < 315) & (v_cnt > 271) & (v_cnt < 336))
        pixel_addr = (h_cnt - 251) + (v_cnt - 272) * 64;
      else if ((h_cnt > 314) & (h_cnt < 325) & (v_cnt > 143) & (v_cnt < 336))
        pixel_addr = (h_cnt - 315) + (v_cnt - 144) * 10;
      else if ((h_cnt > 324) & (h_cnt < 389) & (v_cnt > 143) & (v_cnt < 208))
        pixel_addr = (h_cnt - 325) + (v_cnt - 144) * 64;
      else if ((h_cnt > 324) & (h_cnt < 389) & (v_cnt > 207) & (v_cnt < 272))
        pixel_addr = (h_cnt - 325) + (v_cnt - 208) * 64;
      else if ((h_cnt > 324) & (h_cnt < 389) & (v_cnt > 271) & (v_cnt < 336))
        pixel_addr = (h_cnt - 325) + (v_cnt - 272) * 64;
      else if ((h_cnt > 388) & (h_cnt < 399) & (v_cnt > 143) & (v_cnt < 336))
        pixel_addr = (h_cnt - 389) + (v_cnt - 144) * 10;
      else if ((h_cnt > 398) & (h_cnt < 463) & (v_cnt > 143) & (v_cnt < 208))
        pixel_addr = (h_cnt - 399) + (v_cnt - 144) * 64;
      else if ((h_cnt > 398) & (h_cnt < 463) & (v_cnt > 207) & (v_cnt < 272))
        pixel_addr = (h_cnt - 399) + (v_cnt - 208) * 64;
      else if ((h_cnt > 398) & (h_cnt < 463) & (v_cnt > 271) & (v_cnt < 336))
        pixel_addr = (h_cnt - 399) + (v_cnt - 272) * 64;
      else pixel_addr = 0;
      
endmodule
