# Basic arithmetic and expressions

set a 20
set b 6

# expr evaluates the arithmetic expression; [ ] performs command substitution.
set sum [expr {$a + $b}]
set difference [expr {$a - $b}]
set product [expr {$a * $b}]
set quotient [expr {$a / $b}]
set remainder [expr {$a % $b}]

puts "A = $a"
puts "B = $b"
puts "Sum        : $sum"
puts "Difference : $difference"
puts "Product    : $product"
puts "Quotient   : $quotient"
puts "Remainder  : $remainder"




# Output:
# A = 20
# B = 6
# Sum        : 26
# Difference : 14
# Product    : 120
# Quotient   : 3
# Remainder  : 2