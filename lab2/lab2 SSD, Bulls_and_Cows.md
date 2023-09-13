# lab2 SSD, Bulls_and_Cows
## Exp
1. **For exp1 in lab1 (a signed binary-to-Gray-code converter), finish the FPGA emulation with the following parameters.**

    |I/O |a |b |c |d |w |x |y |z|
    |----|----|----|----|----|----|----|----|----|
    |LOC |W17 |W16 |V16 |V17 |V19 |U19 |E19 |U16|
2. **Derive a 4-bit binary *(i[3:0], i[3] as MSB)* to 7-segment display decoder *(SSD[7:0])*, and also use four LEDs *(d[3:0])* to monitor the 4-bit binary number.**
    1. Derive the Boolean function/logic equation and draw the logic diagram.
    2. Construct the Verilog RTL code for the converter and use a testbench to simulate the logic behavior for verification.
    3. Finish the FPGA emulation with the following parameters.

        |I/O |i[3] |i[2] |i[1] |i[0] |d[3] |d[2] |d[1] |d[0]|
        |----|----|----|----|----|----|----|----|----|
        |LOC |W17 |W16 |V16 |V17 |V19 |U19 |E19 |U16|
3. **<font color = red>(Bonus)</font> In the Bulls and Cows game, each of the two players writes a two-digit secret number in BCD. The digits must be all different. Then, in turns, the players try to guess their opponent’s number and give the number of matches. If the matching digits are in their right positions, they are bulls, and if in different positions, they are cows. In this problem, we want to build the matching process to show the number of bulls and cows.**
    1. Use 16 DIP switches as the BCD inputs, in which 8 DIP switches are for the two-digit 
    BCD secret number and the other 8 DIP switches are for two-digit guess number.
    2. Use 6 LEDs to show the number of bulls and cows as the results of input secret 
    number and guess number