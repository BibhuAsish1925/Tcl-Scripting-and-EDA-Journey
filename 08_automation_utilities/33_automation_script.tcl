# Simple automation script

# Check whether a module name was provided.
if {$argc != 1} {
    puts "Usage: tclsh 33_automation_script.tcl <module>"
    exit 1
}

set module [lindex $argv 0]

# Validate that the module name is not empty.
if {$module eq ""} {
    puts "Error: Module name cannot be empty"
    exit 1
}

set filename "08_automation_utilities/report.txt"

# Open the report file for writing.
set file [open $filename w]

puts $file "Module Report"
puts $file "-------------"
puts $file "Module: $module"
puts $file "Status: PASS"

close $file

puts "Report generated: $filename"







# Output:
# Report generated: 08_automation_utilities/report.txt