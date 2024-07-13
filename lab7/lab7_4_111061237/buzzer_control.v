module buzzer_control( 
    input clk, // clock from crystal 
    input rst_n, // active low reset 
    input [21:0] note_div_left, // div for note generation 
    input [21:0] note_div_right, // div for note generation 
    output [15:0] audio_left, // left sound audio 
    output [15:0] audio_right // right sound audio  
); 

reg [21:0] temp_clk_cnt_left, clk_cnt_left, temp_clk_cnt_right, clk_cnt_right; 
reg b_l_clk, temp_b_l_clk, b_r_clk, temp_b_r_clk;

// Note frequency generation 
always @(posedge clk or negedge rst_n) 
    if (~rst_n) begin 
        clk_cnt_right <= 22'd0; 
        b_r_clk <= 1'b0; 
    end 
    else begin 
        clk_cnt_right <= temp_clk_cnt_right; 
        b_r_clk <= temp_b_r_clk; 
    end 
always @(posedge clk or negedge rst_n) 
    if (~rst_n) begin 
        clk_cnt_left <= 22'd0; 
        b_l_clk <= 1'b0; 
    end 
    else begin 
        clk_cnt_left <= temp_clk_cnt_left; 
        b_l_clk <= temp_b_l_clk;  
    end 
always @* 
    if (clk_cnt_left == note_div_left) begin 
        temp_clk_cnt_left = 22'd0; 
        temp_b_l_clk = ~b_l_clk; 
    end 
    else begin 
        temp_clk_cnt_left = clk_cnt_left + 1'b1; 
        temp_b_l_clk = b_l_clk; 
    end 

always @* 
    if (clk_cnt_right == note_div_right) begin 
        temp_clk_cnt_right = 22'd0; 
        temp_b_r_clk = ~b_r_clk; 
    end 
    else begin 
        temp_clk_cnt_right = clk_cnt_right + 1'b1; 
        temp_b_r_clk = b_r_clk; 
    end 
// Assign the amplitude of the note 
assign audio_left = (b_l_clk == 1'b0 || note_div_left <= 22'd40000) ? 16'hB000 : 16'h5FFF; 
assign audio_right = (b_r_clk == 1'b0 || note_div_right < 22'd40000) ? 16'hB000 : 16'h5FFF; 
endmodule
