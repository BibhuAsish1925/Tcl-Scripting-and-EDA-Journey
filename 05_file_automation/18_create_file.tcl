# Creating a file

set filename "output.txt"

# open with "w" creates a new file or overwrites an existing file.
set file [open $filename w]

puts $file "Tcl file automation"

# close releases the file resource.
close $file

puts "File created: $filename"






# Output:
# File created: output.txt