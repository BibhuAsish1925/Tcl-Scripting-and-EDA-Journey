# Phase 11: Advanced TCL Programming

## Purpose

This phase introduces advanced Tcl programming concepts that help
develop modular, reusable, scalable, and maintainable automation
scripts.

The focus is on namespaces, packages, dynamic command evaluation,
anonymous procedures, recursion, advanced variable scope, and
variable tracing.

These concepts are useful when developing larger Tcl applications
and automation frameworks for EDA workflows.

---

## Folder Structure

```text
11_advanced_tcl/
│
├── 39_namespaces.tcl
├── 40_packages/
│   ├── math_utils.tcl
│   ├── pkgIndex.tcl
│   └── 40_package_demo.tcl
├── 41_eval_subst_expansion.tcl
├── 42_apply_recursion.tcl
├── 43_variable_scope_trace.tcl
└── PHASE_11_SUMMARY.txt
```

---

## 1. Namespaces

A namespace is used to organize related Tcl commands and variables
under a common name.

Namespaces help avoid naming conflicts in larger applications.

Syntax:

```tcl
namespace eval namespace_name {
    # Commands and variables
}
```

Example:

```tcl
namespace eval ::EDA {
    variable tool_name "OpenROAD"

    proc display_info {} {
        variable tool_name
        puts "EDA Tool: $tool_name"
    }
}

::EDA::display_info
```

Important commands:

- `namespace eval` — creates and evaluates commands inside a namespace.
- `namespace current` — returns the current namespace.
- `namespace commands` — lists commands in a namespace.
- `namespace import` — imports exported commands.
- `namespace export` — specifies commands available for export.

### EDA Application

Namespaces can organize Tcl utilities into separate modules:

- Timing analysis
- Floorplan calculations
- Report parsing
- Cell statistics
- Design automation

---

## 2. Tcl Packages

Packages allow Tcl code to be organized into reusable libraries.

A package can contain procedures and variables that can be loaded
into multiple Tcl scripts.

Important commands:

`package provide`

Registers a package and its version.

`package require`

Loads a required package.

`package ifneeded`

Defines the script Tcl should execute when a package is requested.

`auto_path`

Contains directories where Tcl searches for packages.

Example:

```tcl
package provide MathUtils 1.0

package require MathUtils 1.0
```

The package demonstration creates a reusable mathematical
library containing:

- Area calculation
- Power calculation

### EDA Application

Reusable packages can contain common EDA automation procedures,
including report parsers, timing utilities, and floorplan
calculations.

---

## 3. Dynamic Command Evaluation

Tcl provides commands and syntax for constructing and evaluating
commands dynamically.

### eval

The `eval` command evaluates a command constructed from its
arguments.

Example:

```tcl
set command "puts"

eval $command {"Hello from eval"}
```

Output:

```text
Hello from eval
```

### subst

The `subst` command performs variable, command, and backslash
substitution on a string.

Example:

```tcl
set module "UART"
set status "PASS"

set message "Module=$module Status=$status"

puts [subst $message]
```

Output:

```text
Module=UART Status=PASS
```

### Argument Expansion

The `{*}` syntax expands a list into separate command arguments.

Example:

```tcl
set values {10 20 30 40}

proc calculate_sum {a b c d} {
    return [expr {$a + $b + $c + $d}]
}

puts [calculate_sum {*}$values]
```

Output:

```text
100
```

Important concepts:

- `eval` — dynamic command evaluation.
- `subst` — string substitution.
- `{*}` — argument expansion.

Note: Prefer safe argument expansion and direct command
invocation over unnecessary use of `eval`.

---

## 4. Anonymous Procedures Using apply

The `apply` command executes an anonymous procedure without
requiring a separately named procedure definition.

Syntax:

```tcl
apply {arguments body} arguments
```

Example:

```tcl
set square [apply {{number} {
    return [expr {$number * $number}]
}} 5]

puts $square
```

Output:

```text
25
```

Another example:

```tcl
set area [apply {{width height} {
    return [expr {$width * $height}]
}} 100 50]

puts $area
```

Output:

```text
5000
```

### EDA Application

Anonymous procedures can perform short calculations and
transformations without creating additional named procedures.

---

## 5. Recursive Procedures

Recursion occurs when a procedure calls itself to solve a smaller
part of a problem.

A recursive procedure must contain a base condition to prevent
infinite recursion.

Example:

```tcl
proc factorial {number} {

    if {$number <= 1} {
        return 1
    }

    return [expr {
        $number * [factorial [expr {$number - 1}]]
    }]
}

puts [factorial 5]
```

