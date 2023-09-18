# lab3 FrequencyDivider, UpCounter, ShiftRegister, Marquee
## Pre-labs
1. **Consider a `4`-bit synchronous binary up counter *(q3q2q1q0)*.**
    1. Draw the logic diagram
    2. Construct Verilog RTL representation for the logics with verification.
2. **Cascade eight DFFs together as a shift register. Connect the output of the last DFF to the input of the first DFF as a ringer counter. Let the initial value of DFF output after reset be `1101110`. Construct the Verilog RTL representation for the logics with verification.**
## Exp
1. **Frequency Divider: Construct a `27`-bit synchronous binary counter. Use the MSB of the counter, we can get a frequency divider which provides a `1/227` frequency output *(fout)* of the original clock *(fcrystal, 100MHz)*. Construct a frequency divider of this kind.**
    1. Write the specification of the frequency divider.
    2. Draw the block diagram of the frequency divider.
    3. Implement the frequency divider with the following parameters.
        |I/O |fcrystal |fout|
        |---|---|---|
        |Site |W5 |U16|
2. **Frequency Divider: Use a count-for-`50M` counter and some glue logics to construct a `1 Hz` clock frequency. Construct a frequency divider of this kind.**
    1. Write the specification of the frequency divider.
    2. Draw the block diagram of the frequency divider.
    3. Implement the frequency divider with the following parameters.
        |I/O |fcrystal |fout|
        |---|---|---|
        |Site |W5 |U16|
3. **Implement pre-lab1 with clock frequency of `1 Hz`.**
    |I/O |fcrystal |q3 |q2 |q1 |q0|
    |---|---|---|---|---|---|
    |Site |W5 |V19 |U19 |E19 |U16|
4. **Implement pre-lab2 with clock frequency of `1 Hz`. The I/O pins can be assigned by yourself.**
5. **Use the idea from pre-lab2. We can do something on the seven-segment display. Assume we have the pattern of `E`, `H`, `N`, `T`, `U` for seven-segment display as shown below. Try to implement the scrolling pre-stored pattern <font color=green>“NTHUEE2023”</font> with the four seven-segment displays.**
