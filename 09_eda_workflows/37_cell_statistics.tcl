# Cell statistics analyzer
# 1st created a sample cells.rpt for test

set filename "09_eda_workflows/cells.rpt"

set total_cells 0
set cell_count 0

set file [open $filename r]

# Read each cell type and its count.
while {[gets $file line] >= 0} {

    set fields [split $line]

    set cell_type [lindex $fields 0]
    set count [lindex $fields 1]

    puts "$cell_type : $count"

    incr total_cells $count
    incr cell_count
}

close $file

puts "----------------"
puts "Cell types: $cell_count"
puts "Total cells: $total_cells"







# Output:
# INV_X1 : 120
# NAND2_X1 : 80
# NOR2_X1 : 60
# DFF_X1 : 40
# BUF_X1 : 100
# ----------------
# Cell types: 5
# Total cells: 400