Output:

```text
120
```

Another example is recursive summation:

```tcl
proc sum_to_n {number} {

    if {$number <= 0} {
        return 0
    }

    return [expr {
        $number + [sum_to_n [expr {$number - 1}]]
    }]
}

puts [sum_to_n 5]
```

Output:

```text
15
```

### EDA Application

Recursion can be useful for processing hierarchical design
structures and nested data.

For very deep hierarchies, iterative approaches may be more
appropriate.

---

## 6. Advanced Variable Scope

Tcl provides additional commands for accessing and executing
operations in different procedure scopes.

### upvar

The `upvar` command links a local variable to a variable in
another stack frame.

Example:

```tcl
proc update_value {variable_name new_value} {

    upvar 1 $variable_name linked_variable

    set linked_variable $new_value
}

set design_status "NOT_STARTED"

update_value design_status "COMPLETED"

puts $design_status
```

Output:

```text
COMPLETED
```

### uplevel

The `uplevel` command evaluates a script in another stack frame.

Example:

```tcl
proc execute_in_caller {} {
    uplevel 1 {set flow_stage "PLACEMENT"}
}

execute_in_caller

puts $flow_stage
```

Output:

```text
PLACEMENT
```

These commands are useful when building reusable procedures
that need to interact with variables in their calling environment.

---

## 7. Variable Tracing

The `trace` command allows a Tcl script to monitor operations
performed on variables.

Example:

```tcl
proc variable_changed {name1 name2 operation} {

    upvar #0 $name1 monitored_variable

    puts "Variable changed: $name1"
    puts "New value: $monitored_variable"
}

set timing_status "PENDING"

trace add variable timing_status write variable_changed

set timing_status "PASS"

trace remove variable timing_status write variable_changed
```

Output:

```text
Variable changed: timing_status
New value: PASS
```

Important commands:

- `trace add variable` — adds a variable trace.
- `trace remove variable` — removes a variable trace.

### EDA Application

Variable tracing can help monitor changes in:

- Timing status
- Flow configuration
- Design parameters
- Automation state
- Report-processing variables

---

## 8. Important Commands Reference

| Command | Purpose |
|---|---|
| namespace eval | Creates and evaluates a namespace |
| namespace export | Exports namespace commands |
| namespace import | Imports namespace commands |
| package provide | Registers a package |
| package require | Loads a package |
| package ifneeded | Defines package loading behavior |
| eval | Evaluates a constructed command |
| subst | Performs string substitution |
| {*} | Expands a list into arguments |
| apply | Executes an anonymous procedure |
| upvar | Links variables across stack frames |
| uplevel | Executes a script in another stack frame |
| trace add | Adds a variable trace |
| trace remove | Removes a variable trace |

---

## 9. Practical EDA Applications

Advanced Tcl programming can be applied to:

- Developing reusable EDA automation libraries.
- Organizing large Tcl scripts using namespaces.
- Creating custom Tcl packages.
- Building reusable timing-analysis procedures.
- Performing floorplan calculations.
- Processing hierarchical design information.
- Monitoring automation variables.
- Developing configurable automation frameworks.
- Managing complex scripting workflows.

---

## 10. Phase 11 Exercises

### 39_namespaces.tcl

Demonstrates namespace creation, variables, and procedures.

### 40_packages

Demonstrates reusable Tcl package creation and loading.

### 41_eval_subst_expansion.tcl

Demonstrates dynamic evaluation, substitution, and argument
expansion.

### 42_apply_recursion.tcl

Demonstrates anonymous procedures and recursive calculations.

### 43_variable_scope_trace.tcl

Demonstrates advanced variable scope and variable tracing.

---

## 11. Execution Commands

Run the scripts from the repository root:

```powershell
tclsh .\11_advanced_tcl\39_namespaces.tcl

tclsh .\11_advanced_tcl\40_packages\40_package_demo.tcl

tclsh .\11_advanced_tcl\41_eval_subst_expansion.tcl

tclsh .\11_advanced_tcl\42_apply_recursion.tcl

tclsh .\11_advanced_tcl\43_variable_scope_trace.tcl
```

---

## Phase Completion

Phase 11 introduced advanced Tcl programming concepts required
for developing modular, reusable, and maintainable automation
applications.

These concepts extend basic Tcl scripting into more structured
programming and provide a foundation for developing advanced
EDA automation utilities.

**Next Phase:**

Phase 12 — Tcl for EDA Tools

Phase 11 Complete.
