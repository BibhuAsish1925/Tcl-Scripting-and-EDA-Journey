# Phase 07 — Error Handling (Tcl-027 to Tcl-029)

## Overview

Error handling allows Tcl scripts to detect problems, handle them gracefully, and continue execution when appropriate. It is important in automation because scripts frequently work with files, user input, tool commands, and external data that may not always be valid or available.

## Folder Structure

```text
07_error_handling/
├── 27_catch.tcl
├── 28_error_handling.tcl
└── 29_validation.tcl
```

## 1. The `catch` Command

The `catch` command executes a Tcl command and captures whether it generated an error.

**Syntax:**

```tcl
catch {command} variable
```

**Example:**

```tcl
set result [catch {expr {10 / 0}} error_message]

puts "Return code: $result"
puts "Message: $error_message"
```

The return code indicates the result:

| Return code | Meaning |
|---|---|
| `0` | Command completed successfully |
| `1` | Command generated an error |

## 2. Capturing Error Messages

The second argument of `catch` stores the command's result or error message.

```tcl
set status [catch {open "missing.txt" r} error_message]

if {$status != 0} {
    puts "Error: $error_message"
}
```

This allows the script to report what went wrong instead of terminating immediately.

## 3. Handling File Errors

File operations can fail for several reasons:

- The file does not exist.
- The file path is incorrect.
- Permission problems prevent access.
- The requested file operation fails.

```tcl
set status [catch {open "missing_file.txt" r} file]

if {$status == 0} {
    puts "File opened successfully"
    close $file
} else {
    puts "Error opening file: $file"
}
```

The file is closed only if it was opened successfully.

## 4. Why `catch` Is Useful

Without `catch`, an unhandled error can stop the script.

```tcl
set file [open "missing.txt" r]

puts "This line may not execute."
```

With `catch`, the error can be handled and execution can continue:

```tcl
set status [catch {open "missing.txt" r} file]

if {$status != 0} {
    puts "File could not be opened"
}

puts "Script continues running."
```

This makes scripts more resilient when an operation fails.

## 5. Input Validation

Input validation checks whether a value is acceptable before processing it.

```tcl
set module "UART"

if {$module eq ""} {
    puts "Error: Module name is empty"
} else {
    puts "Module: $module"
}
```

The `eq` operator compares strings for equality. This example checks whether the module name is empty.

## 6. String Validation

Use `eq` and `ne` for string comparisons.

| Operator | Meaning |
|---|---|
| `eq` | Strings are equal |
| `ne` | Strings are not equal |

Example:

```tcl
set status "PASS"

if {$status eq "PASS"} {
    puts "Test passed"
}
```

## 7. List-Based Validation

The `ni` operator checks whether a value is **not included** in a list.

```tcl
set status "PASS"

if {$status ni {PASS FAIL}} {
    puts "Error: Invalid status"
} else {
    puts "Status: $status"
}
```

Valid values in this example are `PASS` and `FAIL`. Any other value is considered invalid.

## 8. Numeric Validation

Numeric values can be checked using comparison operators.

| Operator | Meaning |
|---|---|
| `==` | Equal |
| `!=` | Not equal |
| `>` | Greater than |
| `<` | Less than |
| `>=` | Greater than or equal |
| `<=` | Less than or equal |

Example:

```tcl
set value 10

if {$value < 0} {
    puts "Error: Invalid value"
}
```

This checks whether the value is negative.

## 9. Error Handling Workflow

A common automation workflow is:

1. Receive input.
2. Validate the input.
3. Perform the required operation.
4. Check for errors using `catch`.
5. Handle failures with useful messages.
6. Continue or stop in a controlled way.

## 10. `catch` vs Validation

Validation checks whether input is acceptable before an operation.

```tcl
if {$status ni {PASS FAIL}} {
    puts "Invalid status"
}
```

The `catch` command handles errors generated while executing a command.

```tcl
set result [catch {open $filename r} error]
```

Both techniques are useful and can be combined: validate values first, then use `catch` around operations that may fail.

## 11. Important Commands and Operators

| Command or operator | Purpose |
|---|---|
| `catch` | Captures errors from Tcl commands |
| `if` | Performs conditional processing |
| `eq` | Compares strings for equality |
| `ne` | Compares strings for inequality |
| `ni` | Checks that a value is not present in a list |
| `==` | Numeric equality |
| `!=` | Numeric inequality |
| `>` | Greater than |
| `<` | Less than |
| `>=` | Greater than or equal |
| `<=` | Less than or equal |

## 12. Practical Automation Uses

Error handling is useful for:

- Checking whether files exist.
- Handling failed file operations.
- Validating configuration values.
- Validating module names.
- Checking PASS/FAIL results.
- Handling invalid user input.
- Preventing unexpected script termination.
- Reporting useful error messages.
- Making automation scripts more reliable.

### EDA Automation Applications

In EDA automation, error handling can help when:

- A report file is missing.
- A required directory does not exist.
- A tool command fails.
- A configuration value is invalid.
- A report contains unexpected data.
- A required module or cell cannot be found.

For example, a Tcl script can attempt to read a timing report using `catch`. If the report is missing, the script can report the problem and continue or terminate in a controlled way.

## 13. Key Concepts Learned

- Capturing errors with `catch`.
- Understanding `catch` return codes.
- Capturing error messages.
- Handling file-operation errors.
- Validating input before processing.
- String validation with `eq` and `ne`.
- List-based validation with `ni`.
- Numeric comparisons.
- Combining validation and error handling.
- Building more reliable automation scripts.

## 14. Phase 07 Exercises

| Exercise | Description |
|---|---|
| `27_catch.tcl` | Basic use of `catch` and error return codes |
| `28_error_handling.tcl` | Handling file-operation errors |
| `29_validation.tcl` | Validating input values before processing |

## Phase Completion

Phase 07 introduced the basic error-handling and validation techniques required to make Tcl automation scripts safer and more reliable.

**Next Phase: Phase 08 — Automation Utilities**

Topics include:

- Command execution.
- Environment variables.
- Command-line arguments.
- Building a complete automation script.