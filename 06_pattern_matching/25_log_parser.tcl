# Simple log parser
# 1st created a test.log in the folder to test
set filename "06_pattern_matching/test.log"

set file [open $filename r]

# Process the file one line at a time.
while {[gets $file line] >= 0} {

    # Check whether the line contains ERROR.
    if {[regexp {ERROR:} $line]} {
        puts "Error found: $line"
    }
}

close $file







# Output:
# Error found: ERROR: SPI communication failed