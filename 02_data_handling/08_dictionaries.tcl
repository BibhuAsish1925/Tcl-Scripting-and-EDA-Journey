# Dictionaries store key-value pairs in a single variable.

set module {
    name UART
    protocol Serial
    width 8
    status PASS
}

# dict get retrieves a value using its key.
puts "Module name: [dict get $module name]"
puts "Protocol: [dict get $module protocol]"
puts "Width: [dict get $module width]"

# dict set adds or updates a key-value pair.
dict set module frequency 115200

puts "Frequency: [dict get $module frequency]"

# dict keys returns all keys in the dictionary.
puts "Keys: [dict keys $module]"





# Output:
# Module name: UART
# Protocol: Serial
# Width: 8
# Frequency: 115200
# Keys: name protocol width status frequency