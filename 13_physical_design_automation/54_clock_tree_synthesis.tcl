
# ==========================================
# PHASE 13 - SCRIPT 54
# CLOCK TREE SYNTHESIS
# ==========================================

puts "===== CLOCK TREE SYNTHESIS ANALYSIS ====="

# Mock clock-tree information
set clock_name "CLK_MAIN"
set clock_period 10.0
set sequential_cells 120
set clock_buffers 18
set clock_inverters 4

# Mock timing measurements
set clock_insertion_delay 0.85
set clock_skew 0.12
set clock_transition 0.18

# Calculate total clock-tree cells
set total_clock_cells [expr {$clock_buffers + $clock_inverters}]

puts "\n1. CLOCK INFORMATION"
puts "Clock Name: $clock_name"
puts "Clock Period: $clock_period ns"
puts "Sequential Cells: $sequential_cells"

puts "\n2. CLOCK TREE INFORMATION"
puts "Clock Buffers: $clock_buffers"
puts "Clock Inverters: $clock_inverters"
puts "Total Clock Cells: $total_clock_cells"

puts "\n3. CLOCK TIMING METRICS"
puts "Insertion Delay: $clock_insertion_delay ns"
puts "Clock Skew: $clock_skew ns"
puts "Clock Transition: $clock_transition ns"

# Clock skew threshold
set skew_limit 0.20

puts "\n4. CLOCK SKEW CHECK"

if {$clock_skew <= $skew_limit} {
    puts "Clock Skew Status: WITHIN EXAMPLE LIMIT"
} else {
    puts "Clock Skew Status: EXCEEDS EXAMPLE LIMIT"
}

puts "\n===== CTS ANALYSIS COMPLETED ====="








# Output:
# ===== CLOCK TREE SYNTHESIS ANALYSIS =====

# 1. CLOCK INFORMATION
# Clock Name: CLK_MAIN
# Clock Period: 10.0 ns
# Sequential Cells: 120

# 2. CLOCK TREE INFORMATION
# Clock Buffers: 18
# Clock Inverters: 4
# Total Clock Cells: 22

# 3. CLOCK TIMING METRICS
# Insertion Delay: 0.85 ns
# Clock Skew: 0.12 ns
# Clock Transition: 0.18 ns

# 4. CLOCK SKEW CHECK
# Clock Skew Status: WITHIN EXAMPLE LIMIT

# ===== CTS ANALYSIS COMPLETED =====
