module LFSR(
    output reg[3:0] rand, 
    input clk, rst_n
);
reg [7:0] count;
reg [7:0] temp_count;

always @(*) begin
    rand = count[3:0] % 4'd10;
    temp_count[0] = count[0] ^ count[5] ^ count[6] ^ count[7];
    temp_count[1] = count[0];
    temp_count[2] = count[1];
    temp_count[3] = count[2];
    temp_count[4] = count[3];
    temp_count[5] = count[4];
    temp_count[6] = count[5];
    temp_count[7] = count[6];
end

always @(posedge clk, negedge rst_n) begin
    if (~rst_n) begin
        count <= 8'b00000001;
    end
    else begin
        count <= temp_count;
    end
end
endmodule