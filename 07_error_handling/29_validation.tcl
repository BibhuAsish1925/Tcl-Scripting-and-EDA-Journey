# Basic input validation

set module "UART"
set status "PASS"

# Validate that the module name is not empty.
if {$module eq ""} {
    puts "Error: Module name is empty"
} else {
    puts "Module: $module"
}

# Validate the status value.
if {$status ni {PASS FAIL}} {
    puts "Error: Invalid status"
} else {
    puts "Status: $status"
}







# Output:
# Module: UART
# Status: PASS