# File matching using glob

# glob finds files or directories that match a pattern.
set files [glob -nocomplain "*.tcl"]

puts "Tcl files:"
puts $files






# Output:
# Tcl files:
# ...