# Phase 03 — Procedures

## Overview

**Purpose:** Learn how to create reusable Tcl procedures that organize scripts, reduce repeated code, and make automation scripts easier to maintain.

Procedures are especially useful when the same operation needs to be performed multiple times with different input values.

## 1. Creating a Procedure

The `proc` command creates a procedure.

**Syntax:**

```tcl
proc procedure_name {parameters} {
    # Procedure body
}
```

**Example:**

```tcl
proc greet {} {
    puts "Hello from Tcl procedure!"
}

greet
```

The procedure is created using `proc` and executed by calling its name.

**Output:**

```text
Hello from Tcl procedure!
```

## 2. Procedure Arguments

Arguments allow values to be passed into a procedure.

**Example:**

```tcl
proc greet {name role} {
    puts "Name: $name"
    puts "Role: $role"
}

greet "Bibhu" "Tcl Learner"
```

Here:

- `name` and `role` are procedure parameters.
- `"Bibhu"` and `"Tcl Learner"` are the values passed when the procedure is called.
- Parameters are accessed using the `$` prefix inside the procedure.

**Output:**

```text
Name: Bibhu
Role: Tcl Learner
```

## 3. Multiple Arguments

A procedure can accept multiple parameters.

```tcl
proc add {a b} {
    return [expr {$a + $b}]
}

set result [add 10 20]
```

The parameters `a` and `b` receive the values supplied by the caller.

## 4. Return Values

The `return` command sends a value back to the caller.

**Example:**

```tcl
proc add_numbers {a b} {
    return [expr {$a + $b}]
}

set result [add_numbers 20 15]

puts $result
```

**Output:**

```text
35
```

The returned value can be stored in a variable or used directly inside another command.

```tcl
puts "Result: [add_numbers 5 10]"
```

**Output:**

```text
Result: 15
```

## 5. Variable Scope

Variables created inside a procedure are normally local to that procedure.

**Example:**

```tcl
set message "Global message"

proc show_message {} {
    set message "Local message"
    puts $message
}

show_message

puts $message
```

**Output:**

```text
Local message
Global message
```

The two variables named `message` are different because they exist in different scopes.

## 6. Global Variables

The `global` command allows a procedure to access a variable created outside that procedure.

**Example:**

```tcl
set counter 0

proc increment_counter {} {
    global counter
    incr counter
}

increment_counter

puts $counter
```

**Output:**

```text
1
```

Without the `global` command, assigning to `counter` inside the procedure would create or modify a local variable rather than the global variable.

## 7. Procedure Structure

A typical Tcl procedure follows this structure:

```tcl
proc procedure_name {arguments} {
    # Processing

    return result
}
```

**Example:**

```tcl
proc multiply {a b} {
    return [expr {$a * $b}]
}

set result [multiply 5 4]

puts $result
```

**Output:**

```text
20
```

## 8. Important Tcl Commands

| Command | Purpose |
|---|---|
| `proc` | Creates a procedure |
| `return` | Returns a value from a procedure |
| `global` | Makes a global variable accessible inside a procedure |
| `expr` | Performs calculations inside procedures |
| `incr` | Increments a variable |
| `set` | Creates or modifies variables |

## 9. Why Procedures Matter in Automation

Procedures are important in larger Tcl automation scripts because they allow repeated operations to be written once and reused whenever needed.

Practical applications include:

- Processing multiple files
- Checking module status
- Parsing report data
- Calculating statistics
- Generating reports
- Running repeated tool commands
- Validating input data

Instead of repeating the same code, create a procedure and call it whenever the operation is required.

## 10. Key Concepts Learned

- Creating and calling reusable procedures
- Passing arguments to procedures
- Using multiple parameters
- Returning values
- Storing and using returned values
- Understanding local variable scope
- Accessing global variables
- Reusing code through procedures

## 11. Phase 03 Exercises

| Exercise | File | Topic |
|---|---|---|
| 10 | `10_basic_procedure.tcl` | Basic procedure creation and calling |
| 11 | `11_arguments.tcl` | Passing arguments to procedures |
| 12 | `12_return_values.tcl` | Returning and using values from procedures |
| 13 | `13_scope.tcl` | Understanding local and global variable scope |

## Phase Completion

Phase 03 introduced Tcl procedures and the concepts required to organize reusable Tcl code.

**Phase 03 complete!**

**Next:** Phase 04 — String Processing

Topics:
- String operations
- String formatting
- String parsing
- Text processing
