# Advanced Tcl - apply and recursion

# ------------------------------------------------
# 1. apply: Anonymous procedure
# ------------------------------------------------

set square [apply {{number} {
    return [expr {$number * $number}]
}} 5]

puts "Square of 5: $square"

# Output:
# Square of 5: 25


# ------------------------------------------------
# 2. apply: Calculate chip area
# ------------------------------------------------

set area [apply {{width height} {
    return [expr {$width * $height}]
}} 100 50]

puts "Chip Area: $area"

# Output:
# Chip Area: 5000


# ------------------------------------------------
# 3. Recursive procedure
# ------------------------------------------------

proc factorial {number} {

    if {$number <= 1} {
        return 1
    }

    return [expr {$number * [factorial [expr {$number - 1}]]}]
}

puts "Factorial of 5: [factorial 5]"

# Output:
# Factorial of 5: 120


# ------------------------------------------------
# 4. Recursive summation
# ------------------------------------------------

proc sum_to_n {number} {

    if {$number <= 0} {
        return 0
    }

    return [expr {$number + [sum_to_n [expr {$number - 1}]]}]
}

puts "Sum from 1 to 5: [sum_to_n 5]"







# Output:
# Square of 5: 25
# Chip Area: 5000
# Factorial of 5: 120
# Sum from 1 to 5: 15