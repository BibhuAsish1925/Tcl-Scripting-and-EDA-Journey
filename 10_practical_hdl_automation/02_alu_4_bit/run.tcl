# Tcl automation for 4-bit ALU simulation

set rtl_file "ALU_4_bit.v"
set tb_file "ALU_4_bit_tb.v"
set sim_file "alu_sim"
set log_file "simulation.log"
set report_file "alu_report.txt"

puts "4-bit ALU Automation"
puts "--------------------"

# Compile the RTL and testbench.
set status [catch {exec iverilog -o $sim_file $rtl_file $tb_file} result]

if {$status != 0} {
    puts "Compilation: FAIL"
    puts "Error: $result"
    exit 1
}

puts "Compilation: PASS"

# Run the compiled simulation.
set status [catch {exec vvp $sim_file} result]

if {$status != 0} {
    puts "Simulation: FAIL"
    puts "Error: $result"
    exit 1
}

puts "Simulation: PASS"

# Save simulation output to a log file.
set file [open $log_file w]
puts $file $result
close $file

puts "Simulation log: $log_file"

# Generate a summary report.
set report [open $report_file w]

puts $report "4-bit ALU Simulation Report"
puts $report "--------------------------"
puts $report "Compilation: PASS"
puts $report "Simulation: PASS"
puts $report ""
puts $report "Simulation Output:"
puts $report $result

close $report

puts "Report generated: $report_file"







#Output:
#4-bit ALU Automation
#--------------------
#Compilation: PASS
#Simulation: PASS
#Simulation log: simulation.log
#Report generated: alu_report.txt
