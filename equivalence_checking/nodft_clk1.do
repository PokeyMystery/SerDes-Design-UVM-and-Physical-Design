set log file counter_lec.log -replace
set flatten model -gated_clock
read library ../lib/fast_vdd1v0_basicCells.v -verilog -both
read design ../rtl/top_32.sv -systemverilog -golden
read design ../synthesis/outputs_clk_1/SerDes_netlist_clk_1.v -verilog -revised

set system mode lec
add compared point -all
compare 
