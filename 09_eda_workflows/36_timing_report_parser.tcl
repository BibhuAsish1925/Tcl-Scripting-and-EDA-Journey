# Simple timing report parser
# 1st created a sample timing.rpt for test

set filename "09_eda_workflows/timing.rpt"

set wns 0
set tns 0
set violations 0

set file [open $filename r]

# Read and extract timing information.
while {[gets $file line] >= 0} {

    if {[regexp {WNS:\s+(-?[0-9.]+)} $line -> value]} {
        set wns $value
    }

    if {[regexp {TNS:\s+(-?[0-9.]+)} $line -> value]} {
        set tns $value
    }

    if {[regexp {VIOLATIONS:\s+([0-9]+)} $line -> value]} {
        set violations $value
    }
}

close $file

puts "Timing Report"
puts "-------------"
puts "WNS: $wns"
puts "TNS: $tns"
puts "Violations: $violations"

# Check timing status.
if {$wns < 0 || $violations > 0} {
    puts "Timing Status: FAIL"
} else {
    puts "Timing Status: PASS"
}






# Output:
# Timing Report
# -------------
# WNS: -0.25
# TNS: -10.40
# Violations: 3
# Timing Status: FAIL