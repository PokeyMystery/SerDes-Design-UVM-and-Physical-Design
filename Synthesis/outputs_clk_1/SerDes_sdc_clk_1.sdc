# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Tue Apr 09 12:04:50 IST 2024

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design top

create_clock -name "clk" -period 1.0 -waveform {0.0 0.5} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
group_path -weight 1.000000 -name cg_enable_group_clk -through [list \
  [get_pins D1/RC_CG_HIER_INST8/enable]  \
  [get_pins D1/RC_CG_HIER_INST8/RC_CGIC_INST/E]  \
  [get_pins D1/RC_CG_HIER_INST9/enable]  \
  [get_pins D1/RC_CG_HIER_INST9/RC_CGIC_INST/E]  \
  [get_pins D2/RC_CG_HIER_INST10/enable]  \
  [get_pins D2/RC_CG_HIER_INST10/RC_CGIC_INST/E]  \
  [get_pins D2/RC_CG_HIER_INST11/enable]  \
  [get_pins D2/RC_CG_HIER_INST11/RC_CGIC_INST/E]  \
  [get_pins D3/RC_CG_HIER_INST12/enable]  \
  [get_pins D3/RC_CG_HIER_INST12/RC_CGIC_INST/E]  \
  [get_pins D3/RC_CG_HIER_INST13/enable]  \
  [get_pins D3/RC_CG_HIER_INST13/RC_CGIC_INST/E]  \
  [get_pins D4/RC_CG_HIER_INST14/enable]  \
  [get_pins D4/RC_CG_HIER_INST14/RC_CGIC_INST/E]  \
  [get_pins D4/RC_CG_HIER_INST15/enable]  \
  [get_pins D4/RC_CG_HIER_INST15/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST2/enable]  \
  [get_pins RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST3/enable]  \
  [get_pins RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST4/enable]  \
  [get_pins RC_CG_HIER_INST4/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST5/enable]  \
  [get_pins RC_CG_HIER_INST5/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST6/enable]  \
  [get_pins RC_CG_HIER_INST6/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST7/enable]  \
  [get_pins RC_CG_HIER_INST7/RC_CGIC_INST/E]  \
  [get_pins D1/RC_CG_HIER_INST8/enable]  \
  [get_pins D1/RC_CG_HIER_INST8/RC_CGIC_INST/E]  \
  [get_pins D1/RC_CG_HIER_INST9/enable]  \
  [get_pins D1/RC_CG_HIER_INST9/RC_CGIC_INST/E]  \
  [get_pins D2/RC_CG_HIER_INST10/enable]  \
  [get_pins D2/RC_CG_HIER_INST10/RC_CGIC_INST/E]  \
  [get_pins D2/RC_CG_HIER_INST11/enable]  \
  [get_pins D2/RC_CG_HIER_INST11/RC_CGIC_INST/E]  \
  [get_pins D3/RC_CG_HIER_INST12/enable]  \
  [get_pins D3/RC_CG_HIER_INST12/RC_CGIC_INST/E]  \
  [get_pins D3/RC_CG_HIER_INST13/enable]  \
  [get_pins D3/RC_CG_HIER_INST13/RC_CGIC_INST/E]  \
  [get_pins D4/RC_CG_HIER_INST14/enable]  \
  [get_pins D4/RC_CG_HIER_INST14/RC_CGIC_INST/E]  \
  [get_pins D4/RC_CG_HIER_INST15/enable]  \
  [get_pins D4/RC_CG_HIER_INST15/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST2/enable]  \
  [get_pins RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST3/enable]  \
  [get_pins RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST4/enable]  \
  [get_pins RC_CG_HIER_INST4/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST5/enable]  \
  [get_pins RC_CG_HIER_INST5/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST6/enable]  \
  [get_pins RC_CG_HIER_INST6/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST7/enable]  \
  [get_pins RC_CG_HIER_INST7/RC_CGIC_INST/E]  \
  [get_pins RC_CG_DECLONE_HIER_INST/RC_CGIC_INST/E]  \
  [get_pins RC_CG_DECLONE_HIER_INST/RC_CGIC_INST/E]  \
  [get_pins RC_CG_DECLONE_HIER_INST4476/RC_CGIC_INST/E]  \
  [get_pins RC_CG_DECLONE_HIER_INST4476/RC_CGIC_INST/E]  \
  [get_pins D1/RC_CG_HIER_INST8/enable]  \
  [get_pins D1/RC_CG_HIER_INST8/RC_CGIC_INST/E]  \
  [get_pins D1/RC_CG_HIER_INST9/enable]  \
  [get_pins D1/RC_CG_HIER_INST9/RC_CGIC_INST/E]  \
  [get_pins D2/RC_CG_HIER_INST10/enable]  \
  [get_pins D2/RC_CG_HIER_INST10/RC_CGIC_INST/E]  \
  [get_pins D2/RC_CG_HIER_INST11/enable]  \
  [get_pins D2/RC_CG_HIER_INST11/RC_CGIC_INST/E]  \
  [get_pins D3/RC_CG_HIER_INST12/enable]  \
  [get_pins D3/RC_CG_HIER_INST12/RC_CGIC_INST/E]  \
  [get_pins D3/RC_CG_HIER_INST13/enable]  \
  [get_pins D3/RC_CG_HIER_INST13/RC_CGIC_INST/E]  \
  [get_pins D4/RC_CG_HIER_INST14/enable]  \
  [get_pins D4/RC_CG_HIER_INST14/RC_CGIC_INST/E]  \
  [get_pins D4/RC_CG_HIER_INST15/enable]  \
  [get_pins D4/RC_CG_HIER_INST15/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST2/enable]  \
  [get_pins RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST3/enable]  \
  [get_pins RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST4/enable]  \
  [get_pins RC_CG_HIER_INST4/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST5/enable]  \
  [get_pins RC_CG_HIER_INST5/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST6/enable]  \
  [get_pins RC_CG_HIER_INST6/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST7/enable]  \
  [get_pins RC_CG_HIER_INST7/RC_CGIC_INST/E]  \
  [get_pins RC_CG_DECLONE_HIER_INST/enable]  \
  [get_pins RC_CG_DECLONE_HIER_INST/RC_CGIC_INST/E]  \
  [get_pins RC_CG_DECLONE_HIER_INST4476/enable]  \
  [get_pins RC_CG_DECLONE_HIER_INST4476/RC_CGIC_INST/E] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[31]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[30]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[29]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[28]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[27]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[26]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[25]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[24]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[23]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[22]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[21]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[20]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[19]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[18]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[17]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[16]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[15]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[14]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[13]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[12]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[11]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[10]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[9]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[8]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[7]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[6]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[5]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[4]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[3]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[2]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_in[0]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports rst]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[31]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[30]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[29]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[28]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[27]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[26]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[25]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[24]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[23]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[22]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[21]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[20]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[19]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[18]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[17]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[16]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[15]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[14]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[13]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[12]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[11]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[10]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 0.1 [get_ports {data_out[0]}]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
