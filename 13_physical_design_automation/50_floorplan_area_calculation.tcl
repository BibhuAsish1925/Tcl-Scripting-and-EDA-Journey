puts "===== FLOORPLAN AREA CALCULATION ====="

# Design parameters
set design_name "ALU_DESIGN"
set total_cell_area 5000.0
set target_utilization 0.65
set aspect_ratio 1.0

# Calculate required core area
set core_area [expr {$total_cell_area / $target_utilization}]

# Calculate core dimensions
set core_width [expr {sqrt($core_area * $aspect_ratio)}]
set core_height [expr {$core_area / $core_width}]

# Define core-to-die margin
set margin 10.0

# Calculate die dimensions
set die_width [expr {$core_width + 2 * $margin}]
set die_height [expr {$core_height + 2 * $margin}]

set die_area [expr {$die_width * $die_height}]

# Display results
puts "\n1. DESIGN INFORMATION"
puts "Design Name: $design_name"
puts "Total Cell Area: $total_cell_area"

puts "\n2. FLOORPLAN PARAMETERS"
puts "Target Utilization: [expr {$target_utilization * 100}]%"
puts "Aspect Ratio: $aspect_ratio"
puts "Core Area: [format %.2f $core_area]"

puts "\n3. CORE DIMENSIONS"
puts "Core Width: [format %.2f $core_width]"
puts "Core Height: [format %.2f $core_height]"

puts "\n4. DIE DIMENSIONS"
puts "Die Width: [format %.2f $die_width]"
puts "Die Height: [format %.2f $die_height]"
puts "Die Area: [format %.2f $die_area]"

puts "\n===== FLOORPLAN COMPLETED ====="






# Output:
# ===== FLOORPLAN AREA CALCULATION =====

# 1. DESIGN INFORMATION
# Design Name: ALU_DESIGN
# Total Cell Area: 5000.0

# 2. FLOORPLAN PARAMETERS
# Target Utilization: 65.0%
# Aspect Ratio: 1.0
# Core Area: 7692.31

# 3. CORE DIMENSIONS
# Core Width: 87.71
# Core Height: 87.71

# 4. DIE DIMENSIONS
# Die Width: 107.71
# Die Height: 107.71
# Die Area: 11600.54

# ===== FLOORPLAN COMPLETED =====