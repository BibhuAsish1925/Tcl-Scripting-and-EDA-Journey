
# ==========================================
# EDA UTILITY LIBRARY
# ==========================================

namespace eval ::EDAUtils {
    namespace export calculate_area calculate_utilization

    proc calculate_area {width height} {
        if {$width <= 0 || $height <= 0} {
            error "Dimensions must be positive"
        }

        return [expr {$width * $height}]
    }

    proc calculate_utilization {cell_area core_area} {
        if {$cell_area < 0 || $core_area <= 0} {
            error "Invalid area values"
        }

        return [expr {
            double($cell_area) / $core_area * 100.0
        }]
    }
}
