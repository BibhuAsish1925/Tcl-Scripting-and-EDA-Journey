puts "===== DESIGN RULE CHECK ====="

# Example rule limits
set min_spacing 0.10
set min_width 0.08
set max_transition 0.50

# Mock design measurements:
# {object spacing width transition}
set objects {
    {NET_A 0.12 0.10 0.30}
    {NET_B 0.07 0.09 0.40}
    {NET_C 0.15 0.05 0.60}
    {NET_D 0.11 0.12 0.25}
}

set total_violations 0

foreach object $objects {
    lassign $object name spacing width transition

    puts "\nChecking: $name"

    if {$spacing < $min_spacing} {
        puts "  SPACING VIOLATION: $spacing"
        incr total_violations
    } else {
        puts "  Spacing: PASS"
    }

    if {$width < $min_width} {
        puts "  WIDTH VIOLATION: $width"
        incr total_violations
    } else {
        puts "  Width: PASS"
    }

    if {$transition > $max_transition} {
        puts "  TRANSITION VIOLATION: $transition"
        incr total_violations
    } else {
        puts "  Transition: PASS"
    }
}

puts "\n===== DRC SUMMARY ====="
puts "Objects Checked: [llength $objects]"
puts "Total Example Violations: $total_violations"

if {$total_violations == 0} {
    puts "Overall Status: CLEAN"
} else {
    puts "Overall Status: NEEDS REVIEW"
}

puts "\n===== DRC COMPLETED ====="







# Output:
# ===== DESIGN RULE CHECK =====

# Checking: NET_A
#   Spacing: PASS
#   Width: PASS
#   Transition: PASS

# Checking: NET_B
#   SPACING VIOLATION: 0.07
#   Width: PASS
#   Transition: PASS

# Checking: NET_C
#   Spacing: PASS
#   WIDTH VIOLATION: 0.05
#   TRANSITION VIOLATION: 0.60

# Checking: NET_D
#   Spacing: PASS
#   Width: PASS
#   Transition: PASS

# ===== DRC SUMMARY =====
# Objects Checked: 4
# Total Example Violations: 3
# Overall Status: NEEDS REVIEW

# ===== DRC COMPLETED =====