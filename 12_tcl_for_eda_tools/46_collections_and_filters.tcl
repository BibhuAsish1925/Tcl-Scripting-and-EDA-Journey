# ==========================================
# PHASE 12 - SCRIPT 46
# COLLECTIONS AND FILTERS
# ==========================================

puts "===== COLLECTIONS AND FILTERS ====="

set cells [list \
    [dict create name U1 type NAND2 area 1.2] \
    [dict create name U2 type NOR2  area 1.0] \
    [dict create name U3 type DFF   area 4.5] \
    [dict create name U4 type INV   area 0.6] \
    [dict create name U5 type DFF   area 4.5] \
]

# 1. Select all cells
puts "\n1. ALL CELLS"

foreach cell $cells {
    puts [dict get $cell name]
}

# 2. Filter DFF cells
puts "\n2. DFF CELLS"

foreach cell $cells {
    if {[dict get $cell type] eq "DFF"} {
        puts "DFF Found: [dict get $cell name]"
    }
}

# 3. Filter cells with area greater than 1.0
puts "\n3. CELLS WITH AREA > 1.0"

foreach cell $cells {
    if {[dict get $cell area] > 1.0} {
        puts "[dict get $cell name] - Area: [dict get $cell area]"
    }
}

# 4. Select cells by name
puts "\n4. SELECT CELL U3"

set target_name "U3"
set found 0

foreach cell $cells {
    if {[dict get $cell name] eq $target_name} {
        puts "Selected: $cell"
        set found 1
    }
}

if {!$found} {
    puts "Cell $target_name not found."
}

puts "\n===== SCRIPT COMPLETED ====="






# Output:
# ===== COLLECTIONS AND FILTERS =====

# 1. ALL CELLS
# U1
# U2
# U3
# U4
# U5

# 2. DFF CELLS
# DFF Found: U3
# DFF Found: U5

# 3. CELLS WITH AREA > 1.0
# U1 - Area: 1.2
# U3 - Area: 4.5
# U5 - Area: 4.5

# 4. SELECT CELL U3
# Selected: name U3 type DFF area 4.5

# ===== SCRIPT COMPLETED =====