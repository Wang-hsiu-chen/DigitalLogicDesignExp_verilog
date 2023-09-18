# synupcount1Hz.xdc
# clock
set_property PACKAGE_PIN W5 [get_ports {clk}]
    set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# active low reset
set_property PACKAGE_PIN V17 [get_ports {reset}]
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

# leds display
set_property PACKAGE_PIN V19 [get_ports {cnt_out[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {cnt_out[3]}]
set_property PACKAGE_PIN U19 [get_ports {cnt_out[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {cnt_out[2]}]
set_property PACKAGE_PIN E19 [get_ports {cnt_out[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {cnt_out[1]}]
set_property PACKAGE_PIN U16 [get_ports {cnt_out[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {cnt_out[0]}]

