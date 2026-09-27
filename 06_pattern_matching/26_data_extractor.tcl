# Extract structured information from text

set log "Module=UART Status=PASS"

# Extract values using regular expressions.
regexp {Module=([A-Za-z0-9_]+)} $log -> module
regexp {Status=([A-Za-z0-9_]+)} $log -> status

puts "Module: $module"
puts "Status: $status"






# Output:
# Module: UART
# Status: PASS