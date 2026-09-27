# Tcl automation for UART TX/RX simulation

set tx_file "UART_Tx.v"
set rx_file "UART_Rx.v"
set tb_file "UART_tb.v"

set sim_file "uart_sim"
set log_file "simulation.log"
set report_file "uart_report.txt"

puts "UART TX/RX Automation"
puts "---------------------"

# Compile the UART design and testbench.
set status [catch {exec iverilog -o $sim_file $tx_file $rx_file $tb_file} result]

if {$status != 0} {
    puts "Compilation: FAIL"
    puts "Error: $result"
    exit 1
}

puts "Compilation: PASS"

# Run the simulation.
set status [catch {exec vvp $sim_file} result]

if {$status != 0} {
    puts "Simulation: FAIL"
    puts "Error: $result"
    exit 1
}

puts "Simulation: PASS"

# Save simulation output.
set file [open $log_file w]
puts $file $result
close $file

puts "Simulation log: $log_file"

# Generate a summary report.
set report [open $report_file w]

puts $report "UART TX/RX Simulation Report"
puts $report "----------------------------"
puts $report "Compilation: PASS"
puts $report "Simulation: PASS"
puts $report ""
puts $report "Simulation Output:"
puts $report $result

close $report

puts "Report generated: $report_file"







#Output:
#UART TX/RX Automation
#---------------------
#Compilation: PASS
#Simulation: PASS
#Simulation log: simulation.log
#Report generated: uart_report.txt
