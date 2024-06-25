`timescale 1ns / 1ps
module mem_addr_gen(
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    output reg [13:0] pixel_addr
    );
    
    always@*
      if ((h_cnt < 34) | (h_cnt > 605) | (v_cnt < 48) | (v_cnt > 431))
        pixel_addr = 0;
      else if ((h_cnt > 33) && (h_cnt < 162))
        pixel_addr = (h_cnt - 34) + (v_cnt - 176) * 128;
      else if ((h_cnt > 33) && (h_cnt < 162))
        pixel_addr = (h_cnt - 34) + (v_cnt - 176) * 128;
      else if ((h_cnt > 181) && (h_cnt < 310))
        pixel_addr = (h_cnt - 182) + (v_cnt - 176) * 128;
      else if ((h_cnt > 329) && (h_cnt < 458))
        pixel_addr = (h_cnt - 330) + (v_cnt - 176) * 128;
      else if ((h_cnt > 477) && (h_cnt < 606))
        pixel_addr = (h_cnt - 478) + (v_cnt - 176) * 128;
      else pixel_addr = 0;
      
endmodule
