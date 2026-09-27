# Basic directory operations

set directory "reports"

# file exists checks whether a file or directory exists.
if {![file exists $directory]} {
    # file mkdir creates the directory.
    file mkdir $directory
    puts "Directory created: $directory"
} else {
    puts "Directory already exists: $directory"
}

# glob returns files or directories matching a pattern.
set files [glob -nocomplain -directory $directory *]

puts "Items in directory: [llength $files]"






# Output:
# Directory created: reports
# Items in directory: 0