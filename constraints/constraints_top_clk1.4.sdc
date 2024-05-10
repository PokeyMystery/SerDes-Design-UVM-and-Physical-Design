create_clock -name clk -period 1.4 -waveform {0 0.7} [get_ports "clk"]


set_clock_transition -rise 0.1 [get_clocks "clk"]
set_clock_transition -fall 0.1 [get_clocks "clk"]
set_clock_uncertainty 0.01 [get_ports "clk"]



set_input_delay  -max 0.1 [get_ports "data_in"] -clock [get_clocks "clk"]
set_input_delay  -max 0.1 [get_ports "rst"] -clock [get_clocks "clk"]

set_output_delay  -max 0.1 [get_ports "data_out"] -clock [get_clocks "clk"]

