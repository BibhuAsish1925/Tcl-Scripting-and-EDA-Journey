# ==========================================
# PHASE 11 - VARIABLE SCOPE AND TRACE
# Topics: upvar, uplevel, trace
# ==========================================

puts "===== VARIABLE SCOPE AND TRACE DEMO ====="

# ------------------------------------------
# 1. Demonstrate upvar
# ------------------------------------------

proc update_global_variable {} {
    upvar #0 chip_area area
    set area 5000
    puts "Inside procedure - Chip Area: $area"
}

set chip_area 0

puts "\n1. UPVAR DEMONSTRATION"
puts "Before procedure call: $chip_area"

update_global_variable

puts "After procedure call: $chip_area"


# ------------------------------------------
# 2. Demonstrate uplevel
# ------------------------------------------

proc execute_in_caller_scope {} {
    puts "\n2. UPLEVEL DEMONSTRATION"
    uplevel 1 {
        set design_name "ALU_Design"
        puts "Design Name set in caller scope: $design_name"
    }
}

execute_in_caller_scope
puts "Design Name in global scope: $design_name"


# ------------------------------------------
# 3. Demonstrate variable tracing
# ------------------------------------------

proc variable_changed {name1 name2 operation} {
    upvar #0 $name1 monitored_variable
    puts "TRACE: Variable '$name1' changed to '$monitored_variable'"
}

puts "\n3. VARIABLE TRACE DEMONSTRATION"

set clock_period 10

trace add variable clock_period write variable_changed

puts "Initial Clock Period: $clock_period"

set clock_period 8
set clock_period 5

trace remove variable clock_period write variable_changed

puts "Final Clock Period: $clock_period"

puts "\n===== DEMONSTRATION COMPLETED ====="





# Output:
# ===== VARIABLE SCOPE AND TRACE DEMO =====

# 1. UPVAR DEMONSTRATION
# Before procedure call: 0
# Inside procedure - Chip Area: 5000
# After procedure call: 5000

# 2. UPLEVEL DEMONSTRATION
# Design Name set in caller scope: ALU_Design
# Design Name in global scope: ALU_Design

# 3. VARIABLE TRACE DEMONSTRATION
# Initial Clock Period: 10
# TRACE: Variable 'clock_period' changed to '8'
# TRACE: Variable 'clock_period' changed to '5'
# Final Clock Period: 5

# ===== DEMONSTRATION COMPLETED =====