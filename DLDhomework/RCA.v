module Add_half(input A, B, output c_out, S);
    xor G1(S, A, B);
    and G2(c_out, A, B);
endmodule

module Add_full(input A, B, c_in, output c_out, S);
    wire w1, w2, w3;
    Add_half M1(A, B, w1, w2);
    Add_half M0(w2, c_in, w3, S);
    or (c_out, w1, w3);
endmodule

module Add_rca_8(input[7:0] A, B, input c_in, output c_out, E, output[7:0] S);
    wire c_in1, c_in2, c_in3, c_in4, c_in5, c_in6, c_in7;
    Add_full M0(A[0], ~B[0], c_in, c_in1, S[0]);
    Add_full M1(A[1], ~B[1], c_in1, c_in2, S[1]);
    Add_full M2(A[2], ~B[2], c_in2, c_in3, S[2]);
    Add_full M3(A[3], ~B[3], c_in3, c_in4, S[3]);
    Add_full M4(A[4], ~B[4], c_in4, c_in5, S[4]);
    Add_full M5(A[5], ~B[5], c_in5, c_in6, S[5]);
    Add_full M6(A[6], ~B[6], c_in6, c_in7, S[6]);
    Add_full M7(A[7], ~B[7], c_in7, c_out, S[7]);
    assign E = (c_in7 & ~c_out) | (~c_in7 & c_out);
endmodule