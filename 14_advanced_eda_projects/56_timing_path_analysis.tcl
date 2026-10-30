puts "===== TIMING PATH ANALYSIS ====="

# Example timing path
set path_name "INPUT_TO_REG"
set start_point "data_in"
set end_point "reg_1/D"

set clock_period 10.0
set input_delay 1.0
set cell_delays {1.2 0.8 1.5 0.7}
set setup_time 0.5

# Calculate total combinational delay
set total_cell_delay 0.0

foreach delay $cell_delays {
    set total_cell_delay [expr {$total_cell_delay + $delay}]
}

# Calculate data arrival and required times
set arrival_time [expr {$input_delay + $total_cell_delay}]
set required_time [expr {$clock_period - $setup_time}]
set slack [expr {$required_time - $arrival_time}]

puts "\nPATH INFORMATION"
puts "Path Name: $path_name"
puts "Start Point: $start_point"
puts "End Point: $end_point"

puts "\nDELAY INFORMATION"
puts "Input Delay: $input_delay ns"
puts "Cell Delays: $cell_delays"
puts "Total Cell Delay: $total_cell_delay ns"
puts "Data Arrival Time: $arrival_time ns"
puts "Required Time: $required_time ns"
puts "Slack: $slack ns"

puts "\nTIMING STATUS"

if {$slack >= 0} {
    puts "Timing Status: PASS"
} else {
    puts "Timing Status: FAIL"
}

puts "\n===== TIMING ANALYSIS COMPLETED ====="







# Output:
# ===== TIMING PATH ANALYSIS =====

# PATH INFORMATION
# Path Name: INPUT_TO_REG
# Start Point: data_in
# End Point: reg_1/D

# DELAY INFORMATION
# Input Delay: 1.0 ns
# Cell Delays: 1.2 0.8 1.5 0.7
# Total Cell Delay: 4.2 ns
# Data Arrival Time: 5.2 ns
# Required Time: 9.5 ns
# Slack: 4.3 ns

# TIMING STATUS
# Timing Status: PASS

# ===== TIMING ANALYSIS COMPLETED =====