module adder_2d(
	out2,
	out1,
	out0,
	in3,
	in2,
	in1,
	in0
	);
	
	output reg [3:0]out2;
	output reg [3:0]out1;
	output reg [3:0]out0;
	
	input [3:0]in3;
	input [3:0]in2;
	input [3:0]in1;
	input [3:0]in0;
	
	reg carry;
	
	always@*
		if(in2 + in0 > 4'd9)
			begin
				carry = 1'b1;
				out0 = in2 + in0 - 4'd10;
			end
		else
			begin
				carry = 1'b0;
				out0 = in2 + in0;
			end
			
	always@*
		if(in3 + in1 + carry > 4'd9)
			begin
				out2 = 4'd1;
				out1 = in3 + in1 + carry - 4'd10;
			end
		else
			begin
				out2 = 4'd0;
				out1 = in3 + in1 + carry;
			end
			
endmodule