# ==========================================
# PHASE 12 - SCRIPT 48
# SDC CONSTRAINT GENERATION
# ==========================================

puts "===== SDC CONSTRAINT GENERATION ====="

# Create output path relative to this script
set script_dir [file dirname [file normalize [info script]]]
set sdc_file [file join $script_dir "design_constraints.sdc"]

# Open SDC file for writing
set fp [open $sdc_file w]

# Clock definition
puts $fp "# Clock definition"
puts $fp "create_clock -name CLK_MAIN -period 10.0 \[get_ports clk\]"

# Input delay
puts $fp ""
puts $fp "# Input delay"
puts $fp "set_input_delay 2.0 -clock CLK_MAIN \[get_ports data_in\]"

# Output delay
puts $fp ""
puts $fp "# Output delay"
puts $fp "set_output_delay 1.5 -clock CLK_MAIN \[get_ports data_out\]"

# Clock uncertainty
puts $fp ""
puts $fp "# Clock uncertainty"
puts $fp "set_clock_uncertainty 0.2 \[get_clocks CLK_MAIN\]"

close $fp

puts "SDC file generated successfully."
puts "Output File: $sdc_file"

# Read back and display generated constraints
puts "\n1. GENERATED CONSTRAINTS"

set fp [open $sdc_file r]
set content [read $fp]
close $fp

puts $content

puts "\n===== SCRIPT COMPLETED ====="







# Output:
# ===== SDC CONSTRAINT GENERATION =====
# SDC file generated successfully.
# Output File: D:/Downloads/GitHub/TCL-Learning/Tcl-Scripting Journey/12_tcl_for_eda_tools/design_constraints.sdc

# 1. GENERATED CONSTRAINTS
# Clock definition
# create_clock -name CLK_MAIN -period 10.0 [get_ports clk]

# Input delay
# set_input_delay 2.0 -clock CLK_MAIN [get_ports data_in]

# Output delay
# set_output_delay 1.5 -clock CLK_MAIN [get_ports data_out]

# Clock uncertainty
# set_clock_uncertainty 0.2 [get_clocks CLK_MAIN]


# ===== SCRIPT COMPLETED =====