puts "===== REUSABLE TCL LIBRARY DEMO ====="

set library_file [file join [file dirname [info script]] \
    lib eda_utils.tcl]

if {![file exists $library_file]} {
    error "EDA utility library not found: $library_file"
}

source $library_file

namespace import ::EDAUtils::*

set width 100
set height 80
set cell_area 5000
set core_area [calculate_area $width $height]

set utilization [calculate_utilization $cell_area $core_area]

puts "\nDESIGN INFORMATION"
puts "Core Width: $width"
puts "Core Height: $height"
puts "Core Area: $core_area"

puts "\nUTILIZATION"
puts [format "Cell Area: %.2f" $cell_area]
puts [format "Core Utilization: %.2f%%" $utilization]

puts "\n===== LIBRARY DEMO COMPLETED ====="







# Output:
# ===== REUSABLE TCL LIBRARY DEMO =====

# DESIGN INFORMATION
# Core Width: 100
# Core Height: 80
# Core Area: 8000

# UTILIZATION
# Cell Area: 5000.00
# Core Utilization: 62.50%

# ===== LIBRARY DEMO COMPLETED =====