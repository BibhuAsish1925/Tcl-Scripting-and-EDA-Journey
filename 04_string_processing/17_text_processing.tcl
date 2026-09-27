# Basic text processing

set text "ERROR: UART communication failed"

# string first finds the position of a substring.
set position [string first "UART" $text]

puts "UART position: $position"

# string match checks whether text matches a pattern.
if {[string match "ERROR:*" $text]} {
    puts "Error message detected"
}

# string map replaces specified text.
set updated [string map {"ERROR:" "WARNING:"} $text]

puts "Updated text: $updated"






# Output:
# UART position: 7
# Error message detected
# Updated text: WARNING: UART communication failed