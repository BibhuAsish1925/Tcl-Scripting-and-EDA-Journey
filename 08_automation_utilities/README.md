# Phase 08 — Automation Utilities (Tcl-030 to Tcl-033)

## Overview

Automation utilities allow Tcl scripts to interact with the operating system, use environment variables, accept command-line arguments, and perform complete automation tasks.

This phase moves from individual Tcl concepts toward practical, reusable automation scripts.

## Folder Structure

```text id="3n1f4d"
08_automation_utilities/
├── 30_command_execution.tcl
├── 31_environment_variables.tcl
├── 32_arguments.tcl
└── 33_automation_script.tcl
```

## 1. Executing External Commands

The `exec` command runs an external operating-system command and can return its output.

**Syntax:**

```tcl id="v0e25q"
exec command
```

**Example:**

```tcl id="x8t1pn"
set result [exec echo "Hello from Tcl"]

puts $result
```

**Output:**

```text id="n1h76e"
Hello from Tcl
```

On Windows, commands can also be executed through `cmd`:

```tcl id="mt4h8g"
set result [exec cmd /c echo "Hello from Windows"]
puts $result
```

The command syntax depends on the operating system and the external program being executed.

## 2. Environment Variables

Tcl provides access to operating-system environment variables through the built-in `env` array.

```tcl id="6r3u0s"
puts "Operating System: $::env(OS)"
```

The `::` prefix refers to the global namespace.

Environment variables can provide information such as:

- Operating system.
- Username.
- System paths.
- Tool installation paths.
- Configuration information.

## 3. The `env` Array

Environment variables are available as elements of the Tcl array named `env`.

Examples:

```tcl id="8a4w3c"
puts $::env(OS)
puts $::env(USERNAME)
```

The exact variables available depend on the operating system and system configuration. A variable that is not defined should be checked before accessing it.

## 4. Command-Line Arguments

Tcl provides two important variables for command-line arguments:

| Variable | Purpose |
|---|---|
| `argc` | Number of arguments supplied to the script |
| `argv` | List containing the supplied arguments |

Example:

```tcl id="g1f5w8"
puts "Number of arguments: $argc"
puts "Arguments: $argv"
```

Run the script using:

```powershell id="h0x2m4"
tclsh script.tcl UART PASS
```

The supplied values are:

```text id="a5d2q7"
argc = 2
argv = UART PASS
```

The script name is not included in `argv`.

## 5. Accessing Individual Arguments

Since `argv` is a Tcl list, list commands can retrieve individual arguments.

```tcl id="j6n4s1"
set module [lindex $argv 0]
set status [lindex $argv 1]

puts "Module: $module"
puts "Status: $status"
```

Run:

```powershell id="p7w3k9"
tclsh script.tcl UART PASS
```

Output:

```text id="d4c8v2"
Module: UART
Status: PASS
```

List indexes start at `0`, so `lindex $argv 0` returns the first argument.

## 6. Validating Command-Line Arguments

A script can check whether the required number of arguments was provided before processing them.

```tcl id="q9m2b6"
if {$argc != 1} {
    puts "Usage: tclsh script.tcl <module>"
    exit 1
}
```

This prevents the script from continuing with incomplete or incorrect input.

## 7. The `exit` Command

The `exit` command terminates the Tcl script. The value supplied is its exit status.

| Command | Conventional meaning |
|---|---|
| `exit 0` | Successful completion |
| `exit 1` | Error or unsuccessful execution |

Other nonzero values can also represent unsuccessful execution.

## 8. Combining Tcl Features

A practical automation script can combine concepts learned in previous phases:

- Variables and conditions.
- Lists and procedures.
- String processing.
- File operations.
- Pattern matching.
- Error handling.
- Command-line arguments.
- External command execution.

Combining these features allows individual Tcl operations to become a reusable workflow.

## 9. Complete Automation Flow

A typical automation script follows this sequence:

1. Read command-line arguments.
2. Validate the input.
3. Process the supplied data.
4. Execute the required commands.
5. Generate output or a report.
6. Finish with an appropriate exit status.

## 10. Generating Reports

Tcl can create reports by combining file operations with automation.

```tcl id="r3k8f5"
set file [open "report.txt" w]

puts $file "Module Report"
puts $file "-------------"
puts $file "Module: UART"
puts $file "Status: PASS"

close $file
```

This creates `report.txt` containing the module name and status.

## 11. Practical Automation Uses

Automation utilities can be used for:

- Running external tools.
- Automating command-line workflows.
- Processing tool output.
- Generating reports.
- Passing design names to scripts.
- Selecting files from command-line arguments.
- Using system configuration.
- Creating reusable automation scripts.
- Connecting Tcl with EDA tools.

## 12. EDA Automation Applications

These concepts are particularly useful in EDA workflows. A Tcl script can:

1. Receive a design name from the command line.
2. Locate design files.
3. Execute an EDA tool command.
4. Capture tool output.
5. Parse the generated report.
6. Generate a summary report.

Example workflow:

```text id="y8f2c6"
Design name
    |
    v
Tcl script
    |
    v
EDA tool command
    |
    v
Tool output
    |
    v
Tcl processing
    |
    v
Summary report
```

## 13. Important Commands and Variables

| Command or variable | Purpose |
|---|---|
| `exec` | Executes an external command |
| `env` | Array containing environment variables |
| `argc` | Number of command-line arguments |
| `argv` | List of command-line arguments |
| `lindex` | Accesses an individual argument |
| `exit` | Terminates the script with an exit status |
| `open` | Opens a file |
| `puts` | Writes to the console or an opened file |
| `close` | Closes an opened file |

## 14. Error Handling in Automation

Automation scripts should validate input and handle errors.

```tcl id="w5q7n2"
if {$argc != 1} {
    puts "Usage: tclsh script.tcl <module>"
    exit 1
}
```

The `catch` command from Phase 07 can also be combined with automation commands to handle failures safely.

## 15. Key Concepts Learned

- Executing external commands with `exec`.
- Accessing environment variables through `env`.
- Understanding `argc` and `argv`.
- Processing command-line arguments.
- Validating script input.
- Using exit status codes.
- Generating reports.
- Combining multiple Tcl concepts.
- Building complete automation scripts.

## 16. Phase 08 Exercises

| Exercise | Description |
|---|---|
| `30_command_execution.tcl` | Execute an external operating-system command |
| `31_environment_variables.tcl` | Access environment variables |
| `32_arguments.tcl` | Read and process command-line arguments |
| `33_automation_script.tcl` | Combine arguments, validation, and file generation into a simple automation script |

## Phase Completion

Phase 08 introduced practical Tcl automation utilities and showed how individual Tcl concepts can be combined into complete scripts.

**Next Phase: Phase 09 — EDA Workflows**

Topics include:

- File reporter.
- Log analyzer.
- Timing report parser.
- Cell statistics.
- Complete EDA automation flow.