module TFF (output Q, input T, Clk, rst);
    wire DT;
    assign DT = Q ^ T;
    DFF TF1(Q, DT, Clk, rst);
endmodule

module JKFF (output reg Q, input J, K, Clk, rst);
    wire JK;
    assign JK = (J & ~Q) | (~K & Q);
    DFF M0 (Q, JK, Clk, rst);
endmodule