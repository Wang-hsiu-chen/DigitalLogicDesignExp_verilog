`include "global.vh"

module FSM(
	state,
    clk,
    rst_n,
    operation,
    digit3,
    digit2,
    digit1,
    digit0,
    in,
    valid
    );
    
	output reg [2:0]state;
    output reg [1:0]operation;
    output reg [3:0] digit3, digit2, digit1, digit0;
    
    input [3:0]in;
    input clk, rst_n;
    input valid;
    
    reg [2:0]next_state;
    reg [1:0]operation_next;
    reg [3:0]digit3_tmp;
    reg [3:0]digit2_tmp;
    reg [3:0]digit1_tmp;
    reg [3:0]digit0_tmp;
    
    
    always@*
        case(state)
            `STAT_DIGIT3:
                if(in == 4'd0 | in == 4'd1 | in == 4'd2 | in == 4'd3 | in == 4'd4 | 
                   in == 4'd5 | in == 4'd6 | in == 4'd7 | in == 4'd8 | in == 4'd9)
                    begin
                        digit3_tmp = in;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT2;
                        operation_next = operation;
                    end
                else if(in == `KEY_ADD)
                    begin
                        digit3_tmp = 4'd0;
                        digit2_tmp = 4'd0;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT1;
                        operation_next = 2'd0;
                    end
                else if(in == `KEY_SUBTRACT)
                    begin
                        digit3_tmp = 4'd0;
                        digit2_tmp = 4'd0;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT1;
                        operation_next = 2'd1;
                    end
                else if(in == `KEY_MULTIPLY)
                    begin
                        digit3_tmp = 4'd0;
                        digit2_tmp = 4'd0;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT1;
                        operation_next = 2'd2;
                    end
                else if(in == `KEY_CLEAR)
                    begin
                        digit3_tmp = 4'd0;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT3;
                        operation_next = operation;
                    end
                else
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT3;
                        operation_next = operation;
                    end 
            `STAT_DIGIT2:
                if(in == 4'd0 | in == 4'd1 | in == 4'd2 | in == 4'd3 | in == 4'd4 | 
                   in == 4'd5 | in == 4'd6 | in == 4'd7 | in == 4'd8 | in == 4'd9)
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = in;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_OPERATOR;
                        operation_next = operation;
                    end
                else if(in == `KEY_ADD)
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = 4'd0;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT1;
                        operation_next = 2'd0;
                    end
                else if(in == `KEY_SUBTRACT)
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = 4'd0;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT1;
                        operation_next = 2'd1;
                    end
                else if(in == `KEY_MULTIPLY)
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = 4'd0;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT1;
                        operation_next = 2'd2;
                    end
                else if(in == `KEY_CLEAR)
                    begin
                        digit3_tmp = 4'd0;
                        digit2_tmp = 4'd0;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT3;
                        operation_next = operation;
                    end
                else
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT2;
                        operation_next = operation;
                    end
            `STAT_OPERATOR:
                if(in == `KEY_ADD)
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT1;
                        operation_next = 2'd0;
                    end
                else if(in == `KEY_SUBTRACT)
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT1;
                        operation_next = 2'd1;
                    end
                else if(in == `KEY_MULTIPLY)
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT1;
                        operation_next = 2'd2;
                    end
                else if(in == `KEY_CLEAR)
                    begin
                        digit3_tmp = 4'd0;
                        digit2_tmp = 4'd0;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT3;
                        operation_next = operation;
                    end
                else
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_OPERATOR;
                        operation_next = operation;
                    end
            `STAT_DIGIT1:
                if(in == 4'd0 | in == 4'd1 | in == 4'd2 | in == 4'd3 | in == 4'd4 | 
                   in == 4'd5 | in == 4'd6 | in == 4'd7 | in == 4'd8 | in == 4'd9)
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = in;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT0;
                        operation_next = operation;
                    end
                else if(in == `KEY_CLEAR)
                    begin
                        digit3_tmp = 4'd0;
                        digit2_tmp = 4'd0;
                        digit1_tmp = 4'd0;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT3;
                        operation_next = operation;
                    end
                else
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT1;
                        operation_next = operation;
                    end
            `STAT_DIGIT0:
                if(in == 4'd0 | in == 4'd1 | in == 4'd2 | in == 4'd3 | in == 4'd4 | 
                   in == 4'd5 | in == 4'd6 | in == 4'd7 | in == 4'd8 | in == 4'd9)
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = in;
                        next_state = `STAT_DISPLAY;
                        operation_next = operation;
                    end
                else if(in == `KEY_ENTER)
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = 4'd0;
                        next_state = `STAT_DISPLAY;
                        operation_next = operation;
                    end
                else if(in == `KEY_CLEAR)
                    begin
                        digit3_tmp = 4'd0;
                        digit2_tmp = 4'd0;
                        digit1_tmp = 4'd0;
                        digit0_tmp = 4'd0;
                        next_state = `STAT_DIGIT3;
                        operation_next = operation;
                    end
                else
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DIGIT0;
                        operation_next = operation;
                    end
            `STAT_DISPLAY:
                if(in == `KEY_CLEAR)
                    begin
                        digit3_tmp = 4'd0;
                        digit2_tmp = 4'd0;
                        digit1_tmp = 4'd0;
                        digit0_tmp = 4'd0;
                        next_state = `STAT_DIGIT3;
                        operation_next = operation;
                    end
                else
                    begin
                        digit3_tmp = digit3;
                        digit2_tmp = digit2;
                        digit1_tmp = digit1;
                        digit0_tmp = digit0;
                        next_state = `STAT_DISPLAY;
                        operation_next = operation;
                    end
            default:
                begin
                    digit3_tmp = 4'd0;
                    digit2_tmp = 4'd0;
                    digit1_tmp = 4'd0;
                    digit0_tmp = 4'd0;
                    next_state = `STAT_DIGIT3;
                    operation_next = operation;
                end
        endcase
        
    always@(posedge valid) begin
            digit3 <= digit3_tmp;
			digit2 <= digit2_tmp;
			digit1 <= digit1_tmp;
			digit0 <= digit0_tmp;
            state <= next_state;
            operation <= operation_next;
        end  
    
endmodule
