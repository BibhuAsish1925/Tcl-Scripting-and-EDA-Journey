# Advanced Tcl - Namespaces

# Create a namespace for EDA utilities.
namespace eval ::EDA {

    variable tool_name "OpenROAD"
    variable version "1.0"

    # Procedure inside the namespace.
    proc display_info {} {

        variable tool_name
        variable version

        puts "EDA Tool: $tool_name"
        puts "Version: $version"
    }

    # Another procedure inside the namespace.
    proc calculate_area {width height} {

        set area [expr {$width * $height}]

        return $area
    }
}

# Access namespace variables and procedures.
puts "Namespace: [namespace current]"

::EDA::display_info

set chip_area [::EDA::calculate_area 100 50]

puts "Chip Area: $chip_area"

# List available commands in the namespace.
puts "Namespace commands: [info commands ::EDA::*]"






# Output:
# Namespace: ::
# EDA Tool: OpenROAD
# Version: 1.0
# Chip Area: 5000
# Namespace commands: ::EDA::calculate_area ::EDA::display_info