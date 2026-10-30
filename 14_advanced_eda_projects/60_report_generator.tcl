puts "===== EDA REPORT GENERATOR ====="

# Mock design metrics
set design_name "EDA_DEMO_TOP"
set cell_count 1250
set total_area 5200.50
set utilization 0.68
set timing_slack 0.35
set total_power 252.0
set drc_violations 3

# Create report file
set report_file "phase14_eda_report.txt"

set file_id [open $report_file "w"]

puts $file_id "======================================"
puts $file_id "          EDA DESIGN REPORT"
puts $file_id "======================================"
puts $file_id ""
puts $file_id "Design Name       : $design_name"
puts $file_id "Cell Count        : $cell_count"
puts $file_id "Total Cell Area   : $total_area"
puts $file_id "Utilization       : [format "%.1f%%" [expr {$utilization * 100}]]"
puts $file_id "Timing Slack      : $timing_slack ns"
puts $file_id "Estimated Power   : $total_power mW"
puts $file_id "DRC Violations    : $drc_violations"
puts $file_id ""
puts $file_id "--------------------------------------"
puts $file_id "DESIGN STATUS"
puts $file_id "--------------------------------------"

if {$timing_slack >= 0 && $drc_violations == 0} {
    puts $file_id "Status: PASS"
} else {
    puts $file_id "Status: NEEDS REVIEW"
}

puts $file_id ""
puts $file_id "Report generated using Tcl automation."

close $file_id

puts "Report generated successfully: $report_file"
puts "===== REPORT GENERATION COMPLETED ====="







# Output:
# ===== EDA REPORT GENERATOR =====
# Report generated successfully: phase14_eda_report.txt
# ===== REPORT GENERATION COMPLETED =====
