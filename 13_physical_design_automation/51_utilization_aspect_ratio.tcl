# ==========================================
# PHASE 13 - SCRIPT 51
# UTILIZATION AND ASPECT RATIO
# ==========================================

puts "===== UTILIZATION AND ASPECT RATIO ====="

# Design information
set cell_area 6000.0
set core_width 120.0
set core_height 100.0

# Calculate core area
set core_area [expr {$core_width * $core_height}]

# Calculate utilization
set utilization [expr {($cell_area / $core_area) * 100.0}]

# Calculate aspect ratio
set aspect_ratio [expr {$core_width / $core_height}]

puts "\n1. DESIGN PARAMETERS"
puts "Standard Cell Area: $cell_area"
puts "Core Width: $core_width"
puts "Core Height: $core_height"

puts "\n2. CALCULATED RESULTS"
puts "Core Area: [format %.2f $core_area]"
puts "Utilization: [format %.2f $utilization]%"
puts "Aspect Ratio: [format %.2f $aspect_ratio]"

# Simple utilization classification
puts "\n3. UTILIZATION ANALYSIS"

if {$utilization < 50.0} {
    puts "Utilization Level: LOW"
} elseif {$utilization <= 70.0} {
    puts "Utilization Level: MODERATE"
} elseif {$utilization <= 85.0} {
    puts "Utilization Level: HIGH"
} else {
    puts "Utilization Level: VERY HIGH"
}

puts "\n===== ANALYSIS COMPLETED ====="







# Output:
# ===== UTILIZATION AND ASPECT RATIO =====

# 1. DESIGN PARAMETERS
# Standard Cell Area: 6000.0
# Core Width: 120.0
# Core Height: 100.0

# 2. CALCULATED RESULTS
# Core Area: 12000.00
# Utilization: 50.00%
# Aspect Ratio: 1.20

# 3. UTILIZATION ANALYSIS
# Utilization Level: MODERATE

# ===== ANALYSIS COMPLETED =====