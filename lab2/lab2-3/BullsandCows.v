module BullsandCAWs(sec_ten, sec_one, gue_ten, gue_one, bulls, cows);
input [3:0]sec_ten, sec_one, gue_ten, gue_one;
output reg [2:0]bulls, cows;
reg carry;

always @* begin
    bulls = 3'd0;
    cows = 3'd0;
    if (gue_ten == sec_ten)
        {carry, bulls} = bulls + 1;
    else if (gue_ten == sec_one)
        {carry, cows} = cows + 1;
    else ;
    if (gue_one == sec_one) 
        {carry, bulls} = bulls + 1;
    else if (gue_one == sec_ten)
        {carry, cows} = cows + 1;
    else ;
end
endmodule