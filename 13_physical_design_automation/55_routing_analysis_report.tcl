# ==========================================
# PHASE 13 - SCRIPT 55
# ROUTING ANALYSIS AND REPORT
# ==========================================

puts "===== ROUTING ANALYSIS ====="

# Mock routing information
set design_name "ALU_DESIGN"

set total_nets 250
set routed_nets 245
set unrouted_nets [expr {$total_nets - $routed_nets}]

set total_wirelength 12500.0
set routing_violations 3

# Mock congestion information
set horizontal_congestion 72.0
set vertical_congestion 68.0

# Calculate routing completion
set routing_completion [expr {
    ($routed_nets * 100.0) / $total_nets
}]

puts "\n1. ROUTING INFORMATION"
puts "Design: $design_name"
puts "Total Nets: $total_nets"
puts "Routed Nets: $routed_nets"
puts "Unrouted Nets: $unrouted_nets"

puts "\n2. ROUTING METRICS"
puts "Total Wirelength: $total_wirelength"
puts "Routing Violations: $routing_violations"
puts "Horizontal Congestion: $horizontal_congestion%"
puts "Vertical Congestion: $vertical_congestion%"

puts "\n3. ROUTING COMPLETION"
puts "Routing Completion: [format %.2f $routing_completion]%"

if {$unrouted_nets == 0 && $routing_violations == 0} {
    set routing_status "SUCCESS"
} else {
    set routing_status "NEEDS REVIEW"
}

puts "Routing Status: $routing_status"

# Generate report
set script_dir [file dirname [file normalize [info script]]]
set report_file [file join $script_dir "physical_design_report.txt"]

set fp [open $report_file w]

puts $fp "PHYSICAL DESIGN ROUTING REPORT"
puts $fp "=============================="
puts $fp "Design: $design_name"
puts $fp "Total Nets: $total_nets"
puts $fp "Routed Nets: $routed_nets"
puts $fp "Unrouted Nets: $unrouted_nets"
puts $fp "Total Wirelength: $total_wirelength"
puts $fp "Routing Violations: $routing_violations"
puts $fp "Horizontal Congestion: $horizontal_congestion%"
puts $fp "Vertical Congestion: $vertical_congestion%"
puts $fp "Routing Completion: [format %.2f $routing_completion]%"
puts $fp "Routing Status: $routing_status"

close $fp

puts "\nReport generated successfully."
puts "Report Path: $report_file"

puts "\n===== ROUTING ANALYSIS COMPLETED ====="







# Output:
# ===== ROUTING ANALYSIS =====

# 1. ROUTING INFORMATION
# Design: ALU_DESIGN
# Total Nets: 250
# Routed Nets: 245
# Unrouted Nets: 5

# 2. ROUTING METRICS
# Total Wirelength: 12500.0
# Routing Violations: 3
# Horizontal Congestion: 72.0%
# Vertical Congestion: 68.0%

# 3. ROUTING COMPLETION
# Routing Completion: 98.00%
# Routing Status: NEEDS REVIEW

# Report generated successfully.
# Report Path: D:/Downloads/GitHub/TCL-Learning/Tcl-Scripting Journey/13_physical_design_automation/physical_design_report.txt

# ===== ROUTING ANALYSIS COMPLETED =====
