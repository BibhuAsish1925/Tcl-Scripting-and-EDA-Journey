
# ==========================================
# PHASE 14 - SCRIPT 58
# POWER ESTIMATION
# ==========================================

puts "===== POWER ESTIMATION ====="

# Example design parameters
set switching_activity 0.20
set capacitance 2.5e-9
set voltage 1.0
set frequency 500e6
set leakage_power 0.002

# Dynamic power = activity * capacitance * voltage^2 * frequency
set dynamic_power [expr {
    $switching_activity * $capacitance *
    $voltage * $voltage * $frequency
}]

set total_power [expr {$dynamic_power + $leakage_power}]

# Convert watts to milliwatts
set dynamic_mw [expr {$dynamic_power * 1000.0}]
set leakage_mw [expr {$leakage_power * 1000.0}]
set total_mw [expr {$total_power * 1000.0}]

puts "\nDESIGN PARAMETERS"
puts "Switching Activity: $switching_activity"
puts "Capacitance: $capacitance F"
puts "Supply Voltage: $voltage V"
puts "Frequency: $frequency Hz"

puts "\nPOWER RESULTS"
puts [format "Dynamic Power: %.3f mW" $dynamic_mw]
puts [format "Leakage Power: %.3f mW" $leakage_mw]
puts [format "Total Power: %.3f mW" $total_mw]

puts "\n===== POWER ESTIMATION COMPLETED ====="







# Output:
# ===== POWER ESTIMATION =====

# DESIGN PARAMETERS
# Switching Activity: 0.20
# Capacitance: 2.5e-9 F
# Supply Voltage: 1.0 V
# Frequency: 500e6 Hz

# POWER RESULTS
# Dynamic Power: 250.000 mW
# Leakage Power: 2.000 mW
# Total Power: 252.000 mW

# ===== POWER ESTIMATION COMPLETED =====