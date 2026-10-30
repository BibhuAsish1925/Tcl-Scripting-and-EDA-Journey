# ==========================================
# PHASE 12 - SCRIPT 49
# EDA FLOW AUTOMATION
# ==========================================

puts "===== EDA FLOW AUTOMATION ====="

# Define workflow stages
set flow_stages {
    Read RTL
    Elaborate Design
    Synthesis
    Floorplanning
    Placement
    Timing Analysis
    Report Generation
}

# Store stage results
set flow_results {}

puts "\n1. EXECUTING EDA FLOW"

foreach stage $flow_stages {

    puts "\nRunning Stage: $stage"

    # Simulate successful completion
    set status "COMPLETED"

    dict set flow_results $stage $status

    puts "Status: $status"
}

# Generate summary
puts "\n2. FLOW SUMMARY"

set completed_count 0

dict for {stage status} $flow_results {
    puts "$stage : $status"

    if {$status eq "COMPLETED"} {
        incr completed_count
    }
}

puts "\n3. FINAL RESULT"

puts "Total Stages: [llength $flow_stages]"
puts "Completed Stages: $completed_count"

if {$completed_count == [llength $flow_stages]} {
    puts "EDA Flow Status: SUCCESS"
} else {
    puts "EDA Flow Status: INCOMPLETE"
}

# Generate a flow report
set script_dir [file dirname [file normalize [info script]]]
set report_file [file join $script_dir "eda_flow_report.txt"]

set fp [open $report_file w]

puts $fp "EDA FLOW EXECUTION REPORT"
puts $fp "========================="

dict for {stage status} $flow_results {
    puts $fp "$stage : $status"
}

puts $fp ""
puts $fp "Total Stages: [llength $flow_stages]"
puts $fp "Completed Stages: $completed_count"

close $fp

puts "\nReport generated: $report_file"
puts "\n===== SCRIPT COMPLETED ====="







# Output:
# ===== EDA FLOW AUTOMATION =====

# 1. EXECUTING EDA FLOW

# Running Stage: Read
# Status: COMPLETED

# Running Stage: RTL
# Status: COMPLETED

# Running Stage: Elaborate
# Status: COMPLETED

# Running Stage: Design
# Status: COMPLETED

# Running Stage: Synthesis
# Status: COMPLETED

# Running Stage: Floorplanning
# Status: COMPLETED

# Running Stage: Placement
# Status: COMPLETED

# Running Stage: Timing
# Status: COMPLETED

# Running Stage: Analysis
# Status: COMPLETED

# Running Stage: Report
# Status: COMPLETED

# Running Stage: Generation
# Status: COMPLETED

# 2. FLOW SUMMARY
# Read : COMPLETED
# RTL : COMPLETED
# Elaborate : COMPLETED
# Design : COMPLETED
# Synthesis : COMPLETED
# Floorplanning : COMPLETED
# Placement : COMPLETED
# Timing : COMPLETED
# Analysis : COMPLETED
# Report : COMPLETED
# Generation : COMPLETED

# 3. FINAL RESULT
# Total Stages: 11
# Completed Stages: 11
# EDA Flow Status: SUCCESS

# Report generated: D:/Downloads/GitHub/TCL-Learning/Tcl-Scripting Journey/12_tcl_for_eda_tools/eda_flow_report.txt

# ===== SCRIPT COMPLETED =====