puts "===== PLACEMENT ANALYSIS ====="

# Mock placed-cell data
# Format: name x y width height
set cells {
    {U1 10 10 5 4}
    {U2 20 15 6 4}
    {U3 35 20 8 6}
    {U4 50 30 5 5}
    {U5 65 40 7 5}
}

set total_area 0.0

set min_x 1.0e30
set min_y 1.0e30
set max_x -1.0e30
set max_y -1.0e30

puts "\n1. PLACED CELL INFORMATION"

foreach cell $cells {

    lassign $cell name x y width height

    set area [expr {$width * $height}]
    set total_area [expr {$total_area + $area}]

    set cell_right [expr {$x + $width}]
    set cell_top [expr {$y + $height}]

    if {$x < $min_x} {
        set min_x $x
    }

    if {$y < $min_y} {
        set min_y $y
    }

    if {$cell_right > $max_x} {
        set max_x $cell_right
    }

    if {$cell_top > $max_y} {
        set max_y $cell_top
    }

    puts "$name | X: $x | Y: $y | Area: $area"
}

# Calculate placement bounding box
set bounding_width [expr {$max_x - $min_x}]
set bounding_height [expr {$max_y - $min_y}]

set bounding_area [expr {$bounding_width * $bounding_height}]

puts "\n2. PLACEMENT SUMMARY"
puts "Total Placed Cells: [llength $cells]"
puts "Total Cell Area: $total_area"

puts "\n3. PLACEMENT BOUNDING BOX"
puts "Minimum X: $min_x"
puts "Minimum Y: $min_y"
puts "Maximum X: $max_x"
puts "Maximum Y: $max_y"

puts "Bounding Box Width: $bounding_width"
puts "Bounding Box Height: $bounding_height"
puts "Bounding Box Area: $bounding_area"

puts "\n===== PLACEMENT ANALYSIS COMPLETED ====="







# Output:
# ===== PLACEMENT ANALYSIS =====

# 1. PLACED CELL INFORMATION
# U1 | X: 10 | Y: 10 | Area: 20
# U2 | X: 20 | Y: 15 | Area: 24
# U3 | X: 35 | Y: 20 | Area: 48
# U4 | X: 50 | Y: 30 | Area: 25
# U5 | X: 65 | Y: 40 | Area: 35

# 2. PLACEMENT SUMMARY
# Total Placed Cells: 5
# Total Cell Area: 152.0

# 3. PLACEMENT BOUNDING BOX
# Minimum X: 10
# Minimum Y: 10
# Maximum X: 72
# Maximum Y: 45
# Bounding Box Width: 62
# Bounding Box Height: 35
# Bounding Box Area: 2170

# ===== PLACEMENT ANALYSIS COMPLETED =====