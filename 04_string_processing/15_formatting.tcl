# String formatting

set name "Bibhu"
set project "Tcl Automation"
set version 1

# format creates a formatted string using placeholders.
set message [format "Name: %s | Project: %s | Version: %d" $name $project $version]

puts $message






# Output:
# Name: Bibhu | Project: Tcl Automation | Version: 1