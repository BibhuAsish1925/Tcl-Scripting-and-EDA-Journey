
# ==========================================
# PHASE 14 - SCRIPT 57
# SETUP AND HOLD ANALYSIS
# ==========================================

puts "===== SETUP AND HOLD ANALYSIS ====="

# Example timing data
set clock_period 10.0
set clock_uncertainty 0.2
set setup_time 0.5
set hold_time 0.1

set paths {
    {REG_A REG_B 6.5 0.4}
    {REG_B REG_C 9.6 0.2}
    {REG_C REG_D 4.0 0.3}
}

puts "\nClock Period: $clock_period ns"
puts "Clock Uncertainty: $clock_uncertainty ns"

set setup_violations 0
set hold_violations 0

foreach path $paths {
    lassign $path start_point end_point max_delay min_delay

    set setup_required [expr {
        $clock_period - $clock_uncertainty - $setup_time
    }]

    set setup_slack [expr {$setup_required - $max_delay}]
    set hold_slack [expr {$min_delay - $hold_time}]

    puts "\n--------------------------------"
    puts "Start Point: $start_point"
    puts "End Point: $end_point"
    puts "Maximum Delay: $max_delay ns"
    puts "Minimum Delay: $min_delay ns"
    puts "Setup Slack: $setup_slack ns"
    puts "Hold Slack: $hold_slack ns"

    if {$setup_slack < 0} {
        puts "Setup Check: VIOLATION"
        incr setup_violations
    } else {
        puts "Setup Check: PASS"
    }

    if {$hold_slack < 0} {
        puts "Hold Check: VIOLATION"
        incr hold_violations
    } else {
        puts "Hold Check: PASS"
    }
}

puts "\n===== SUMMARY ====="
puts "Setup Violations: $setup_violations"
puts "Hold Violations: $hold_violations"

puts "\n===== ANALYSIS COMPLETED ====="






# Output:
# ===== SETUP AND HOLD ANALYSIS =====

# Clock Period: 10.0 ns
# Clock Uncertainty: 0.2 ns

# --------------------------------
# Start Point: REG_A
# End Point: REG_B
# Maximum Delay: 6.5 ns
# Minimum Delay: 0.4 ns
# Setup Slack: 2.8000000000000007 ns
# Hold Slack: 0.30000000000000004 ns
# Setup Check: PASS
# Hold Check: PASS

# --------------------------------
# Start Point: REG_B
# End Point: REG_C
# Maximum Delay: 9.6 ns
# Minimum Delay: 0.2 ns
# Setup Slack: -0.29999999999999893 ns
# Hold Slack: 0.1 ns
# Setup Check: VIOLATION
# Hold Check: PASS

# --------------------------------
# Start Point: REG_C
# End Point: REG_D
# Maximum Delay: 4.0 ns
# Minimum Delay: 0.3 ns
# Setup Slack: 5.300000000000001 ns
# Hold Slack: 0.19999999999999998 ns
# Setup Check: PASS
# Hold Check: PASS

# ===== SUMMARY =====
# Setup Violations: 1
# Hold Violations: 0

# ===== ANALYSIS COMPLETED =====
