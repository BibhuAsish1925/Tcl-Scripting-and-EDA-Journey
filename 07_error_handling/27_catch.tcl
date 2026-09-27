# Basic error handling with catch

# catch executes a command and prevents an error from stopping the script.
set result [catch {expr {10 / 0}} error_message]

puts "Return code: $result"
puts "Error message: $error_message"






# Output:
# Return code: 1
# Error message: divide by zero