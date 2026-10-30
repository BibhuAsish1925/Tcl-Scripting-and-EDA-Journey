# ==========================================
# PHASE 12 - SCRIPT 47
# DESIGN ATTRIBUTES
# ==========================================

puts "===== DESIGN ATTRIBUTES ====="

# Create a mock cell object
set cell [dict create \
    name U10 \
    type DFF \
    area 4.5 \
    status placed \
]

# Read attributes
puts "\n1. READ ATTRIBUTES"

puts "Cell Name: [dict get $cell name]"
puts "Cell Type: [dict get $cell type]"
puts "Cell Area: [dict get $cell area]"
puts "Placement Status: [dict get $cell status]"

# Modify an attribute
puts "\n2. MODIFY ATTRIBUTE"

dict set cell status legalized

puts "Updated Status: [dict get $cell status]"

# Add a new attribute
puts "\n3. ADD NEW ATTRIBUTE"

dict set cell clock_domain CLK_MAIN

puts "Clock Domain: [dict get $cell clock_domain]"

# Display complete object
puts "\n4. COMPLETE CELL DATA"

puts $cell

puts "\n===== SCRIPT COMPLETED ====="







# Output:
# ===== DESIGN ATTRIBUTES =====

# 1. READ ATTRIBUTES
# Cell Name: U10
# Cell Type: DFF
# Cell Area: 4.5
# Placement Status: placed

# 2. MODIFY ATTRIBUTE
# Updated Status: legalized

# 3. ADD NEW ATTRIBUTE
# Clock Domain: CLK_MAIN

# 4. COMPLETE CELL DATA
# name U10 type DFF area 4.5 status legalized clock_domain CLK_MAIN

# ===== SCRIPT COMPLETED =====