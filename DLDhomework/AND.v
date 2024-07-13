module AND(output reg out, input A, B);

always@(*) begin
    out = A & B;
end

endmodule