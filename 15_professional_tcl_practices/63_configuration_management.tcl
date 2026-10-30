puts "===== CONFIGURATION MANAGEMENT ====="

proc load_config {filename} {
    if {![file exists $filename]} {
        error "Configuration file not found: $filename"
    }

    set config [dict create]
    set file_id [open $filename r]

    try {
        while {[gets $file_id line] >= 0} {
            set line [string trim $line]

            if {$line eq "" || [string index $line 0] eq "#"} {
                continue
            }

            if {![regexp {^([^=]+)=(.*)$} $line -> key value]} {
                error "Invalid configuration line: $line"
            }

            set key [string trim $key]
            set value [string trim $value]

            dict set config $key $value
        }
    } finally {
        close $file_id
    }

    return $config
}

set config_file [file join [file dirname [info script]] \
    config design_config.txt]

if {[catch {
    set design_config [load_config $config_file]
} error_message]} {
    puts "ERROR: $error_message"
    exit 1
}

puts "\nLOADED DESIGN CONFIGURATION"

dict for {key value} $design_config {
    puts "$key = $value"
}

puts "\nDesign Name: [dict get $design_config DESIGN_NAME]"
puts "Clock Period: [dict get $design_config CLOCK_PERIOD] ns"
puts "Supply Voltage: [dict get $design_config SUPPLY_VOLTAGE] V"

puts "\n===== CONFIGURATION LOADED ====="







# Output:
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

