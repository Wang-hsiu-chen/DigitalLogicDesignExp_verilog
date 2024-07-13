`define WIDTH 32
`define STATE_WIDTH 2
`define INIT 0
`define S1 1
`define STOP 2
module devider_main(A, B, Q, R, Clk, Rst, start, done);
    input               Clk, Rst, start;
    input[`WIDTH-1:0]   A, B;
    output              done;
    output[`WIDTH-1:0]  Q, R;
    reg[`WIDTH-1:0]     Q, R;
    reg                 done;
    reg[`STATE_WIDTH-1:0]   state, next_state;
    reg[`WIDTH-1:0]         a, b, q;
    reg[`WIDTH-1:0]         next_a, next_b, next_q;

    always @(negedge Clk, posedge Rst) begin
        if (Rst) begin
            state <= `INIT;
            a <= 0;
            b <= 0;
            q <= 0;
        end
        else begin
            state <= next_state;
            a <= next_a;
            b <= next_b;
            q <= next_q;
        end
    end

    always @(Rst or state or a or b or A or B or start) begin
        if (Rst) begin
            next_state <= `INIT;
            next_a <= 0;
            next_b <= 0;
            next_q <= 0;
            R <= 0;
            Q <= 0;
            done <= 0;
        end
        else begin
            next_state <= state;
            next_a <= a;
            next_b <= b;
            next_q <= q;
            R <= 0;
            Q <= 0;
            done <= 0;

            case(state)
                `INIT:
                    if (start) begin
                        next_a <= A;
                        next_b <= B;
                        next_q <= 0;
                        next_state <= `S1;
                    end
                `S1:
                    if (a > b) begin
                        next_a <= a - b;
                        next_q <= q + 1;
                    end
                    else begin
                        done <= 1;
                        R <= a;
                        Q <= q;
                        next_state <= `STOP;
                    end
                `STOP:
                    begin
                        done <= 1;
                    end
                // default:
                //     begin
                //         done <= 1;
                //     end
            endcase
        end
    end
endmodule

        


