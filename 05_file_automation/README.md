# Phase 05 — File Automation (Tcl-018 to Tcl-022)

## Overview

This phase introduces Tcl file handling and directory operations. These concepts are useful for automating files, reports, logs, and tool-generated data in EDA workflows.

## Folder Structure

```text
05_file_automation/
├── 18_create_file.tcl
├── 19_read_file.tcl
├── 20_write_file.tcl
├── 21_directory_operations.tcl
├── 22_file_report.tcl
└── input.txt
```

## 18. Creating a File

**File:** `18_create_file.tcl`

The `open` command with mode `w` creates a file if it does not exist or overwrites it if it already exists. The `puts` command writes data, and `close` releases the file resource.

```tcl
# Creating a file

set filename "output.txt"

# Open in write mode to create or overwrite the file.
set file [open $filename w]

puts $file "Tcl file automation"

# Release the file resource.
close $file

puts "File created: $filename"

# Output:
# File created: output.txt
```

## 19. Reading a File

**File:** `19_read_file.tcl`

The `read` command retrieves the complete contents of an opened file. The file must exist at the specified path.

Create `input.txt` inside `05_file_automation/` with the following contents:

```text
UART PASS
SPI PASS
I2C FAIL
```

```tcl
# Reading a file

set filename "05_file_automation/input.txt"

# Open the file in read mode.
set file [open $filename r]

# Read the complete file contents.
set data [read $file]

close $file

puts "File contents:"
puts $data

# Output:
# File contents:
# UART PASS
# SPI PASS
# I2C FAIL
```

**Important: Relative file paths**

If you run this command from the repository root:

```powershell
tclsh .\05_file_automation\19_read_file.tcl
```

Tcl resolves the relative path `05_file_automation/input.txt` from the current working directory.

Using only `input.txt` would make Tcl look for the file in the repository root, which caused the earlier `couldn't open "input.txt"` error.

## 20. Writing Multiple Lines to a File

**File:** `20_write_file.tcl`

The `puts` command can write multiple lines directly into an opened file. This is useful for generating reports automatically.

```tcl
# Writing multiple lines to a file

set filename "report.txt"

set file [open $filename w]

puts $file "Tcl Automation Report"
puts $file "---------------------"
puts $file "UART : PASS"
puts $file "SPI  : PASS"
puts $file "I2C  : FAIL"

close $file

puts "Report written to: $filename"

# Output:
# Report written to: report.txt
```

## 21. Directory Operations

**File:** `21_directory_operations.tcl`

The `file exists` command checks whether a file or directory exists. The `file mkdir` command creates a directory, while `glob` finds matching items.

```tcl
# Basic directory operations

set directory "reports"

# Check whether the directory exists.
if {![file exists $directory]} {
    file mkdir $directory
    puts "Directory created: $directory"
} else {
    puts "Directory already exists: $directory"
}

# Find items inside the directory.
set files [glob -nocomplain -directory $directory *]

puts "Items in directory: [llength $files]"

# Output on the first run:
# Directory created: reports
# Items in directory: 0
```

On subsequent runs, the output changes because the directory already exists:

```text
Directory already exists: reports
Items in directory: 0
```

The `-nocomplain` option prevents `glob` from raising an error when no items match the pattern.

## 22. Generating a File Report

**File:** `22_file_report.tcl`

This example combines file handling, lists, and `foreach` to write module names to a file and then read them back.

```tcl
# Generate a simple file report

set filename "modules.txt"

set modules {ALU FIFO UART SPI I2C}

# Open the file for writing.
set file [open $filename w]

# Write each module into the file.
foreach module $modules {
    puts $file $module
}

close $file

# Read the generated file.
set file [open $filename r]
set data [read $file]
close $file

puts "Module Report:"
puts $data

# Output:
# Module Report:
# ALU
# FIFO
# UART
# SPI
# I2C
```

## Important Commands

| Command | Purpose |
|---|---|
| `open` | Opens a file |
| `close` | Closes a file |
| `read` | Reads file contents |
| `puts $file` | Writes data to a file |
| `file exists` | Checks whether a file or directory exists |
| `file mkdir` | Creates a directory |
| `glob` | Finds files or directories matching a pattern |
| `foreach` | Processes multiple items |

## Practical EDA and Automation Uses

These concepts can later be used to:

- Read synthesis and simulation reports.
- Create output reports automatically.
- Scan directories for Verilog and SystemVerilog files.
- Collect log files from tool runs.
- Generate module lists and summary files.
- Process multiple design files in an automated workflow.

## Key Concepts Learned

- Always close files after reading or writing.
- Write mode (`w`) creates or overwrites a file.
- Read mode (`r`) requires an existing file.
- Relative paths are resolved from the current working directory.
- `file exists` and `file mkdir` support basic directory management.
- `glob` helps discover matching files and directories.
- Lists and `foreach` can be combined with file operations to generate reports.

## Practice Checklist

- [ ] Tcl-018: Create a file.
- [ ] Tcl-019: Read an existing file.
- [ ] Tcl-020: Write multiple lines to a file.
- [ ] Tcl-021: Create and inspect a directory.
- [ ] Tcl-022: Generate and read a module report.

## Next Phase

**Phase 06 — Pattern Matching**

The next phase builds on file handling by introducing pattern matching for searching and processing text and filenames.