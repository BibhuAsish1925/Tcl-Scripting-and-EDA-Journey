# Phase 01 — Core Tcl Syntax

## Overview

**Purpose:** Learn the fundamental Tcl syntax required to write basic scripts and understand how Tcl evaluates commands, variables, expressions, conditions, loops, and lists.

## 1. Tcl Command Structure

Tcl is a command-oriented scripting language. A basic command consists of a command name followed by its arguments.

**Syntax:**

```tcl
command argument1 argument2 ...
```

**Example:**

```tcl
puts "Hello, Tcl!"
```

Here, `puts` is the command, and `"Hello, Tcl!"` is its argument.

Most Tcl commands end at a newline.

```tcl
puts "Hello"
puts "World"
```

**Output:**

```text
Hello
World
```

## 2. Variables

Tcl variables are created using the `set` command.

**Syntax:**

```tcl
set variable_name value
```

**Example:**

```tcl
set name "Bibhu"
set age 22

puts $name
puts $age
```

Variables are accessed using the `$` prefix.

```tcl
set name "Bibhu"
puts "Name: $name"
```

**Output:**

```text
Name: Bibhu
```

**Key point:** Tcl does not require separate variable declarations such as `int`, `float`, or `string`.

## 3. Basic Output — `puts`

The `puts` command prints information to the terminal.

```tcl
puts "Hello, Tcl!"
```

Variables can be included inside double-quoted strings.

```tcl
set tool "Tcl"
puts "Learning $tool"
```

**Output:**

```text
Learning Tcl
```

## 4. Expressions and `expr`

The `expr` command evaluates arithmetic and logical expressions.

```tcl
set a 20
set b 6

set sum [expr {$a + $b}]
```

Square brackets `[]` perform **command substitution**. The command inside the brackets executes, and its result is returned.

```tcl
puts [expr {10 + 5}]
```

**Output:**

```text
15
```

### Basic arithmetic operators

| Operator | Operation |
|---|---|
| `+` | Addition |
| `-` | Subtraction |
| `*` | Multiplication |
| `/` | Division |
| `%` | Remainder |

**Example:**

```tcl
set a 20
set b 6

puts [expr {$a + $b}]
puts [expr {$a - $b}]
puts [expr {$a * $b}]
puts [expr {$a / $b}]
puts [expr {$a % $b}]
```

When both operands are integers, division produces an integer result.

```tcl
expr {20 / 6}
```

**Result:**

```text
3
```

## 5. Conditions

Tcl uses `if`, `elseif`, and `else` for decision-making.

**Structure:**

```tcl
if {condition} {
    commands
} elseif {condition} {
    commands
} else {
    commands
}
```

**Example:**

```tcl
set temperature 28

if {$temperature >= 30} {
    puts "Hot"
} elseif {$temperature >= 20} {
    puts "Moderate"
} else {
    puts "Cold"
}
```

### Comparison operators

| Operator | Meaning |
|---|---|
| `==` | Equal |
| `!=` | Not equal |
| `>` | Greater than |
| `<` | Less than |
| `>=` | Greater than or equal |
| `<=` | Less than or equal |

Conditions are normally enclosed in curly braces.

```tcl
if {$a > $b} {
    puts "A is greater"
}
```

## 6. `for` Loop

A `for` loop repeatedly executes a block of commands.

**Structure:**

```tcl
for {initialization} {condition} {update} {
    commands
}
```

**Example:**

```tcl
for {set i 1} {$i <= 5} {incr i} {
    puts "Count: $i"
}
```

**Execution flow:**

1. Initialize the loop variable.
2. Check the condition.
3. Execute the commands if the condition is true.
4. Update the loop variable.
5. Repeat until the condition becomes false.

## 7. The `incr` Command

The `incr` command increments an integer variable.

```tcl
set i 1
incr i
```

The value of `i` becomes `2`.

You can also specify the increment amount.

```tcl
incr i 5
```

This increases the current value of `i` by `5`.

## 8. `while` Loop

A `while` loop continues executing while its condition is true.

**Structure:**

```tcl
while {condition} {
    commands
}
```

**Example:**

```tcl
set i 1

while {$i <= 5} {
    puts "Count: $i"
    incr i
}
```

