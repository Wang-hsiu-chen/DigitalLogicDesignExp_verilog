#timer50to0.xdc
# clock
set_property PACKAGE_PIN W5 [get_ports {clk}]
    set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
# active low reset
set_property PACKAGE_PIN V17 [get_ports {reset}]
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
# DIP switch
set_property PACKAGE_PIN R2 [get_ports {speedup}]        
    set_property IOSTANDARD LVCMOS33 [get_ports {speedup}]
#push button
set_property PACKAGE_PIN W19 [get_ports {stop_in}]        
    set_property IOSTANDARD LVCMOS33 [get_ports {stop_in}]
set_property PACKAGE_PIN U17 [get_ports {lap_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lap_in}]

#8 common segment controls
set_property PACKAGE_PIN W7 [get_ports {segs[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {segs[7]}]
set_property PACKAGE_PIN W6 [get_ports {segs[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {segs[6]}]
set_property PACKAGE_PIN U8 [get_ports {segs[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {segs[5]}]
set_property PACKAGE_PIN V8 [get_ports {segs[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {segs[4]}]
set_property PACKAGE_PIN U5 [get_ports {segs[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {segs[3]}]
set_property PACKAGE_PIN V5 [get_ports {segs[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {segs[2]}]
set_property PACKAGE_PIN U7 [get_ports {segs[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {segs[1]}]
set_property PACKAGE_PIN V7 [get_ports {segs[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {segs[0]}]
# Four anode control signals
set_property PACKAGE_PIN W4 [get_ports {ssd_ctl[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {ssd_ctl[3]}]
set_property PACKAGE_PIN V4 [get_ports {ssd_ctl[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {ssd_ctl[2]}]
set_property PACKAGE_PIN U4 [get_ports {ssd_ctl[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {ssd_ctl[1]}]
set_property PACKAGE_PIN U2 [get_ports {ssd_ctl[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {ssd_ctl[0]}]
# all 16 leds
set_property PACKAGE_PIN L1 [get_ports {stop}]
    set_property IOSTANDARD LVCMOS33 [get_ports {stop}]
set_property PACKAGE_PIN P1 [get_ports {lap}]
    set_property IOSTANDARD LVCMOS33 [get_ports {lap}]

