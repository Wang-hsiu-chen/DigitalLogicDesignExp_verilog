module random_num_generator(
    input clk, rst_n,
    input power, rod,
    input [3:0] range,
    input [7:0] start_rand,
    // input [7:0] lfsr,
    output reg state,
    output reg [3:0] new_num, current_num, last_num
);
reg [3:0] temp_new_num, temp_current_num, temp_last_num;
wire [7:0] rand;

always@(*) begin
    state = (power & ~rod);

    if (state) begin
        temp_last_num <= current_num;
        temp_current_num <= new_num;
        temp_new_num <= rand % range;
    end
    else begin
        temp_last_num = last_num;
        temp_current_num = current_num;
        temp_new_num = new_num;
    end
end

always@(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        last_num <= 0;
        current_num <= 0;
        new_num <= 0;
    end
    else begin
        last_num <= temp_last_num;
        current_num <= temp_current_num;
        new_num <= temp_new_num;
    end
end

LFSR U_L(
    .clk(clk),
    .rst_n(rst_n),
    .start_rand(start_rand),
    .rand(rand)
);
endmodule