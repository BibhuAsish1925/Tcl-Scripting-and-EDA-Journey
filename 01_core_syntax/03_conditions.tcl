# Conditional statements

set temperature 28

# Conditions are enclosed in braces and evaluated by Tcl.
if {$temperature >= 30} {
    puts "Temperature: Hot"
} elseif {$temperature >= 20} {
    puts "Temperature: Moderate"
} else {
    puts "Temperature: Cold"
}





# Output:
# Temperature: Moderate