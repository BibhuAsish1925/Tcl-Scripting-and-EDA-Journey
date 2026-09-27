# Variable scope in procedures

set message "Global message"

proc show_message {} {
    # A variable created inside a procedure is local to that procedure.
    set message "Local message"
    puts "Inside procedure: $message"
}

show_message

puts "Outside procedure: $message"

# Output:
# Inside procedure: Local message
# Outside procedure: Global message