set_db init_lib_search_path ../lib/
set_db init_hdl_search_path ../rtl/
read_libs fast_vdd1v0_basicCells.lib
read_hdl top_32.sv -sv
elaborate top
read_sdc ../constraints/constraints_top.sdc

set_db dft_scan_style muxed_scan 
set_db dft_prefix dft_
define_shift_enable -name SE -active high -create_port SE
check_dft_rules

set_db syn_generic_effort high
syn_generic
set_db syn_map_effort high
syn_map
#set_db syn_opt_effort high
#syn_opt

check_dft_rules 
set_db design:top .dft_min_number_of_scan_chains 1 
define_scan_chain -name top_chain -sdi scan_in -sdo scan_out -create_ports  

connect_scan_chains -auto_create_chains 
#syn_opt -incr

report_scan_chains 
write_dft_atpg -library ../lib/fast_vdd1v0_basicCells.v
write_hdl > outputs_dft/SerDes_netlist_dft.v
write_sdc > outputs_dft/SerDes_sdc.sdc
write_sdf -nonegchecks -edges check_edge -timescale ns -recrem split  -setuphold split > outputs_dft/SerDes_dft_delays.sdf
write_scandef > outputs_dft/SerDes_dft_scanDEF.scandef

report_timing > reports_dft/report_timing.rpt
report_power  > reports_dft/report_power.rpt
report_area   > reports_dft/report_area.rpt
report_qor    > reports_dft/report_qor.rpt
#report_summary > reports/report_summary.rpt

gui_show
