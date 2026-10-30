# Advanced Tcl - eval, subst and argument expansion

# ------------------------------------------------
# 1. eval
# ------------------------------------------------

set command "puts"

eval $command {"Hello from eval"}

# Output:
# Hello from eval


# ------------------------------------------------
# 2. subst
# ------------------------------------------------

set module "UART"
set status "PASS"

set message "Module=$module Status=$status"

puts [subst $message]

# Output:
# Module=UART Status=PASS


# ------------------------------------------------
# 3. Argument expansion using {*} 
# ------------------------------------------------

set values {10 20 30 40}

# {*} expands a list into separate command arguments.
puts "Values: [list {*}$values]"

# Use list expansion with a procedure.
proc calculate_sum {a b c d} {

    return [expr {$a + $b + $c + $d}]
}

set result [calculate_sum {*}$values]

puts "Sum: $result"







# Output:
# Hello from eval
# Module=UART Status=PASS
# Values: 10 20 30 40
# Sum: 100