puts "===== DESIGN OBJECTS DEMONSTRATION ====="

# Mock standard-cell data
set cells [list \
    [dict create name U1 type NAND2 area 1.2] \
    [dict create name U2 type NOR2  area 1.0] \
    [dict create name U3 type DFF   area 4.5] \
    [dict create name U4 type INV   area 0.6] \
]

# Mock input and output ports
set ports [list \
    [dict create name clk direction input] \
    [dict create name rst direction input] \
    [dict create name data_in direction input] \
    [dict create name data_out direction output] \
]

# Display cell objects
puts "\n1. STANDARD CELLS"

foreach cell $cells {
    puts "Cell: [dict get $cell name]"
    puts "  Type: [dict get $cell type]"
    puts "  Area: [dict get $cell area]"
}

# Display port objects
puts "\n2. DESIGN PORTS"

foreach port $ports {
    puts "Port: [dict get $port name]"
    puts "  Direction: [dict get $port direction]"
}

# Count design objects
puts "\n3. DESIGN SUMMARY"

puts "Total Cells: [llength $cells]"
puts "Total Ports: [llength $ports]"

puts "\n===== SCRIPT COMPLETED ====="







# Output:
# ===== DESIGN OBJECTS DEMONSTRATION =====

# 1. STANDARD CELLS
# Cell: U1
#   Type: NAND2
#   Area: 1.2
# Cell: U2
#   Type: NOR2
#   Area: 1.0
# Cell: U3
#   Type: DFF
#   Area: 4.5
# Cell: U4
#   Type: INV
#   Area: 0.6

# 2. DESIGN PORTS
# Port: clk
#   Direction: input
# Port: rst
#   Direction: input
# Port: data_in
#   Direction: input
# Port: data_out
#   Direction: output

# 3. DESIGN SUMMARY
# Total Cells: 4
# Total Ports: 4

# ===== SCRIPT COMPLETED =====