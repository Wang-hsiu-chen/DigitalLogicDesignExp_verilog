module debounce_circuit( 
    input clk, // clock control 
    input reset, // reset 
    input pb_in, //push button input 
    output pb_debounced // debounced push button output 
); 
    // declare the I/Os 
    reg pb_debounced; // debounced push button output 
    // 3declare the internal nodes 
    reg [3:0] debounce_window; // shift register flip flop 
    reg pb_debounced_next; // debounce result 
    
    // Shift register 
    always @(posedge clk or negedge reset) 
        if (~reset) 
            debounce_window <= 4'd0; 
        else 
            debounce_window <= {debounce_window[2:0], pb_in}; // shift register
    // debounce circuit 
    always @* 
        if (debounce_window == 4'b1111) 
            pb_debounced_next = 1'b1; 
        else 
            pb_debounced_next = 1'b0; 
    always @(posedge clk or negedge reset) 
        if (~reset) 
            pb_debounced <= 1'b0; 
        else 
            pb_debounced <= pb_debounced_next; 
endmodule
