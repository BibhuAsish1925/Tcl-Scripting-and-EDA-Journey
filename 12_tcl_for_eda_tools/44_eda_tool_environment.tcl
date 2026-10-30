puts "===== EDA TOOL ENVIRONMENT ====="

# Tcl interpreter information
puts "\n1. TCL INFORMATION"

puts "Tcl Version: [info patchlevel]"
puts "Tcl Executable: [info nameofexecutable]"
puts "Current Working Directory: [pwd]"

# Script information
puts "\n2. SCRIPT INFORMATION"

puts "Script Name: [file tail [info script]]"
puts "Script Directory: [file dirname [info script]]"

# Environment information
puts "\n3. ENVIRONMENT INFORMATION"

if {[info exists env(PATH)]} {
    puts "PATH environment variable is available."
} else {
    puts "PATH environment variable is not available."
}

# Demonstrate tool-specific command discovery.
# These are illustrative command names, not actual tool commands.
puts "\n4. EDA TOOL COMMAND DISCOVERY"

set example_eda_commands {
    read_verilog
    read_sdc
    get_cells
    get_ports
    get_pins
    report_timing
    report_area
}

foreach command_name $example_eda_commands {
    puts "Example EDA command: $command_name"
}

puts "\nNote: The commands above are examples."
puts "They are not executed by standard tclsh."

puts "\n===== SCRIPT COMPLETED ====="






# Output:
# ===== EDA TOOL ENVIRONMENT =====

# 1. TCL INFORMATION
# Tcl Version: 9.0.4
# Tcl Executable: C:/Users/Bibhu/AppData/Local/Apps/Tcl90/bin/tclsh.exe
# Current Working Directory: D:/Downloads/GitHub/TCL-Learning/Tcl-Scripting Journey

# 2. SCRIPT INFORMATION
# Script Name: 44_eda_tool_environment.tcl
# Script Directory: ./12_tcl_for_eda_tools

# 3. ENVIRONMENT INFORMATION
# PATH environment variable is available.

# 4. EDA TOOL COMMAND DISCOVERY
# Example EDA command: read_verilog
# Example EDA command: read_sdc
# Example EDA command: get_cells
# Example EDA command: get_ports
# Example EDA command: get_pins
# Example EDA command: report_timing
# Example EDA command: report_area

# Note: The commands above are examples.
# They are not executed by standard tclsh.

# ===== SCRIPT COMPLETED =====