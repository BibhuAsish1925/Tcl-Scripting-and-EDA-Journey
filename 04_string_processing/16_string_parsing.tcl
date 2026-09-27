# String parsing

set data "UART,115200,PASS"

# split divides a string into a list using the specified separator.
set fields [split $data ","]

puts "Protocol: [lindex $fields 0]"
puts "Baud Rate: [lindex $fields 1]"
puts "Status: [lindex $fields 2]"






# Output:
# Protocol: UART
# Baud Rate: 115200
# Status: PASS