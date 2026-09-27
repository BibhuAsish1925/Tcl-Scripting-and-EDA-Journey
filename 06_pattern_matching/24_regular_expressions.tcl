# Basic regular expression matching

set text "UART PASS"

# regexp checks whether a regular expression matches the text.
if {[regexp {UART} $text]} {
    puts "UART found"
}

# Extract a word using a regular expression.
regexp {([A-Z]+) ([A-Z]+)} $text -> protocol status

puts "Protocol: $protocol"
puts "Status: $status"






# Output:
# UART found
# Protocol: UART
# Status: PASS