# Phase 09 — EDA Workflows (Tcl-034 to Tcl-038)

## Overview

Phase 09 combines Tcl concepts learned in Phases 01–08 and applies them to practical EDA-style automation tasks.

The main goal is to automate common tasks such as:

- Scanning project files.
- Analyzing log files.
- Parsing timing reports.
- Calculating cell statistics.
- Generating summary reports.
- Building command-line automation flows.

## Folder Structure

```text
09_eda_workflows/
├── 34_file_reporter.tcl
├── 35_log_analyzer.tcl
├── 36_timing_report_parser.tcl
├── 37_cell_statistics.tcl
└── 38_eda_automation_flow.tcl
```

## 1. File Reporting

Important commands:

`glob`, `file exists`, `file tail`, `llength`, `foreach`

Example:

```tcl
set files [glob -nocomplain -directory $directory *.tcl]

foreach file $files {
    puts [file tail $file]
}
```

### Key Concepts

- `glob` finds files matching a pattern.
- `-nocomplain` prevents an error when no files match.
- `file tail` returns the final component of a path.
- `llength` returns the number of elements in a list.
- `foreach` processes each file individually.

### EDA Applications

- Finding RTL and constraint files.
- Scanning project directories.
- Generating file inventories.
- Checking whether expected files exist.

## 2. Log File Analysis

Important commands:

`open`, `gets`, `close`, `regexp`, `incr`

Example:

```tcl
set file [open $filename r]

while {[gets $file line] >= 0} {
    if {[regexp {ERROR:} $line]} {
        incr error_count
    }
}

close $file
```

Initialize `error_count` to `0` before this loop.

### Key Concepts

- `gets` reads a file one line at a time.
- `regexp` searches for patterns.
- `incr` increases a numeric variable.
- Line-by-line processing is useful for large log files.

Typical log categories include:

- `PASS`
- `FAIL`
- `WARNING`
- `ERROR`
- `INFO`

### EDA Applications

- Simulation-log analysis.
- Synthesis-log analysis.
- Place-and-route log analysis.
- Checking warnings and errors.
- Determining flow status automatically.

## 3. Regular Expressions for Report Parsing

Regular expressions extract structured information from text.

Example:

```tcl
regexp {WNS:\s+(-?[0-9.]+)} $line -> value
```

For an input line such as:

```text
WNS: -0.25
```

The captured value is:

```text
-0.25
```

### Pattern Components

| Pattern | Meaning |
|---|---|
| `\s` | Matches whitespace |
| `[0-9.]` | Matches a digit or decimal point |
| `-?` | Allows an optional negative sign |
| `()` | Creates a capture group |

### EDA Applications

- Timing reports.
- Area reports.
- Power reports.
- Utilization reports.
- Tool logs.
- Verification reports.

## 4. Timing Report Analysis

Timing reports may contain metrics such as WNS, TNS, and the number of reported violations.

| Metric | Meaning |
|---|---|
| WNS | Worst Negative Slack |
| TNS | Total Negative Slack |
| Violations | Number of reported timing violations |

Example report:

```text
WNS: -0.25
TNS: -10.40
VIOLATIONS: 3
```

A negative WNS generally indicates a timing violation.

Tcl can extract these values and determine a status:

```tcl
if {$wns < 0 || $violations > 0} {
    set timing_status "FAIL"
} else {
    set timing_status "PASS"
}
```

This is a simplified check; actual sign-off criteria should follow the design's timing requirements and report format.

### Analysis Workflow

1. Read the timing report.
2. Extract WNS, TNS, and violation counts.
3. Check values against the required limits.
4. Determine the timing status.
5. Generate a summary.

## 5. Cell Statistics

Cell reports can contain structured information such as:

```text
INV_X1 120
NAND2_X1 80
NOR2_X1 60
DFF_X1 40
```

The `split` command separates each line into fields.

```tcl
set fields [split $line]
set cell_type [lindex $fields 0]
set count [lindex $fields 1]
```

The total cell count can be accumulated using:

```tcl
incr total_cells $count
```

Initialize `total_cells` to `0` before processing the report.

### Important Commands

- `split` — separates a string into fields.
- `lindex` — retrieves a field by index.
- `incr` — updates a numeric variable.

### EDA Applications

- Standard-cell statistics.
- Gate-count analysis.
- Design-size estimation.
- Comparing synthesis results.

## 6. Command-Line Arguments

The variables `argc` and `argv` allow a Tcl script to accept a design name at runtime.

| Variable | Purpose |
|---|---|
| `argc` | Number of command-line arguments |
| `argv` | List containing the arguments |

Example:

```tcl
if {$argc != 1} {
    puts "Usage: tclsh script.tcl <design>"
    exit 1
}

set design [lindex $argv 0]
```

Run the script with different designs:

```powershell
tclsh script.tcl UART
tclsh script.tcl SPI
tclsh script.tcl CPU
```

This makes the script reusable for multiple designs without editing the source code.

## 7. Error Handling in EDA Automation

The `catch` command helps handle failures such as missing reports and inaccessible input files.

Example:

```tcl
set status [catch {open $filename r} file]

if {$status != 0} {
    puts "Error opening timing report: $file"
    exit 1
}
```

### Key Concepts

