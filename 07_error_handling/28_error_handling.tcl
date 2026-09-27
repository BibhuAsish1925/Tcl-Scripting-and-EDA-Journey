# Handling errors using catch

set filename "missing_file.txt"

# Try to open the file without stopping the script if it fails.
set status [catch {open $filename r} file]

if {$status == 0} {
    puts "File opened successfully"
    close $file
} else {
    puts "Error opening file: $file"
}

puts "Script continues running."






# Output:
# Error opening file: couldn't open "missing_file.txt": no such file or directory
# Script continues running.