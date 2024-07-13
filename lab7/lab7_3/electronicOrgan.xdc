# Clock 
set_property PACKAGE_PIN W5 [get_ports {fcrystal}] 
set_property IOSTANDARD LVCMOS33 [get_ports {fcrystal}] 
# active low reset 
set_property PACKAGE_PIN V17 [get_ports {rst_n}] 
set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}] 
# Pmod I2S 
set_property PACKAGE_PIN A14 [get_ports {audio_mclk}] 
set_property IOSTANDARD LVCMOS33 [get_ports {audio_mclk}] 
set_property PACKAGE_PIN A16 [get_ports {audio_lrck}] 
set_property IOSTANDARD LVCMOS33 [get_ports {audio_lrck}] 
set_property PACKAGE_PIN B15 [get_ports {audio_sck}] 
set_property IOSTANDARD LVCMOS33 [get_ports {audio_sck}] 
set_property PACKAGE_PIN B16 [get_ports {audio_sdin}] 
set_property IOSTANDARD LVCMOS33 [get_ports {audio_sdin}]

set_property PACKAGE_PIN R2 [get_ports {tune_do_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_do_in}]
set_property PACKAGE_PIN T1 [get_ports {tune_re_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_re_in}]
set_property PACKAGE_PIN U1 [get_ports {tune_mi_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_mi_in}]
set_property PACKAGE_PIN W2 [get_ports {tune_fa_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_fa_in}]
set_property PACKAGE_PIN R3 [get_ports {tune_so_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_so_in}]
set_property PACKAGE_PIN T2 [get_ports {tune_la_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_la_in}]
set_property PACKAGE_PIN T3 [get_ports {tune_si_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_si_in}]
set_property PACKAGE_PIN V2 [get_ports {tune_doh_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_doh_in}]
set_property PACKAGE_PIN W13 [get_ports {tune_reh_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_reh_in}]
set_property PACKAGE_PIN W14 [get_ports {tune_mih_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_mih_in}]
set_property PACKAGE_PIN V15 [get_ports {tune_fah_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_fah_in}]
set_property PACKAGE_PIN W15 [get_ports {tune_soh_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_soh_in}]
set_property PACKAGE_PIN W17 [get_ports {tune_lah_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_lah_in}]
set_property PACKAGE_PIN W16 [get_ports {tune_sih_in}]
    set_property IOSTANDARD LVCMOS33 [get_ports {tune_sih_in}]
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