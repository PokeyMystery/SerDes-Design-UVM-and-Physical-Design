set_db init_lib_search_path ../lib/
set_db init_hdl_search_path ../rtl/
read_libs fast_vdd1v0_basicCells.lib
read_hdl top_32.sv -sv
elaborate top
read_sdc ../constraints/constraints_top3.sdc
set_db lp_insert_clock_gating true



set_db syn_generic_effort high
syn_generic
set_db syn_map_effort high
syn_map
#set_db syn_opt_effort high
#syn_opt



write_hdl > outputs_clk_1/SerDes_netlist_clk_1.v
write_sdc > outputs_clk_1/SerDes_sdc_clk_1.sdc
write_sdf -nonegchecks -edges check_edge -timescale ns -recrem split  -setuphold split > outputs_clk_1/SerDes_clk_1_delays.sdf


report_timing > reports_clk_1/report_timing.rpt
report_power  > reports_clk_1/report_power.rpt
report_area   > reports_clk_1/report_area.rpt
report_qor    > reports_clk_1/report_qor.rpt
#report_summary > reports/report_summary.rpt

gui_show

