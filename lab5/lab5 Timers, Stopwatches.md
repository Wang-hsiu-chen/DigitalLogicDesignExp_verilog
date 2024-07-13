# lab5 Timers, Stopwatches
## Pre-labs
1. **Construct a 50-second down counter *(timer)* with pause function. When the counter goes to `0`, all the LEDs will be lighted up. You can use one push button for reset and one other for pause/start function.**
    1. Write the spec *(inputs, outputs, and function table)* of the design.
    2. Draw the related block/logic diagram.
    3. Use an FSM to implement the function of pause/start function. Use one LED to represent current state.
    4. Use Verilog to implement 1.3 and verify the design with simulation results.
## Exp
1. **Construct a `50`-second down counter *(timer)* with pause function. When the counter goes to 0, all the LEDs will be lighted up. You can use one push button for reset and one other for pause/start function.**
    1. Implement a periodic `50`-second down counter and demo with the FPGA board.
    2. Implement Prelab 1.3 and demo with the FPGA board.
    3. Combine 1.2 and 1.3 to finish the experiment.
2. **Implement a stopwatch function *(00:00-59:59)* with the FPGA board.**
    1. Use the four *(Seven-Segment Displays, SSDs)* as the display. The left two digits represent the minute and the right two digits represent the second.
    2. Use two push buttons to control the function. Use one button to control start/stop and the other to control the lap and reset. When the stopwatch counts, press the ‘lap’ button will freeze the SSDs but the stopwatch continues counting, and when press the ‘lap’ button again, the SSDs will start to show current time. 
3. **Implement a timer (can support as long as 59:59) with the following functions.**
    1. Use one DIP switch as the ‘setting’ control. When the ‘setting’ is ON, you can use two buttons to set the minute and second.
    2. Use other two buttons to control the timer operation. One button for start/stop and the other button for pause/resume.
    3. When the time goes to `0`, light up all the LEDs