# EDA file reporter

set directory "09_eda_workflows"

# Find Tcl files in the selected directory.
set files [glob -nocomplain -directory $directory *.tcl]

puts "EDA File Report"
puts "---------------"
puts "Directory: $directory"
puts "Tcl files: [llength $files]"

# Display each matching file.
foreach file $files {
    puts [file tail $file]
}






# Output:
# EDA File Report
# ---------------
# Directory: 09_eda_workflows
# Tcl files: 5
# 34_file_reporter.tcl
# 35_log_analyzer.tcl
# 36_timing_report_parser.tcl
# 37_cell_statistics.tcl
# 38_eda_automation_flow.tcl