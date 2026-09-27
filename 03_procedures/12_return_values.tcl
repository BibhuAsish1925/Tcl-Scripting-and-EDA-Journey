# Procedures with return values

# return sends a value back to the caller.
proc add_numbers {a b} {
    return [expr {$a + $b}]
}

# Store the value returned by the procedure.
set result [add_numbers 20 15]

puts "Result: $result"







# Output:
# Result: 35