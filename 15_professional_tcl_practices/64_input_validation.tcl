puts "===== INPUT VALIDATION DEMO ====="

proc validate_number {name value minimum maximum} {
    if {![string is double -strict $value]} {
        error "$name must be a numeric value"
    }

    if {$value < $minimum || $value > $maximum} {
        error "$name must be between $minimum and $maximum"
    }

    puts "PASS: $name = $value"
}

proc validate_design_name {name} {
    if {![regexp {^[A-Za-z][A-Za-z0-9_]*$} $name]} {
        error "Invalid design name: $name"
    }

    puts "PASS: Design name = $name"
}

set design_name "EDA_TOP"
set clock_period 10.0
set voltage 1.0
set utilization 0.70

puts "\nVALIDATING DESIGN PARAMETERS"

set checks {
    {validate_design_name EDA_TOP}
    {validate_number CLOCK_PERIOD 10.0 0.1 100.0}
    {validate_number SUPPLY_VOLTAGE 1.0 0.1 5.0}
    {validate_number UTILIZATION 0.70 0.0 1.0}
}

set failures 0

foreach check $checks {
    if {[catch {uplevel #0 $check} message]} {
        puts "FAIL: $message"
        incr failures
    }
}

puts "\nVALIDATION SUMMARY"
puts "Total Checks: [llength $checks]"
puts "Failed Checks: $failures"

if {$failures == 0} {
    puts "Validation Status: PASS"
} else {
    puts "Validation Status: NEEDS REVIEW"
}

puts "\n===== VALIDATION COMPLETED ====="






# Output:
# ===== INPUT VALIDATION DEMO =====

# VALIDATING DESIGN PARAMETERS
# PASS: Design name = EDA_TOP
# PASS: CLOCK_PERIOD = 10.0
# PASS: SUPPLY_VOLTAGE = 1.0
# PASS: UTILIZATION = 0.70

# VALIDATION SUMMARY
# Total Checks: 4
# Failed Checks: 0
# Validation Status: PASS

# ===== VALIDATION COMPLETED =====