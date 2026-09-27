# EDA log analyzer
# 1st created a file sample.log for test

set filename "09_eda_workflows/sample.log"

set pass_count 0
set fail_count 0
set warning_count 0
set error_count 0

set file [open $filename r]

# Process the log one line at a time.
while {[gets $file line] >= 0} {

    if {[regexp {PASS:} $line]} {
        incr pass_count
    } elseif {[regexp {FAIL:} $line]} {
        incr fail_count
    } elseif {[regexp {WARNING:} $line]} {
        incr warning_count
    } elseif {[regexp {ERROR:} $line]} {
        incr error_count
    }
}

close $file

puts "EDA Log Analysis"
puts "----------------"
puts "PASS: $pass_count"
puts "FAIL: $fail_count"
puts "WARNING: $warning_count"
puts "ERROR: $error_count"






# Output:
# EDA Log Analysis
# ----------------
# PASS: 2
# FAIL: 0
# WARNING: 1
# ERROR: 1