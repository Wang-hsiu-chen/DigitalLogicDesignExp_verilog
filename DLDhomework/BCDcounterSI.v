//method-1
/*
module BCD_counter(output [3:0]A, input C_in, CLK, Rst);
    input W1;
    assign W1 = (A[3] || 1'b0);
    TFF0 F0(A[0], CLK, C_in, Rst);
    TFF1 F1(A[1], CLK, W1, A[0], Rst);
    TFF2 F2(A[2], CLK, A[1], A[0], Rst);
    TFF3 F3(A[3], CLK, A[3], A[2], A[1], A[0], Rst);
endmodule

module TFF0(Q, CLK, T, Rst);
    output Q;
    input CLK, T, Rst;
    reg Q;
    always @(negedge CLK, posedge Rst)
    if (Rst)    Q <= 1'b0;
    else if (T)   Q <= ~Q;
    else     Q <= Q;
endmodule
module TFF1(Q, CLK, T1, T2, Rst);
    output Q;
    input CLK, T1, T2, Rst;
    reg Q;
    always @(negedge CLK, posedge Rst)
    if (Rst)    Q <= 1'b0;
    else if (~T1 & T2)   Q <= ~Q;
    else            Q <= Q;
endmodule
module TFF2(Q, CLK, T1, T2, Rst);
    output Q;
    input CLK, T1, T2, Rst;
    reg Q;
    always @(negedge CLK, posedge Rst)
    if (Rst)    Q <= 1'b0;
    else if (T1 & T2)   Q <= ~Q;
    else            Q <= Q;
endmodule
module TFF3(Q, CLK, T1, T2, T3, T4, Rst);
    output Q;
    input CLK, T1, T2, T3, T4, Rst;
    reg Q;
    always @(negedge CLK, posedge Rst)
    if (Rst)    Q <= 1'b0;
    else if ((T2 & T3 & T4)|(T1 & T4))   Q <= ~Q;
    else                            Q <= Q;
endmodule
*/
//method-2
module BCD_counter(
    output reg[3:0] A_count,
    input Count, CLK, reset
);
initial begin
    A_count = 4'b0000;
end
always @(posedge CLK, negedge reset)
    if (~reset) begin
        if ( A_count == 4'b1001)   A_count <= 4'b0000;
        else if (Count) A_count <= A_count + 1'b1;
        else if (1)     A_count <= A_count;
    end
endmodule

