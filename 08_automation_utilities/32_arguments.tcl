# Reading command-line arguments

# argc contains the number of arguments.
puts "Number of arguments: $argc"

# argv contains all command-line arguments as a list.
puts "Arguments: $argv"

if {$argc > 0} {
    puts "First argument: [lindex $argv 0]"
}






# PS D:\Downloads\GitHub\TCL-Learning\Tcl-Scripting Journey> tclsh .\08_automation_utilities\32_arguments.tcl UART PASS
# Number of arguments: 2
# Arguments: UART PASS
# First argument: UART
# PS D:\Downloads\GitHub\TCL-Learning\Tcl-Scripting Journey>ttclsh .\08_automation_utilities\32_arguments.tcl             
# Number of arguments: 0
# Arguments:
