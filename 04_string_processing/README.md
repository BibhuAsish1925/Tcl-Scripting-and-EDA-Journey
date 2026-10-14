# Phase 04 — String Processing

## Overview

**Purpose:** Learn how to process and manipulate strings in Tcl.

String processing is important because automation scripts frequently work with filenames, logs, tool output, configuration files, reports, and other text-based data.

This phase covers basic string operations, formatting, parsing, and text manipulation.

## 1. String Length

The `string length` command returns the number of characters in a string.

**Syntax:**

```tcl
string length $text
```

**Example:**

```tcl
set text "Tcl Automation"

puts [string length $text]
```

**Output:**

```text
15
```

## 2. Converting Case

Use `string toupper` to convert text to uppercase and `string tolower` to convert text to lowercase.

**Example:**

```tcl
set text "Tcl Automation"

puts [string toupper $text]
puts [string tolower $text]
```

**Output:**

```text
TCL AUTOMATION
tcl automation
```

## 3. Accessing Characters

The `string index` command accesses a single character using its index.

**Syntax:**

```tcl
string index $text index
```

**Example:**

```tcl
set text "Tcl Automation"

puts [string index $text 0]
```

**Output:**

```text
T
```

**Key point:** Tcl string indexes start from `0`.

## 4. Extracting a String Range

The `string range` command extracts characters between two indexes.

**Syntax:**

```tcl
string range $text first last
```

**Example:**

```tcl
set text "Tcl Automation"

puts [string range $text 0 2]
```

**Output:**

```text
Tcl
```

The `end` keyword can be used to refer to the last character.

## 5. String Formatting

The `format` command creates a formatted string using format specifiers.

**Syntax:**

```tcl
format "format_string" values
```

**Example:**

```tcl
set name "Bibhu"
set version 1

set message [format "Name: %s | Version: %d" $name $version]

puts $message
```

**Output:**

```text
Name: Bibhu | Version: 1
```

### Common format specifiers

| Specifier | Purpose |
|---|---|
| `%s` | String |
| `%d` | Integer |
| `%f` | Floating-point value |

## 6. Splitting Strings

The `split` command divides a string into a Tcl list using a specified delimiter.

**Syntax:**

```tcl
split $text delimiter
```

**Example:**

```tcl
set data "UART,115200,PASS"

set fields [split $data ","]

puts $fields
```

**Result:**

```text
UART 115200 PASS
```

The resulting list contains three elements:

- `UART`
- `115200`
- `PASS`

Individual values can be accessed using list commands such as `lindex`.

## 7. Finding Text

The `string first` command finds the starting position of a substring.

**Syntax:**

```tcl
string first substring string
```

**Example:**

```tcl
set text "ERROR: UART communication failed"

set position [string first "UART" $text]

puts $position
```

**Output:**

```text
7
```

If the substring is not found, the command returns `-1`.

## 8. Pattern Matching

The `string match` command checks whether a string matches a pattern.

**Syntax:**

```tcl
string match pattern string
```

**Example:**

```tcl
set text "ERROR: UART communication failed"

if {[string match "ERROR:*" $text]} {
    puts "Error detected"
}
```

**Output:**

```text
Error detected
```

The `*` wildcard matches any sequence of characters.

## 9. Replacing Text

The `string map` command replaces specified text in a string.

**Syntax:**

```tcl
string map {old new} $text
```

**Example:**

```tcl
set text "ERROR: UART communication failed"

set updated [string map {"ERROR:" "WARNING:"} $text]

puts $updated
```

**Output:**

```text
WARNING: UART communication failed
```

The command returns an updated string with the specified text replaced.

## 10. Strings and Lists

String processing often works together with Tcl lists.

**Example:**

```tcl
set data "UART,115200,PASS"

set fields [split $data ","]

puts [lindex $fields 0]
puts [lindex $fields 1]
puts [lindex $fields 2]
```

**Output:**

```text
UART
115200
PASS
```

Here:

- `split` converts the string into a list.
- `lindex` retrieves individual values from the resulting list.

This combination is useful for processing structured text.

## 11. Important Tcl Commands

| Command | Purpose |
|---|---|
| `string length` | Returns the number of characters |
| `string toupper` | Converts a string to uppercase |
| `string tolower` | Converts a string to lowercase |
| `string index` | Retrieves a character |
| `string range` | Extracts part of a string |
| `format` | Creates formatted strings |
| `split` | Converts a delimited string into a list |
| `string first` | Finds the position of text |
| `string match` | Performs wildcard pattern matching |
| `string map` | Replaces specified text |

## 12. Practical Automation Uses

String processing is commonly used for:

- Parsing log messages
- Processing tool output
- Extracting values from reports
- Processing filenames
- Checking error messages
- Formatting reports
- Extracting module names
- Processing configuration data
- Preparing data for further automation

## 13. Example Automation Flow

A typical text-processing workflow is:

```text
Raw Text
   |
   v
split / string operations
   |
   v
Extract Required Information
   |
   v
Check or Process Information
   |
   v
Generate Formatted Output
```

For example, an automation script could process:

```text
UART,115200,PASS
```

And extract the following information:

| Field | Value |
|---|---|
| Protocol | UART |
| Baud Rate | 115200 |
| Status | PASS |

## 14. Key Concepts Learned

- Measuring string length
- Converting string case
- Accessing characters
- Extracting string ranges
- Formatting text
- Splitting strings
- Searching for text
- Matching patterns
- Replacing text
- Combining strings with lists
- Processing structured text

## 15. Phase 04 Exercises

| Exercise | File | Topic |
|---|---|---|
| 14 | `14_string_operations.tcl` | Basic string operations |
| 15 | `15_formatting.tcl` | Formatting strings using `format` |
| 16 | `16_string_parsing.tcl` | Splitting and extracting data from strings |
| 17 | `17_text_processing.tcl` | Searching, matching, and replacing text |

## Phase Completion

Phase 04 introduced the string-processing capabilities required for handling text-based automation data.

These concepts will become especially useful in later phases for log parsing, report analysis, and EDA automation.

**Phase 04 complete!**

**Next:** Phase 05 — File Automation.
