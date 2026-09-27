# Nested data can represent structured information.

set project [dict create \
    name "UART Controller" \
    language "Verilog" \
    protocols {UART SPI I2C} \
    status "Completed"
]

# Retrieve simple dictionary values.
puts "Project: [dict get $project name]"
puts "Language: [dict get $project language]"

# Retrieve a list stored inside the dictionary.
set protocols [dict get $project protocols]

puts "Protocols: $protocols"
puts "Number of protocols: [llength $protocols]"

# Access an individual item from the nested list.
puts "First protocol: [lindex $protocols 0]"

puts "Status: [dict get $project status]"






# Output:
# Project: UART Controller
# Language: Verilog
# Protocols: UART SPI I2C
# Number of protocols: 3
# First protocol: UART
# Status: Completed