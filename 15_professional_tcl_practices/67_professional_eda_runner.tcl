set script_dir [file dirname [file normalize [info script]]]

set log_path [file join $script_dir phase15_execution.log]
set log_id [open $log_path w]

proc write_log {channel level message} {
    set timestamp [clock format [clock seconds] \
        -format "%Y-%m-%d %H:%M:%S"]

    set line "\[$timestamp\] \[$level\] $message"

    puts $line
    puts $channel $line
    flush $channel
}

write_log $log_id INFO "Professional EDA automation started"

set scripts {
    62_logging_and_debugging.tcl
    63_configuration_management.tcl
    64_input_validation.tcl
    65_reusable_tcl_library.tcl
    66_tcl_testing_framework.tcl
}

set passed 0
set failed 0

foreach script $scripts {
    set script_path [file join $script_dir $script]

    write_log $log_id INFO "Starting $script"

    if {![file exists $script_path]} {
        write_log $log_id ERROR "Script not found: $script"
        incr failed
        continue
    }

    set command [list [info nameofexecutable] $script_path]

    if {[catch {exec {*}$command 2>@1} output]} {
        write_log $log_id ERROR "$script failed"
        puts $output
        incr failed
    } else {
        write_log $log_id INFO "$script completed successfully"
        puts $output
        incr passed
    }
}

write_log $log_id INFO "Successful scripts: $passed"
write_log $log_id INFO "Failed scripts: $failed"

if {$failed == 0} {
    write_log $log_id INFO "OVERALL STATUS: PASS"
} else {
    write_log $log_id ERROR "OVERALL STATUS: NEEDS REVIEW"
}

write_log $log_id INFO "Professional EDA automation completed"

close $log_id

puts "\nExecution log saved to:"
puts $log_path







# Output:
# [2026-10-30 17:44:33] [INFO] Professional EDA automation started
# [2026-10-30 17:44:34] [INFO] Starting 62_logging_and_debugging.tcl
# [2026-10-30 17:44:34] [INFO] 62_logging_and_debugging.tcl completed successfully
# ===== LOGGING AND DEBUGGING DEMO =====
# [2026-10-30 17:44:34] [INFO] EDA automation started
# [2026-10-30 17:44:34] [INFO] Loading design parameters
# [2026-10-30 17:44:34] [INFO] Calculated area: 8000
# [2026-10-30 17:44:34] [DEBUG] Design dimensions: 100 x 80
# [2026-10-30 17:44:34] [INFO] EDA automation completed

# ===== LOGGING DEMO COMPLETED =====
# [2026-10-30 17:44:34] [INFO] Starting 63_configuration_management.tcl
# [2026-10-30 17:44:34] [INFO] 63_configuration_management.tcl completed successfully
# ===== CONFIGURATION MANAGEMENT =====

# LOADED DESIGN CONFIGURATION
# DESIGN_NAME = EDA_TOP
# CLOCK_PERIOD = 10.0
# SUPPLY_VOLTAGE = 1.0
# TARGET_UTILIZATION = 0.70
# MAX_AREA = 10000

# Design Name: EDA_TOP
# Clock Period: 10.0 ns
# Supply Voltage: 1.0 V

# ===== CONFIGURATION LOADED =====
# [2026-10-30 17:44:34] [INFO] Starting 64_input_validation.tcl
# [2026-10-30 17:44:34] [INFO] 64_input_validation.tcl completed successfully
# ===== INPUT VALIDATION DEMO =====

# VALIDATING DESIGN PARAMETERS
# PASS: Design name = EDA_TOP
# PASS: CLOCK_PERIOD = 10.0
# PASS: SUPPLY_VOLTAGE = 1.0
# PASS: UTILIZATION = 0.70

# VALIDATION SUMMARY
# Total Checks: 4
# Failed Checks: 0
# Validation Status: PASS

# ===== VALIDATION COMPLETED =====
# [2026-10-30 17:44:34] [INFO] Starting 65_reusable_tcl_library.tcl
# [2026-10-30 17:44:34] [INFO] 65_reusable_tcl_library.tcl completed successfully
# ===== REUSABLE TCL LIBRARY DEMO =====

# DESIGN INFORMATION
# Core Width: 100
# Core Height: 80
# Core Area: 8000

# UTILIZATION
# Cell Area: 5000.00
# Core Utilization: 62.50%

# ===== LIBRARY DEMO COMPLETED =====
# [2026-10-30 17:44:34] [INFO] Starting 66_tcl_testing_framework.tcl
# [2026-10-30 17:44:34] [INFO] 66_tcl_testing_framework.tcl completed successfully
# ===== TCL TESTING FRAMEWORK =====

# RUNNING TEST CASES
# PASS: Addition test
# PASS: Area test
# PASS: Slack test
# PASS: Zero test

# ===== TEST SUMMARY =====
# Total Tests: 4
# Passed: 4
# Failed: 0
# Testing Status: ALL TESTS PASSED

# ===== TESTING COMPLETED =====
# [2026-10-30 17:44:34] [INFO] Successful scripts: 5
# [2026-10-30 17:44:34] [INFO] Failed scripts: 0
# [2026-10-30 17:44:34] [INFO] OVERALL STATUS: PASS
# [2026-10-30 17:44:34] [INFO] Professional EDA automation completed

# Execution log saved to:
# D:/Downloads/GitHub/TCL-Learning/Tcl-Scripting Journey/15_professional_tcl_practices/phase15_execution.log