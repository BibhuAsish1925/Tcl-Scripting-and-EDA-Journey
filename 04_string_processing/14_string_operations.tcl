# Basic Tcl string operations

set text "Tcl Automation"

# string length returns the number of characters.
puts "Length: [string length $text]"

# string toupper converts text to uppercase.
puts "Uppercase: [string toupper $text]"

# string tolower converts text to lowercase.
puts "Lowercase: [string tolower $text]"

# string index accesses a character using its index.
puts "First character: [string index $text 0]"

# string range extracts characters between two indexes.
puts "First three characters: [string range $text 0 2]"






# Output:
# Length: 15
# Uppercase: TCL AUTOMATION
# Lowercase: tcl automation
# First character: T
# First three characters: Tcl