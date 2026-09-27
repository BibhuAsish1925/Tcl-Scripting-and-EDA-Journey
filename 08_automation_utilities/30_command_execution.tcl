# Executing an operating-system command

# exec runs an external command and returns its output.
set result [exec echo "Hello from Tcl"]

puts "Command output: $result"

set result [exec cmd /c echo "Hello from Windows"]
puts "Command output: $result"






# Output:
# Command output: Hello from Tcl
# Command output: "Hello from Windows"