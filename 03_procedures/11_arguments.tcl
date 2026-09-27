# Procedures with arguments

# Arguments allow a procedure to receive values from the caller.
proc greet {name role} {
    puts "Name: $name"
    puts "Role: $role"
}

greet "Bibhu" "Tcl Learner"

# Output:
# Name: Bibhu
# Role: Tcl Learner