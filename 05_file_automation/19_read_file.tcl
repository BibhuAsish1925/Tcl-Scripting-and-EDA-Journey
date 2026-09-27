# Reading a file
# 1st created a sample file input.txt in folder
set filename "05_file_automation/input.txt"

# Open the file in read mode.
set file [open $filename r]

# read retrieves the complete file contents.
set data [read $file]

close $file

puts "File contents:"
puts $data






# Output:
# File contents:
# UART PASS
# SPI PASS
# I2C FAIL