`define IN_0 4'd0
`define IN_1 4'd1
`define IN_2 4'd2
`define IN_3 4'd3
`define IN_4 4'd4
`define IN_5 4'd5
`define IN_6 4'd6
`define IN_7 4'd7
`define IN_8 4'd8
`define ENTER 4'd9

module FSM(
    input clk,
    input rst_n,
    input pb_s,
    input pb_r,
    input [3:0] counter_num,
    output reg [3:0] id_0,
    output reg [3:0] id_1,
    output reg [3:0] id_2,
    output reg [3:0] id_3,
    output reg [3:0] id_4,
    output reg [3:0] id_5,
    output reg [3:0] id_6,
    output reg [3:0] id_7,
    output reg [3:0] id_8,
    output reg [3:0] next_state
    );
    
    reg [3:0] state;
    reg [3:0] id_0t, id_1t, id_2t, id_3t, id_4t, id_5t, id_6t, id_7t, id_8t;
    
    always @* begin
        
        case (state)
            `IN_0: begin
                if (pb_s && ~pb_r) begin
                    id_0t = counter_num;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_1;
                end
                else if (~pb_s && pb_r) begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `ENTER;
                end
                else begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_0;
                end
             end
            `IN_1: begin
                if (pb_s && ~pb_r) begin
                    id_0t = counter_num;
                    id_1t = id_0;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_2;
                end
                else if (~pb_s && pb_r) begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `ENTER;
                end
                else begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_1;
                end
             end
            `IN_2: begin
                if (pb_s && ~pb_r) begin
                    id_0t = counter_num;
                    id_1t = id_0;
                    id_2t = id_1;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_3;
                end
                else if (~pb_s && pb_r) begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `ENTER;
                end
                else begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_2;
                end
             end
            `IN_3: begin
                if (pb_s && ~pb_r) begin
                    id_0t = counter_num;
                    id_1t = id_0;
                    id_2t = id_1;
                    id_3t = id_2;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_4;
                end
                else if (~pb_s && pb_r) begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `ENTER;
                end
                else begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_3;
                end
             end
             `IN_4: begin
                if (pb_s && ~pb_r) begin
                    id_0t = counter_num;
                    id_1t = id_0;
                    id_2t = id_1;
                    id_3t = id_2;
                    id_4t = id_3;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_5;
                end
                else if (~pb_s && pb_r) begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `ENTER;
                end
                else begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_4;
                end
             end
            `IN_5: begin
                if (pb_s && ~pb_r) begin
                    id_0t = counter_num;
                    id_1t = id_0;
                    id_2t = id_1;
                    id_3t = id_2;
                    id_4t = id_3;
                    id_5t = id_4;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_6;
                end
                else if (~pb_s && pb_r) begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `ENTER;
                end
                else begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_5;
                end
             end
            `IN_6: begin
                if (pb_s && ~pb_r) begin
                    id_0t = counter_num;
                    id_1t = id_0;
                    id_2t = id_1;
                    id_3t = id_2;
                    id_4t = id_3;
                    id_5t = id_4;
                    id_6t = id_5;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_7;
                end
                else if (~pb_s && pb_r) begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `ENTER;
                end
                else begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_6;
                end
             end
            `IN_7: begin
                if (pb_s && ~pb_r) begin
                    id_0t = counter_num;
                    id_1t = id_0;
                    id_2t = id_1;
                    id_3t = id_2;
                    id_4t = id_3;
                    id_5t = id_4;
                    id_6t = id_5;
                    id_7t = id_6;
                    id_8t = id_8;
                    next_state = `IN_8;
                end
                else if (~pb_s && pb_r) begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `ENTER;
                end
                else begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_7;
                end
             end
             `IN_8: begin
                if (pb_s && ~pb_r) begin
                    id_0t = counter_num;
                    id_1t = id_0;
                    id_2t = id_1;
                    id_3t = id_2;
                    id_4t = id_3;
                    id_5t = id_4;
                    id_6t = id_5;
                    id_7t = id_6;
                    id_8t = id_7;
                    next_state = `IN_0;
                end
                else if (~pb_s && pb_r) begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `ENTER;
                end
                else begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_8;
                end
             end
            `ENTER: begin
                if (pb_s && ~pb_r) begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `ENTER;
                end 
                else if (~pb_s && pb_r) begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `IN_0;
                end
                else begin
                    id_0t = id_0;
                    id_1t = id_1;
                    id_2t = id_2;
                    id_3t = id_3;
                    id_4t = id_4;
                    id_5t = id_5;
                    id_6t = id_6;
                    id_7t = id_7;
                    id_8t = id_8;
                    next_state = `ENTER;
                end
            end
            default: begin
                    id_0t = 4'd0;
                    id_1t = 4'd0;
                    id_2t = 4'd0;
                    id_3t = 4'd0;
                    id_4t = 4'd0;
                    id_5t = 4'd0;
                    id_6t = 4'd0;
                    id_7t = 4'd0;
                    id_8t = 4'd0;
                next_state = `IN_0;
            end
        endcase  
    end
    always @(posedge clk or negedge rst_n) 
        if (~rst_n) begin
            id_0 <= 4'd0;
            id_1 <= 4'd0;
            id_2 <= 4'd0;
            id_3 <= 4'd0;
            id_4 <= 4'd0;
            id_5 <= 4'd0;
            id_6 <= 4'd0;
            id_7 <= 4'd0;
            id_8 <= 4'd0;
            state <= `IN_0;
        end
        else begin
            id_0 = id_0t;
            id_1 = id_1t;
            id_2 = id_2t;
            id_3 = id_3t;
            id_4 = id_4t;
            id_5 = id_5t;
            id_6 = id_6t;
            id_7 = id_7t;
            id_8 = id_8t;
            state <= next_state;
        end
endmodule
