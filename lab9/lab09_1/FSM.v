module FSM(
	state,
	in,
	clk,
	rst
    );
	
	output reg state;
	
	input in;
	input clk;
	input rst;
	
	reg next_state;
	
	always@*
		case(state)
			1'b0:  //pause
				if(in)
					next_state = 1'b1;
				else next_state = 1'b0;
			1'b1:  //count
				if(in)
					next_state = 1'b0;
				else next_state = 1'b1;
			default:
				next_state = 1'b0;
		endcase			
	
	always@(posedge clk or posedge rst)
		if(rst)
			state <= 1'b0;
		else state <= next_state;
	
endmodule
