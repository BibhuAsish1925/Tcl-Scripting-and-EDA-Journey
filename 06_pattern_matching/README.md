# Phase 06 — Pattern Matching (Tcl-023 to Tcl-026)

## Overview

Pattern matching allows Tcl scripts to find files, identify text patterns, search logs, and extract structured information. It is important in automation because tool output, reports, and log files often contain large amounts of text.

## Folder Structure

```text
06_pattern_matching/
├── 23_glob_matching.tcl
├── 24_regular_expressions.tcl
├── 25_log_parser.tcl
└── 26_data_extractor.tcl
```

## 1. Glob Matching

The `glob` command finds files and directories that match a pattern.

```tcl
set files [glob -nocomplain "*.tcl"]
```

The `*` wildcard represents any sequence of characters.

| Pattern | Purpose |
|---|---|
| `*.tcl` | Find Tcl files |
| `*.log` | Find log files |
| `report_*.txt` | Find text files beginning with `report_` |

### The `-nocomplain` Option

Normally, `glob` can generate an error when no files match. The `-nocomplain` option prevents this error and returns an empty result when no matching files are found.

```tcl
set files [glob -nocomplain "*.log"]
```

This is useful when matching files may or may not exist during automation.

## 2. Regular Expressions

Regular expressions provide more powerful pattern matching than simple glob patterns.

The `regexp` command checks whether a pattern matches a string.

**Syntax:**

```tcl
regexp {pattern} $text
```

**Example:**

```tcl
set text "UART PASS"

if {[regexp {UART} $text]} {
    puts "UART found"
}
```

**Output:**

```text
UART found
```

If the pattern matches, `regexp` returns `1`; otherwise, it returns `0`.

## 3. Basic Regular Expression Patterns

| Pattern | Meaning |
|---|---|
| `[A-Z]` | Any uppercase letter |
| `[a-z]` | Any lowercase letter |
| `[0-9]` | Any digit |
| `+` | One or more occurrences |
| `*` | Zero or more occurrences |
| `.` | Any single character |
| `^` | Beginning of a string |
| `$` | End of a string |

For example, `[A-Z]+` matches one or more uppercase letters.

## 4. Capturing Data with `regexp`

Parentheses define capturing groups that store matched portions of text in variables.

```tcl
set text "UART PASS"

regexp {([A-Z]+) ([A-Z]+)} $text -> protocol status

puts "Protocol: $protocol"
puts "Status: $status"
```

**Output:**

```text
Protocol: UART
Status: PASS
```

The captured values are stored in `protocol` and `status`. The `->` variable receives the complete matched string when it is used as the match variable.

## 5. Reading Logs Line by Line

The `gets` command reads one line from an opened file. This lets a script process a file one line at a time instead of loading the entire file into memory.

```tcl
while {[gets $file line] >= 0} {
    puts $line
}
```

Here, `line` holds the current line, and the loop continues until the end of the file is reached.

## 6. Log Parsing

Pattern matching can be combined with file processing to search for error messages.

```tcl
while {[gets $file line] >= 0} {
    if {[regexp {ERROR:} $line]} {
        puts "Error found: $line"
    }
}
```

This searches each line for `ERROR:` and prints lines containing the pattern.

## 7. Extracting Structured Data

Regular expressions can extract values from structured text such as reports and tool output.

```tcl
set log "Module=UART Status=PASS"

regexp {Module=([A-Za-z0-9_]+)} $log -> module
regexp {Status=([A-Za-z0-9_]+)} $log -> status

puts "Module: $module"
puts "Status: $status"
```

**Output:**

```text
Module: UART
Status: PASS
```

The pattern `[A-Za-z0-9_]+` matches one or more letters, digits, or underscores.

## 8. Glob vs Regular Expressions

| Feature | `glob` | `regexp` |
|---|---|---|
| Main purpose | Match filenames and directory names | Match and extract text |
| Example | `*.tcl` | `{Module=([A-Za-z0-9_]+)}` |
| Typical use | Discover source and log files | Parse reports and search logs |

Both are useful, but they solve different types of matching problems.

## 9. Important Commands

| Command | Purpose |
|---|---|
| `glob` | Find matching files or directories |
| `regexp` | Match patterns and extract text |
| `gets` | Read one line from a file |
| `open` | Open a file |
| `close` | Close an opened file |
| `while` | Repeat processing while a condition is true |

## 10. Pattern Matching Workflow

A common automation workflow is:

1. Find files using `glob`.
2. Open a file using `open`.
3. Read its contents line by line using `gets`.
4. Search for patterns using `regexp`.
5. Extract the required information.
6. Generate useful output or reports.

## 11. Practical Automation Uses

Pattern matching can be used for:

- Finding source files and log files.
- Searching for error messages.
- Parsing synthesis and simulation logs.
- Extracting timing information.
- Extracting module names.
- Detecting PASS/FAIL results.
- Processing tool-generated reports.
- Building log analyzers.
- Collecting information from multiple files.

### EDA Automation Examples

A Tcl script can search for structured information such as:

```text
Module=UART
Status=PASS
```

It can also look for timing values:

```text
WNS = -0.25
TNS = -10.4
```

Or identify errors:

```text
ERROR: Cannot find cell
```

These patterns can be used to extract important values and summarize EDA tool output automatically.

## 12. Key Concepts Learned

- File pattern matching with `glob`.
- Wildcards and the `-nocomplain` option.
- Regular expressions and character classes.
- Quantifiers and capturing groups.
- Reading files line by line with `gets`.
- Searching log files for errors.
- Extracting structured data with `regexp`.
- Combining file handling with pattern matching.

## 13. Phase 06 Exercises

| Exercise | Description |
|---|---|
| `23_glob_matching.tcl` | Find files using glob patterns |
| `24_regular_expressions.tcl` | Perform basic regular-expression matching and extraction |
| `25_log_parser.tcl` | Search a log file for error messages |
| `26_data_extractor.tcl` | Extract structured values from text |

## Phase Completion

Phase 06 introduced the pattern-matching techniques needed for searching files, parsing logs, and extracting information from text. These concepts form the foundation for more practical automation, including report parsing and EDA workflows.

**Next Phase: Phase 07 — Error Handling**