# ring_counter1Hz.xdc
# clock
set_property PACKAGE_PIN W5 [get_ports {clk}]
    set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# active low reset
set_property PACKAGE_PIN V17 [get_ports {reset}]
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

# leds display
set_property PACKAGE_PIN V14 [get_ports {count[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {count[7]}]
set_property PACKAGE_PIN U14 [get_ports {count[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {count[6]}]
set_property PACKAGE_PIN U15 [get_ports {count[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {count[5]}]
set_property PACKAGE_PIN W18 [get_ports {count[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {count[4]}]
set_property PACKAGE_PIN V19 [get_ports {count[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {count[3]}]
set_property PACKAGE_PIN U19 [get_ports {count[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {count[2]}]
set_property PACKAGE_PIN E19 [get_ports {count[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {count[1]}]
set_property PACKAGE_PIN U16 [get_ports {count[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {count[0]}]