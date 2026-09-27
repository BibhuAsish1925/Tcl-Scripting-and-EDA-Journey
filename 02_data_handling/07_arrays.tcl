# Tcl arrays store data using named keys.

array set module_status {
    ALU  PASS
    FIFO PASS
    UART FAIL
    SPI  PASS
}

# Access an array element using its key.
puts "UART status: $module_status(UART)"

# array names returns all keys in the array.
puts "Modules: [array names module_status]"

# Check whether a particular key exists.
puts "SPI exists: [info exists module_status(SPI)]"

# Add or update an array element.
set module_status(I2C) PASS

puts "I2C status: $module_status(I2C)"





# Output:
# UART status: FAIL                                       
# Modules: SPI UART FIFO ALU
# SPI exists: 1
# I2C status: PASS