# Package loading demonstration

# Add the package directory to Tcl's package search path.
lappend auto_path [file dirname [info script]]

# Load the package.
package require MathUtils 1.0

puts "MathUtils Package Loaded"

# Import exported commands into the current namespace.
namespace import ::MathUtils::*

set area [calculate_area 20 10]

set power [calculate_power 5 2]

puts "Calculated Area: $area"
puts "Calculated Power: $power"






# Output:
# MathUtils Package Loaded
# Calculated Area: 200
# Calculated Power: 10