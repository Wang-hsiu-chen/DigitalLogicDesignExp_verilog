# freqdiv27.xdc
# clock
set_property PACKAGE_PIN W5 [get_ports {clk}]
    set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# active low reset
set_property PACKAGE_PIN V17 [get_ports {reset}]
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

# divided clock output
set_property PACKAGE_PIN U16 [get_ports {clk_out}]
    set_property IOSTANDARD LVCMOS33 [get_ports {clk_out}]
