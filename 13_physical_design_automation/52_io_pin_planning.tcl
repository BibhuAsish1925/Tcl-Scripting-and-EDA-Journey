puts "===== I/O PIN PLANNING ====="

# Die dimensions
set die_width 200.0
set die_height 150.0

# Define I/O ports
set ports {
    clk
    rst
    data_in
    enable
    data_out
    ready
}

# Assign ports to die edges
set pin_edges {
    left
    left
    bottom
    bottom
    right
    right
}

# Validate list lengths
if {[llength $ports] != [llength $pin_edges]} {
    error "Port and edge lists must have equal lengths."
}

# Track pin positions independently on each edge
array set edge_count {
    left 0
    right 0
    top 0
    bottom 0
}

puts "\n1. DIE INFORMATION"
puts "Die Width: $die_width"
puts "Die Height: $die_height"

puts "\n2. PIN ASSIGNMENTS"

foreach port $ports edge $pin_edges {

    incr edge_count($edge)

    set position $edge_count($edge)

    switch -- $edge {
        left {
            set x 0.0
            set y [expr {$die_height * $position / 3.0}]
        }
        right {
            set x $die_width
            set y [expr {$die_height * $position / 3.0}]
        }
        bottom {
            set x [expr {$die_width * $position / 3.0}]
            set y 0.0
        }
        top {
            set x [expr {$die_width * $position / 3.0}]
            set y $die_height
        }
    }

    puts "Port: $port | Edge: $edge | X: [format %.2f $x] | Y: [format %.2f $y]"
}

puts "\n3. PIN SUMMARY"

foreach edge {left right top bottom} {
    puts "$edge edge: $edge_count($edge) pins"
}

puts "\n===== PIN PLANNING COMPLETED ====="







# Output:
# ===== I/O PIN PLANNING =====

# 1. DIE INFORMATION
# Die Width: 200.0
# Die Height: 150.0

# 2. PIN ASSIGNMENTS
# Port: clk | Edge: left | X: 0.00 | Y: 50.00
# Port: rst | Edge: left | X: 0.00 | Y: 100.00
# Port: data_in | Edge: bottom | X: 66.67 | Y: 0.00
# Port: enable | Edge: bottom | X: 133.33 | Y: 0.00
# Port: data_out | Edge: right | X: 200.00 | Y: 50.00
# Port: ready | Edge: right | X: 200.00 | Y: 100.00

# 3. PIN SUMMARY
# left edge: 2 pins
# right edge: 2 pins
# top edge: 0 pins
# bottom edge: 2 pins

# ===== PIN PLANNING COMPLETED =====