# clock
set_property PACKAGE_PIN W5 [get_ports {clk}]
    set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
# active low reset
set_property PACKAGE_PIN V17 [get_ports {reset}]
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
#push button
set_property PACKAGE_PIN W19 [get_ports {pause}]
    set_property IOSTANDARD LVCMOS33 [get_ports {pause}]
# all 16 leds
set_property PACKAGE_PIN L1 [get_ports {counter_enable}]
    set_property IOSTANDARD LVCMOS33 [get_ports {counter_enable}]
set_property PACKAGE_PIN P1 [get_ports {one_in}]
        set_property IOSTANDARD LVCMOS33 [get_ports {one_in}]
#set_property PACKAGE_PIN N3 [get_ports {one_in}]
#        set_property IOSTANDARD LVCMOS33 [get_ports {one_in}]
#set_property PACKAGE_PIN P3 [get_ports {one_in}]
#        set_property IOSTANDARD LVCMOS33 [get_ports {one_in}]
#set_property PACKAGE_PIN U3 [get_ports {one_in}]
#        set_property IOSTANDARD LVCMOS33 [get_ports {one_in}]        