**Important:** Ensure that the loop condition eventually becomes false to avoid an infinite loop.

## 9. Lists

A Tcl list is an ordered collection of elements.

```tcl
set tools {Tcl Verilog Python Git}
```

Access the complete list:

```tcl
puts $tools
```

Use `llength` to return the number of elements.

```tcl
llength $tools
```

**Result:**

```text
4
```

## 10. The `lindex` Command

The `lindex` command retrieves an element from a list.

**Syntax:**

```tcl
lindex list index
```

**Example:**

```tcl
set tools {Tcl Verilog Python Git}

puts [lindex $tools 0]
```

**Output:**

```text
Tcl
```

Tcl list indexes start at `0`.

| Index | Element |
|---:|---|
| `0` | Tcl |
| `1` | Verilog |
| `2` | Python |
| `3` | Git |

Use `end` to access the last element.

```tcl
lindex $tools end
```

## 11. The `lappend` Command

The `lappend` command adds an element to a list.

```tcl
set tools {Tcl Verilog Python Git}

lappend tools Linux

puts $tools
```

**Output:**

```text
Tcl Verilog Python Git Linux
```

## 12. Tcl Substitution

Three important Tcl syntax forms are:

| Syntax | Purpose |
|---|---|
| `$variable` | Variable substitution |
| `[command]` | Command substitution |
| `{script/block}` | Groups text or script without ordinary substitutions during parsing |

**Variable substitution:**

```tcl
puts $name
```

**Command substitution:**

```tcl
puts [expr {10 + 5}]
```

**Curly braces in a conditional:**

```tcl
if {$a > $b} {
    puts "A is greater"
}
```

## 13. Double Quotes vs. Curly Braces

### Double quotes

Double quotes allow variable and command substitutions.

```tcl
set name "Bibhu"
puts "Hello $name"
```

**Output:**

```text
Hello Bibhu
```

### Curly braces

Curly braces generally prevent variable and command substitution while Tcl parses their contents.

```tcl
puts {$name}
```

**Output:**

```text
$name
```

Curly braces are commonly used to group expressions and script blocks.

```tcl
if {$value > 10} {
    puts "Greater than 10"
}
```

## 14. Important Tcl Commands

| Command | Purpose |
|---|---|
| `puts` | Display output |
| `set` | Create or modify a variable |
| `expr` | Evaluate an expression |
| `if` | Execute commands conditionally |
| `elseif` | Check an additional condition |
| `else` | Execute commands when previous conditions are false |
| `for` | Repeat commands using initialization, condition, and update |
| `while` | Repeat commands while a condition remains true |
| `incr` | Increment an integer variable |
| `llength` | Return the number of list elements |
| `lindex` | Retrieve a list element |
| `lappend` | Append an element to a list |

## 15. Key Concepts to Remember

1. Tcl is command-oriented.
2. Variables are created using `set` and accessed using `$`.
3. Square brackets perform command substitution.
4. Expressions are evaluated using `expr`.
5. Conditions are commonly enclosed in curly braces.
6. Tcl list indexes start at `0`.
7. `incr` is useful for loop counters.
8. `for` and `while` provide repetition.
9. Tcl does not require explicit variable type declarations.
10. Double quotes allow substitutions.
11. Curly braces group expressions and script blocks and generally prevent substitutions during parsing.

## Exercises Completed

| Exercise | File | Topic |
|---|---|---|
| 01 | `01_variables_and_output.tcl` | Variables and output |
| 02 | `02_expressions.tcl` | Expressions and arithmetic |
| 03 | `03_conditions.tcl` | Conditional statements |
| 04 | `04_loops.tcl` | Loops |
| 05 | `05_lists.tcl` | Lists |

## Phase 01 Summary

The core topics covered in this phase are:

- Basic Tcl command structure
- Variables and output
- Expressions and arithmetic
- Conditions and comparison operators
- `for` and `while` loops
- Lists and basic list operations
- Variable and command substitution
- Double quotes and curly braces

**Phase 01 complete!**

**Next:** Phase 02 — Data Handling, covering advanced list operations, arrays, dictionaries, and nested data structures.
