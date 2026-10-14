# Phase 02 — Data Handling

## Overview

**Purpose:** Learn how Tcl handles collections and structured data using lists, arrays, dictionaries, and nested data structures.

These concepts are important for automation because scripts often need to store, search, modify, and process groups of files, modules, configurations, and report data.

## 1. Lists

A Tcl list is an ordered collection of elements. A list maintains the order of its elements, and its indexes start from `0`.

**Example:**

```tcl
set modules {ALU FIFO UART SPI I2C}
```

**List indexes:**

| Index | Element |
|---:|---|
| 0 | ALU |
| 1 | FIFO |
| 2 | UART |
| 3 | SPI |
| 4 | I2C |

## 2. `llength`

The `llength` command returns the number of elements in a list.

```tcl
set modules {ALU FIFO UART SPI I2C}

llength $modules
```

**Result:**

```text
5
```

## 3. `lindex`

The `lindex` command retrieves an element using its index.

```tcl
lindex $modules 2
```

**Result:**

```text
UART
```

Use `end` to access the last element.

```tcl
lindex $modules end
```

**Result:**

```text
I2C
```

## 4. `lrange`

The `lrange` command extracts a portion of a list.

**Syntax:**

```tcl
lrange list first_index last_index
```

**Example:**

```tcl
lrange $modules 0 2
```

**Result:**

```text
ALU FIFO UART
```

## 5. `lsearch`

The `lsearch` command searches for an element in a list and returns its index.

```tcl
lsearch $modules SPI
```

**Result:**

```text
3
```

If the element is not found, `lsearch` normally returns `-1`.

## 6. `linsert`

The `linsert` command inserts one or more elements at a specified position.

```tcl
set modules {ALU FIFO UART SPI I2C}

set modules [linsert $modules 2 GPIO]

puts $modules
```

**Result:**

```text
ALU FIFO GPIO UART SPI I2C
```

The new element is inserted at index `2`, shifting the subsequent elements to the right.

## 7. `lreplace`

The `lreplace` command replaces one or more elements in a list.

```tcl
set modules {ALU FIFO GPIO UART SPI I2C}

set modules [lreplace $modules 0 0 CPU]

puts $modules
```

**Result:**

```text
CPU FIFO GPIO UART SPI I2C
```

The example replaces the element at index `0`.

## 8. `lsort`

The `lsort` command returns a sorted version of a list.

```tcl
set modules {CPU FIFO GPIO UART SPI I2C}

lsort $modules
```

**Result:**

```text
CPU FIFO GPIO I2C SPI UART
```

## 9. Tcl Arrays

A Tcl array stores values using named keys.

**Example:**

```tcl
array set module_status {
    ALU  PASS
    FIFO PASS
    UART FAIL
    SPI  PASS
}
```

Array elements can be accessed using the syntax:

```tcl
array_name(key)
```

**Example:**

```tcl
puts $module_status(UART)
```

**Result:**

```text
FAIL
```

## 10. `array set`

The `array set` command initializes multiple array elements using key-value pairs.

```tcl
array set module_status {
    ALU  PASS
    FIFO PASS
    UART FAIL
    SPI  PASS
}
```

Here, each module name is a key, and its status is the corresponding value.

## 11. `array names`

The `array names` command returns the keys currently stored in an array.

```tcl
array names module_status
```

**Important:** The returned order is not guaranteed.

## 12. `info exists`

The `info exists` command checks whether a variable or array element exists.

```tcl
info exists module_status(SPI)
```

**Result:**

```text
1
```

Return values:

- `1` — The element exists.
- `0` — The element does not exist.

## 13. Adding or Updating Array Elements

Use `set` to add or modify an array element.

```tcl
set module_status(I2C) PASS
```

- If `I2C` does not exist, it is added.
- If it already exists, its value is updated.

## 14. Dictionaries

A Tcl dictionary stores key-value pairs in a single variable.

**Example:**

```tcl
set module {
    name UART
    protocol Serial
    width 8
    status PASS
}
```

Conceptually, the dictionary contains:

| Key | Value |
|---|---|
| `name` | UART |
| `protocol` | Serial |
| `width` | 8 |
| `status` | PASS |

## 15. `dict get`

The `dict get` command retrieves a value using its key.

```tcl
dict get $module name
```

**Result:**

```text
UART
```

Another example:

```tcl
dict get $module width
```

**Result:**

```text
8
```

## 16. `dict set`

The `dict set` command adds or updates a key-value pair.

```tcl
dict set module frequency 115200
```

The dictionary now includes the following entry:

```text
frequency -> 115200
```

## 17. `dict keys`

