proc log_message {level message} {
    set timestamp [clock format [clock seconds] \
        -format "%Y-%m-%d %H:%M:%S"]

    puts "\[$timestamp\] \[$level\] $message"
}

proc calculate_area {width height} {
    if {$width <= 0 || $height <= 0} {
        error "Width and height must be positive"
    }

    return [expr {$width * $height}]
}

puts "===== LOGGING AND DEBUGGING DEMO ====="

log_message INFO "EDA automation started"
log_message INFO "Loading design parameters"

set width 100
set height 80

if {[catch {
    set area [calculate_area $width $height]
} error_message]} {
    log_message ERROR $error_message
} else {
    log_message INFO "Calculated area: $area"
}

log_message DEBUG "Design dimensions: ${width} x ${height}"
log_message INFO "EDA automation completed"

puts "\n===== LOGGING DEMO COMPLETED ====="







# Output:
# ===== LOGGING AND DEBUGGING DEMO =====
# [2026-10-30 17:37:14] [INFO] EDA automation started
# [2026-10-30 17:37:15] [INFO] Loading design parameters
# [2026-10-30 17:37:15] [INFO] Calculated area: 8000
# [2026-10-30 17:37:15] [DEBUG] Design dimensions: 100 x 80
# [2026-10-30 17:37:15] [INFO] EDA automation completed

# ===== LOGGING DEMO COMPLETED =====