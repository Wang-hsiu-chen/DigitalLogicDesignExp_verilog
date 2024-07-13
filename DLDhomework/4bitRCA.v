module Add_half(input a, b, output c, s);
    xor G1(s, a, b);
    and G2(c, a, b);
endmodule

module Add_full(input a, b, cin, output cout, s);
    wire w0, w1, w2;
    Add_half M1(a, b, w0, w1);
    Add_half M0(w1, cin, w2, s);
    or (cout, w0, w2);
endmodule

module Add_rca_4(input[3:0] a, b, input m, output[3:0] s, output v);
    wire m1, m2, m3, m4;
    Add_full M0(a[0], ~b[0], m, m1, s[0]);
    Add_full M1(a[1], ~b[1], m1, m2, s[1]);
    Add_full M2(a[2], ~b[2], m2, m3, s[2]);
    Add_full M3(a[3], ~b[3], m3, m4, s[3]);
    assign v = (m3 & ~m4) | (~m3 & m4);
endmodule