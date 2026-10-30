# Reusable Tcl package: MathUtils

namespace eval ::MathUtils {

    namespace export calculate_area calculate_power

    proc calculate_area {width height} {

        return [expr {$width * $height}]
    }

    proc calculate_power {voltage current} {

        return [expr {$voltage * $current}]
    }
}

# Register the package.
package provide MathUtils 1.0