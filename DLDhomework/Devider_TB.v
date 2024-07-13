`timescale 1ps/1ps
`define WIDTH 32
`define STATE_WIDTH 2
`define INIT 0
`define S1 1
`define STOP 2

module devider_bench;
    reg                 Clk, Rst, start;
    reg[`WIDTH-1:0]     A, B;
    wire                done;
    wire[`WIDTH-1:0]    Q, R;

    devider_main u1(A, B, Q, R, Clk, Rst, start, done);

    always #2 Clk = ~Clk;
    initial begin
        Clk = 0;
        Rst = 1;
        A = 13;
        B = 3;
        start = 1;
        #2 Rst = 0;
    end
    initial begin
        $dumpfile("dev.fsdb");
        $dumpvars;
        $monitor("%D = %D * %D + %D", A, B, Q, R);
        #(100); $finish;
    end
endmodule