- `catch` prevents a caught command error from terminating the script unexpectedly.
- Return code `0` means success.
- A nonzero return code indicates that the command did not complete normally.
- The result or error message can be captured in a variable.

### EDA Applications

- Missing reports.
- Missing input files.
- Invalid tool output.
- Failed commands.
- Unexpected flow conditions.

## 8. Automatic Report Generation

Tcl can read analysis results and generate a summary report.

```tcl
set report [open $report_file w]

puts $report "EDA Automation Summary"
puts $report "----------------------"
puts $report "Design: $design"
puts $report "WNS: $wns"
puts $report "Violations: $violations"
puts $report "Timing Status: $timing_status"

close $report
```

This creates a reusable summary report from processed data.

### EDA Applications

- Regression summaries.
- Build reports.
- Timing summaries.
- Simulation summaries.
- Synthesis summaries.
- Automated verification reports.

## 9. Complete EDA Automation Flow

The final exercise combines multiple Tcl concepts into one workflow:

```text
Command-line argument
        |
        v
Input validation
        |
        v
Open report
        |
        v
Read report
        |
        v
Regular-expression parsing
        |
        v
Extract metrics
        |
        v
Check conditions
        |
        v
Generate summary
        |
        v
Close files
```

Concepts used together include:

- `argc` and `argv`
- `if` and `exit`
- `catch`
- `open`, `gets`, and `close`
- `regexp`
- Variables and numeric comparisons
- `puts`

## 10. Important Commands from Phase 09

| Command or variable | Purpose |
|---|---|
| `glob` | Discover matching files |
| `file` | Perform file and path operations |
| `llength` | Count list elements |
| `foreach` | Process list elements |
| `open` | Open a file |
| `gets` | Read one line |
| `close` | Close a file |
| `regexp` | Match or extract text |
| `split` | Separate text into fields |
| `lindex` | Retrieve a list element |
| `incr` | Update a numeric variable |
| `catch` | Handle command errors |
| `exit` | Terminate a script with an exit status |
| `argc` | Count command-line arguments |
| `argv` | Store command-line arguments |
| `puts` | Print or write output |

## 11. Important Concepts

### File Discovery
Find files automatically using `glob`.

### File Parsing
Read files line by line using `gets`.

### Pattern Matching
Use `regexp` to identify and extract information.

### Data Extraction
Capture values from structured text.

### Validation
Check values against expected conditions.

### Error Handling
Use `catch` to handle failures safely.

### Command-Line Automation
Use `argc` and `argv` to make scripts reusable.

### Report Generation
Write processed results into a new report.

### Flow Automation
Combine multiple operations into one automated process.

## 12. EDA Automation Pattern

A common Tcl automation pattern is:

```text
INPUT
  |
  v
READ
  |
  v
PARSE
  |
  v
ANALYZE
  |
  v
VALIDATE
  |
  v
REPORT
```

For example, a timing-report workflow can read WNS and TNS, check violations, determine a PASS/FAIL status, and generate a summary.

## 13. Phase 09 Exercises

| Exercise | Description |
|---|---|
| `34_file_reporter.tcl` | Scan a directory and report Tcl files |
| `35_log_analyzer.tcl` | Read a log and count PASS, FAIL, WARNING, and ERROR messages |
| `36_timing_report_parser.tcl` | Extract WNS, TNS, and violation information |
| `37_cell_statistics.tcl` | Calculate cell statistics from a structured report |
| `38_eda_automation_flow.tcl` | Combine command-line arguments, file handling, regular expressions, error handling, validation, and report generation |

## 14. Practical EDA Use Cases

Tcl scripting is useful for automation tasks such as:

- Running design tools.
- Processing tool reports.
- Parsing simulation logs.
- Checking timing results.
- Extracting synthesis statistics.
- Generating reports.
- Running repetitive design-flow tasks.
- Automating regression flows.
- Checking design files.
- Creating flow summaries.

## 15. Complete Tcl Learning Journey

| Phase | Topic | Main Concepts |
|---|---|---|
| 01 | Core Syntax | Variables, expressions, conditions, loops, lists |
| 02 | Data Handling | Lists, arrays, dictionaries, nested data |
| 03 | Procedures | Procedures, arguments, return values, scope |
| 04 | String Processing | String operations, formatting, parsing, text processing |
| 05 | File Automation | Creating, reading, and writing files; directories; reports |
| 06 | Pattern Matching | Glob, regular expressions, log parsing, data extraction |
| 07 | Error Handling | `catch`, error handling, validation |
| 08 | Automation Utilities | Command execution, environment variables, command-line arguments |
| 09 | EDA Workflows | File reporting, log analysis, timing parsing, cell statistics, complete EDA automation |

## 16. Final Phase 09 Takeaway

The most important skill from Phase 09 is not memorizing individual commands. It is learning how to combine Tcl commands to create automation workflows.

Instead of manually searching files, opening reports, looking for errors, checking timing values, counting cells, and creating summaries, Tcl can perform these tasks automatically.

The overall approach is:

1. Identify repetitive EDA tasks.
2. Write a Tcl script.
3. Read and parse tool output.
4. Apply validation checks.
5. Generate a useful result or report.

**Phase 09 completes the core Tcl learning journey and establishes a foundation for more practical EDA and HDL automation.**