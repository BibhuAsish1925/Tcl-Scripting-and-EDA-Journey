# Complete EDA automation flow

# Check command-line arguments.
if {$argc != 1} {
    puts "Usage: tclsh 38_eda_automation_flow.tcl <design>"
    exit 1
}

set design [lindex $argv 0]

# Validate the design name.
if {$design eq ""} {
    puts "Error: Design name cannot be empty"
    exit 1
}

set timing_file "09_eda_workflows/timing.rpt"
set report_file "09_eda_workflows/${design}_summary.rpt"

set wns 0
set violations 0

# Safely open the timing report.
set status [catch {open $timing_file r} file]

if {$status != 0} {
    puts "Error opening timing report: $file"
    exit 1
}

# Parse the timing report.
while {[gets $file line] >= 0} {

    if {[regexp {WNS:\s+(-?[0-9.]+)} $line -> value]} {
        set wns $value
    }

    if {[regexp {VIOLATIONS:\s+([0-9]+)} $line -> value]} {
        set violations $value
    }
}

close $file

# Determine timing status.
if {$wns < 0 || $violations > 0} {
    set timing_status "FAIL"
} else {
    set timing_status "PASS"
}

# Generate summary report.
set report [open $report_file w]

puts $report "EDA Automation Summary"
puts $report "----------------------"
puts $report "Design: $design"
puts $report "WNS: $wns"
puts $report "Violations: $violations"
puts $report "Timing Status: $timing_status"

close $report

puts "EDA flow completed."
puts "Summary report: $report_file"






# Output:
# EDA flow completed.
# Summary report: 09_eda_workflows/UART_summary.rpt