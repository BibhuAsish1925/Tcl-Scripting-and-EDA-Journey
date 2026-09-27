# Basic Tcl list operations

set tools {Tcl Verilog Python Git}

puts "Tools: $tools"

# llength returns the number of elements in a list.
puts "Number of tools: [llength $tools]"

# lindex accesses a list element using its index; Tcl indexes start from 0.
puts "First tool: [lindex $tools 0]"

# "end" refers to the last element of the list.
puts "Last tool: [lindex $tools end]"

# lappend adds a new element to an existing list.
lappend tools Linux

puts "After adding Linux:"
puts $tools





# Output:
# Tools: Tcl Verilog Python Git
# Number of tools: 4
# First tool: Tcl
# Last tool: Git
# After adding Linux:
# Tcl Verilog Python Git Linux