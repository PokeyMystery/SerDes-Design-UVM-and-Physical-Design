create_clock -name clk -period 5 -waveform {2.5 0} [get_ports "clk"]

set_clock_transition -rise 0.1 [get_clocks "clk"]
set_clock_transition -fall 0.1 [get_clocks "clk"]
set_clock_uncertainty 0.01 [get_ports "clk"]

set_input_delay  -max 1 [get_ports "data_in"] -clock [get_clocks "clk"]
set_input_delay  -max 1 [get_ports "rst"] -clock [get_clocks "clk"]
set_input_delay  -max 1 [get_ports "ser_in"] -clock [get_clocks "clk"]
set_input_delay  -max 1 [get_ports "ser_in2"] -clock [get_clocks "clk"]
set_input_delay  -max 1 [get_ports "ser_in3"] -clock [get_clocks "clk"]
set_input_delay  -max 1 [get_ports "ser_in4"] -clock [get_clocks "clk"]
set_input_delay  -max 1 [get_ports "start_i"] -clock [get_clocks "clk"]

set_output_delay  -max 1 [get_ports "data_out"] -clock [get_clocks "clk"]
set_output_delay  -max 1 [get_ports "ser_out"] -clock [get_clocks "clk"]
set_output_delay  -max 1 [get_ports "ser_out2"] -clock [get_clocks "clk"]
set_output_delay  -max 1 [get_ports "ser_out3"] -clock [get_clocks "clk"]
set_output_delay  -max 1 [get_ports "ser_out4"] -clock [get_clocks "clk"]
set_output_delay  -max 1 [get_ports "start_o"] -clock [get_clocks "clk"]
