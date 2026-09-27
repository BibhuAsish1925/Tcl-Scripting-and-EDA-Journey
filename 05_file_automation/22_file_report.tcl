# Generate a simple file report

set filename "modules.txt"

set modules {ALU FIFO UART SPI I2C}

# Open the file for writing.
set file [open $filename w]

# Write each module into the file.
foreach module $modules {
    puts $file $module
}

close $file

# Read the generated file.
set file [open $filename r]
set data [read $file]
close $file

puts "Module Report:"
puts $data






# Output:
# Module Report:
# ALU
# FIFO
# UART
# SPI
# I2C