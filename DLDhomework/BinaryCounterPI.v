module BCD_counter(
    output reg[3:0] A_count,
    output C_out,
    input[3:0] Data_in,
    input Count, Load, CLK, Clear_b
);
assign C_out = Count && (~Load) && (A_count == 4'b0000);
always@(posedge CLK, negedge Clear_b)
    if (~Clear_b)   A_count <= 4'b0000;
    else if (Load)  A_count <= Data_in;
    else if (Count) A_count <= A_count + 1'b1;
    else if (1)     A_count <= A_count;
endmodule
