# Advanced Tcl list operations

set modules {ALU FIFO UART SPI I2C}

# llength returns the number of elements in the list.
puts "Number of modules: [llength $modules]"

# lindex retrieves an element using its index.
puts "Module at index 2: [lindex $modules 2]"

# lrange extracts a range of elements from a list.
puts "First three modules: [lrange $modules 0 2]"

# lsearch returns the index of a matching element.
puts "Index of SPI: [lsearch $modules SPI]"

# linsert inserts an element at a specified index.
set modules [linsert $modules 2 GPIO]
puts "After insertion: $modules"

# lreplace replaces one or more elements.
set modules [lreplace $modules 0 0 CPU]
puts "After replacement: $modules"

# lsort returns a sorted version of the list.
puts "Sorted modules: [lsort $modules]"





# Output:
# Number of modules: 5
# Module at index 2: UART
# First three modules: ALU FIFO UART
# Index of SPI: 3
# After insertion: ALU FIFO GPIO UART SPI I2C
# After replacement: CPU FIFO GPIO UART SPI I2C
# Sorted modules: CPU FIFO GPIO I2C SPI UART