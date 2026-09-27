# Basic Tcl list operations

set tools {Tcl Verilog Python Git}

puts "Tools: $tools"
puts "Number of tools: [llength $tools]"

puts "First tool: [lindex $tools 0]"
puts "Last tool: [lindex $tools end]"

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