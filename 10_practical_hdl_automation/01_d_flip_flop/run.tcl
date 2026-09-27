# Tcl automation for D flip-flop simulation

set rtl_file "D_flip_flop_behav.v"
set tb_file "D_flip_flop_tb.v"
set sim_file "dff_sim"
set log_file "simulation.log"

puts "D Flip-Flop Automation"
puts "----------------------"

# Compile the RTL and testbench.
set status [catch {exec iverilog -o $sim_file $rtl_file $tb_file} result]

if {$status != 0} {
    puts "Compilation: FAIL"
    puts "Error: $result"
    exit 1
}

puts "Compilation: PASS"

# Run the compiled simulation and capture its output.
set status [catch {exec vvp $sim_file} result]

if {$status != 0} {
    puts "Simulation: FAIL"
    puts "Error: $result"
    exit 1
}

puts "Simulation: PASS"

# Save the simulator output into a log file.
set file [open $log_file w]
puts $file $result
close $file

puts "Simulation log: $log_file"







#Output:
#D Flip-Flop Automation
#----------------------
#Compilation: PASS
#Simulation: PASS
#Simulation log: simulation.log
