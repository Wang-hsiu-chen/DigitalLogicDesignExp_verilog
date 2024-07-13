module top_zero_detector(
    input [3:0] s0,
    input [3:0] s1,
    input [3:0] m0,
    input [3:0] m1,
    output reg zero0,
    output reg zero1,
    output reg zero2,
    output reg zero3,
    output reg top0,
    output reg top1,
    output reg top2,
    output reg top3
    );
    
    always @* begin
        if (s0 == 4'd0 && s1 == 4'd0 && m0 == 4'd0 && m1 == 4'd0) zero3 = 1'b1;
        else zero3 = 1'b0;
        if (s0 == 4'd0 && s1 == 4'd0 && m0 == 4'd0) zero2 = 1'b1;
        else zero2 = 1'b0;
        if (s0 == 4'd0 && s1 == 4'd0) zero1 = 1'b1;
        else zero1 = 1'b0;
        if (s0 == 4'd0) zero0 = 1'b1;
        else zero0 = 1'b0;
        
        if (s0 == 4'd9 && s1 == 4'd5 && m0 == 4'd9 && m1 == 4'd5) top3 = 1'b1;
        else top3 = 1'b0;
        if (s0 == 4'd9 && s1 == 4'd5 && m0 == 4'd9) top2 = 1'b1;
        else top2 = 1'b0;
        if (s0 == 4'd9 && s1 == 4'd5) top1 = 1'b1;
        else top1 = 1'b0;
        if (s0 == 4'd9) top0 = 1'b1;
        else top0 = 1'b0;
    end
endmodule
