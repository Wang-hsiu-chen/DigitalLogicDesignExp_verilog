module BinarytoGrayCode(input a, b, c, d, output w, x, y, z);
    assign w = a | (b & d) | (b & c);
    assign x = (b & ~c) | (~b & c & d);
    assign y = b | c;
    assign z = (~a & ~b & d) | (~a & ~b & c) | (c & d) | (a & ~d);
    
endmodule