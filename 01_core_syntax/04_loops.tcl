# For and while loops

puts "For loop:"

# for uses initialization, condition, and update in one statement.
for {set i 1} {$i <= 5} {incr i} {
    puts "Count: $i"
}

puts ""
puts "While loop:"

set j 1

# while repeats the block as long as the condition remains true.
while {$j <= 5} {
    puts "Count: $j"

    # incr increases the loop counter by 1.
    incr j
}





# Output:
# For loop:
# Count: 1
# Count: 2
# Count: 3
# Count: 4
# Count: 5

# While loop:
# Count: 1
# Count: 2
# Count: 3
# Count: 4
# Count: 5