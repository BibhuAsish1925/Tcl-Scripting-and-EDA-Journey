# Writing multiple lines to a file

set filename "report.txt"

set file [open $filename w]

# puts can write text directly into an opened file.
puts $file "Tcl Automation Report"
puts $file "---------------------"
puts $file "UART : PASS"
puts $file "SPI  : PASS"
puts $file "I2C  : FAIL"

close $file

puts "Report written to: $filename"






# Output:
# Report written to: report.txt