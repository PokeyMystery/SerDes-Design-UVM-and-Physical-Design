set_db delaycal_enable_si true

read_db -physical_data postRoute
read_spef -rc_corner rccorners top.spef
report_constraint -all_violators  > rep.vio.gz
report_analysis_coverage > rep.coverage
report_timing -path_type endpoint -fields {endpoint capture_data_edge slack view} -max_slack 0 > setup.rpt
report_timing -path_type endpoint -fields {endpoint capture_data_edge slack view} -max_slack 0 -early > hold.rpt

report_timing -late -max_paths 1000 -output_format gtd > design_before_late.mtarpt.gz
report_timing -early -max_paths 1000 -output_format gtd > design_before_early.mtarpt.gz

write_eco_opt_db


set_db opt_signoff_verbose true
set_db opt_signoff_read_eco_opt_db ecoTimingDB
opt_signoff -hold