The `dict keys` command returns the keys stored in a dictionary.

```tcl
dict keys $module
```

**Example result:**

```text
name protocol width status frequency
```

The result reflects the keys currently stored in the dictionary.

## 18. Creating Dictionaries with `dict create`

The `dict create` command creates a dictionary from key-value pairs.

```tcl
set project [dict create \
    name "UART Controller" \
    language "Verilog" \
    protocols {UART SPI I2C} \
    status "Completed"
]
```

This creates one dictionary containing several key-value pairs.

## 19. Nested Data

Tcl data structures can contain other Tcl data structures. For example, a dictionary can contain a list.

```tcl
set project [dict create \
    name "UART Controller" \
    language "Verilog" \
    protocols {UART SPI I2C} \
    status "Completed"
]
```

The structure can be represented as:

```text
project
  |
  +-- name      -> UART Controller
  +-- language  -> Verilog
  +-- protocols -> {UART SPI I2C}
  +-- status    -> Completed
```

The `protocols` value is itself a list.

## 20. Accessing Nested Data

First, retrieve the list stored inside the dictionary.

```tcl
set protocols [dict get $project protocols]
```

Then use list commands to process the retrieved data.

```tcl
llength $protocols
lindex $protocols 0
```

**Example:**

```tcl
puts [lindex $protocols 0]
```

**Result:**

```text
UART
```

This demonstrates how dictionary operations and list operations can be combined.

## 21. List vs. Array vs. Dictionary

| Data structure | Purpose | Example |
|---|---|---|
| **List** | Ordered collection of values | `set tools {Tcl Verilog Python Git}` |
| **Array** | Key-based collection whose elements behave like separate variables | `set status(UART) PASS` |
| **Dictionary** | Key-value data stored together in one variable | `set module {name UART status PASS}` |

**General idea:**

- **List** → Ordered values
- **Array** → Keyed variables
- **Dictionary** → Structured key-value data

## 22. Important Tcl Commands

| Command | Purpose |
|---|---|
| `llength` | Return the number of elements in a list |
| `lindex` | Retrieve an element from a list |
| `lrange` | Extract part of a list |
| `lsearch` | Search for an element in a list |
| `linsert` | Insert elements into a list |
| `lreplace` | Replace elements in a list |
| `lsort` | Sort a list |
| `array set` | Initialize an array |
| `array names` | Return array keys |
| `info exists` | Check whether a variable or array element exists |
| `dict create` | Create a dictionary |
| `dict get` | Retrieve a dictionary value |
| `dict set` | Add or update a dictionary key-value pair |
| `dict keys` | Return dictionary keys |

## 23. Practical Automation Uses

### Lists

Lists can be used to store and process:

- File names
- Module names
- Signal names
- Tool names
- Source files
- Processing queues

### Arrays

Arrays can be useful for:

- Status tracking
- Key-based lookup
- Counters
- Configuration values
- Per-module information

### Dictionaries

Dictionaries can be useful for:

- Configuration data
- Structured reports
- Module information
- Tool settings
- Parsed data

### Nested Structures

Nested structures are useful when information has multiple levels.

For example:

```text
Project
  |
  +-- Module
       |
       +-- Name
       +-- Status
       +-- Protocols
       +-- Configuration
```

## 24. Key Concepts to Remember

1. Tcl lists are ordered collections.
2. Tcl list indexes start at `0`.
3. `lindex` retrieves an element.
4. `lrange` extracts part of a list.
5. `lsearch` finds an element's index.
6. `linsert` adds elements at a specified position.
7. `lreplace` modifies elements in a list.
8. `lsort` returns a sorted list.
9. Arrays use named keys.
10. Array elements are accessed using `array_name(key)`.
11. `info exists` can check whether an array element exists.
12. Dictionaries store key-value pairs in one variable.
13. `dict get` retrieves dictionary values.
14. `dict set` adds or updates dictionary values.
15. A dictionary can contain a list.
16. Tcl structures can be combined to represent more complex data.

## Exercises Completed

| Exercise | File | Topic |
|---|---|---|
| 06 | `06_list_operations.tcl` | List manipulation |
| 07 | `07_arrays.tcl` | Arrays |
| 08 | `08_dictionaries.tcl` | Dictionaries |
| 09 | `09_nested_data.tcl` | Nested data |

## Phase 02 Summary

The main topics covered in this phase are:

- List manipulation
- Arrays
- Dictionaries
- Nested data
- Key-value storage
- Structured data

**Phase 02 complete!**

**Next:** Phase 03 — Procedures, covering reusable procedures, arguments, return values, and variable scope.
