module Random(
    output reg [3:0] rand,
    input [3:0] range,
    input clk, rst_n
);
integer seed;

always@(*) begin
    seed = seed + 1;
end

always@(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        rand <= 0;
    end
    else begin
        rand <= {$random(seed)} % range;
    end
end

endmodule