# PHASE 12: TCL FOR EDA TOOLS
### Understanding Tcl-Based Automation in Electronic Design Automation

---

## 1. Introduction

Welcome to **Phase 12 of the Tcl Scripting and EDA Journey**.

In this phase, we move beyond general-purpose Tcl programming and begin exploring how Tcl scripting concepts are applied in Electronic Design Automation (EDA).

Tcl is widely used in semiconductor design workflows because it provides a flexible scripting environment for controlling tools, accessing design information, applying constraints, automating repetitive operations, and generating reports.

EDA tools commonly provide Tcl-based command interfaces that allow engineers to interact with different stages of the digital design flow.

This phase introduces the fundamental concepts required to understand Tcl-based EDA automation.

The examples are implemented using standard Tcl and mock design data. Therefore, all six scripts can be executed using a normal Tcl interpreter without requiring access to commercial EDA software.

### Main Objectives

- Understand the Tcl execution environment used in EDA workflows.
- Learn how digital designs are represented through design objects.
- Understand collections and object filtering.
- Read, modify, and manage design attributes.
- Generate basic SDC timing constraint files.
- Understand how Tcl can coordinate different EDA flow stages.
- Build a foundation for advanced physical design automation.

---

## 2. Folder Structure

```text
12_tcl_for_eda_tools/
│
├── 44_eda_tool_environment.tcl
│
├── 45_design_objects.tcl
│
├── 46_collections_and_filters.tcl
│
├── 47_design_attributes.tcl
│
├── 48_sdc_constraints.tcl
│
├── 49_eda_flow_automation.tcl
│
├── design_constraints.sdc
│
├── eda_flow_report.txt
│
└── PHASE_12_SUMMARY.txt
```

**Note:** `design_constraints.sdc` and `eda_flow_report.txt` are generated automatically when their respective Tcl scripts are executed.

---

# 3. Detailed Topic Explanation

## Script 44: EDA Tool Environment

**File:** `44_eda_tool_environment.tcl`

### Objective

The purpose of this script is to understand the Tcl execution environment and how Tcl interacts with the command environment provided by an EDA tool.

Before writing automation scripts, it is important to understand the interpreter, execution directory, script location, and available environment variables.

### Concepts Covered

**1. Tcl Version Information**

```tcl
info patchlevel
```

Returns the version of the Tcl interpreter.

**2. Tcl Executable Information**

```tcl
info nameofexecutable
```

Returns the path of the Tcl executable currently running the script.

**3. Current Working Directory**

```tcl
pwd
```

Displays the directory from which the Tcl script is executed.

**4. Script Information**

```tcl
info script
```

Returns the path of the currently executing script.

**5. File Path Operations**

```tcl
file tail [info script]
file dirname [info script]
```

These commands extract the script filename and its containing directory.

**6. Environment Variable Checking**

```tcl
info exists env(PATH)
```

Checks whether the PATH environment variable exists.

### EDA Application

In an actual EDA environment, engineers often execute Tcl scripts through a tool-provided interpreter.

The tool environment may provide additional commands for:

- Reading RTL files.
- Loading design libraries.
- Accessing design objects.
- Applying timing constraints.
- Running synthesis and physical design operations.
- Generating timing and area reports.

Understanding the execution environment helps create portable and reliable automation scripts.

### Important Note

The EDA commands displayed in this script are examples only. They are not executed by standard `tclsh`.

---

## Script 45: Design Objects

**File:** `45_design_objects.tcl`

### Objective

This script introduces the concept of design objects and demonstrates how design information can be represented using Tcl dictionaries.

In digital IC design, a design contains several types of objects, including:

- Standard cells.
- Input ports.
- Output ports.
- Pins.
- Nets.
- Clock objects.

Each object contains properties that describe its characteristics.

### Concepts Covered

**1. Creating Cell Objects**

```tcl
dict create name U1 type NAND2 area 1.2
```

Creates a dictionary representing a standard-cell instance.

**2. Creating Port Objects**

```tcl
dict create name clk direction input
```

Creates a dictionary representing a design port.

**3. Accessing Object Properties**

```tcl
dict get $cell name
dict get $cell type
dict get $cell area
```

Retrieves individual properties from a dictionary.

**4. Iterating Through Design Objects**

```tcl
foreach cell $cells {
    puts [dict get $cell name]
}
```

Iterates through all the cell objects and displays their names.

**5. Counting Design Objects**

```tcl
llength $cells
llength $ports
```

Returns the number of cells and ports in the mock design.

### Example Design Data

The script creates four standard-cell instances:

| Instance | Cell Type | Area |
|---|---|---:|
| U1 | NAND2 | 1.2 |
| U2 | NOR2 | 1.0 |
| U3 | DFF | 4.5 |
| U4 | INV | 0.6 |

It also creates four design ports:

| Port | Direction |
|---|---|
| clk | Input |
| rst | Input |
| data_in | Input |
| data_out | Output |

### EDA Application

Design-object inspection is an important part of synthesis and physical design.

Engineers use design objects to understand:

- Which standard cells are present.
- How many sequential and combinational cells exist.
- Which ports are inputs or outputs.
- What properties are associated with each instance.

This information is useful for design analysis, optimization, and report generation.

---

## Script 46: Collections and Filters

**File:** `46_collections_and_filters.tcl`

### Objective

This script demonstrates how to select and filter design objects based on their names, types, and attributes.

EDA tools commonly provide collection-based commands that allow engineers to select specific groups of objects from a design.

### Concepts Covered

**1. Selecting All Cells**

```tcl
foreach cell $cells {
    puts [dict get $cell name]
}
```

Iterates through every cell in the design.

**2. Filtering Sequential Cells**

```tcl
if {[dict get $cell type] eq "DFF"} {
    puts "DFF Found"
}
```

Identifies flip-flop instances.

**3. Filtering by Area**

```tcl
if {[dict get $cell area] > 1.0} {
    puts "Large cell found"
}
```

Selects cells whose area is greater than 1.0.

**4. Selecting a Cell by Instance Name**

```tcl
if {[dict get $cell name] eq $target_name} {
    puts "Selected cell"
}
```

Finds a particular cell using its instance name.

### EDA Application

Collection filtering is useful for:

- Identifying sequential cells.
- Finding large-area instances.
- Locating specific cell instances.
- Preparing lists of objects for optimization.
- Performing design inspection.
- Generating customized reports.

### Example Use Case

Suppose a design contains thousands of standard-cell instances.

An engineer may want to identify every DFF instance to inspect sequential logic usage.

Similarly, filtering cells by area can help identify large instances that may deserve further investigation during area optimization.

**Important:** This script demonstrates the filtering concept using Tcl lists and dictionaries. Actual EDA tools use their own collection APIs and query syntax.

---

## Script 47: Design Attributes

**File:** `47_design_attributes.tcl`

### Objective

This script explains how to read, modify, and add attributes to design objects.

Attributes are properties associated with design objects.

For example, a standard-cell instance may contain information such as:

- Instance name.
- Cell type.
- Area.
- Placement status.
- Clock domain.

### Concepts Covered

**1. Reading Attributes**

```tcl
dict get $cell name
dict get $cell type
dict get $cell area
```

Reads the values stored in a design object.

**2. Modifying Attributes**

```tcl
dict set cell status legalized
```

Updates the placement status in the dictionary.

**3. Adding New Attributes**

```tcl
dict set cell clock_domain CLK_MAIN
```

Adds a new clock-domain property.

**4. Displaying Complete Object Information**

```tcl
puts $cell
```

Displays all key-value pairs stored in the dictionary.

### EDA Application

Design attributes are useful when engineers need to inspect or classify design objects.

Examples include:

- Checking whether a cell is placed.
- Identifying a cell's type.
- Tracking cell area.
- Associating cells with clock domains.
- Maintaining design metadata.

### Practical Importance

Attribute-based automation makes it easier to build scripts that inspect design properties and make decisions based on those properties.

For example, a script could identify all cells belonging to a particular clock domain and generate a report.

**Important:** The mock Tcl dictionaries in this exercise are editable. In real EDA tools, whether an attribute can be modified depends on the tool and the particular object property.

---

## Script 48: SDC Constraint Generation

**File:** `48_sdc_constraints.tcl`

### Objective

This script introduces SDC (Synopsys Design Constraints) and demonstrates how Tcl can generate a basic timing constraint file.

SDC is used to communicate timing requirements to synthesis and timing-analysis tools.

Timing constraints are essential because they define the performance requirements that the design must satisfy.

### Constraints Covered

**1. Clock Definition**

```tcl
create_clock -name CLK_MAIN -period 10.0 [get_ports clk]
```

Defines a clock named `CLK_MAIN` with a period of 10 ns on the `clk` port.

**2. Input Delay**

```tcl
set_input_delay 2.0 -clock CLK_MAIN [get_ports data_in]
```

Specifies an input delay of 2 ns relative to the clock.

**3. Output Delay**

```tcl
set_output_delay 1.5 -clock CLK_MAIN [get_ports data_out]
```

Specifies an output delay of 1.5 ns relative to the clock.

**4. Clock Uncertainty**

```tcl
set_clock_uncertainty 0.2 [get_clocks CLK_MAIN]
```

Specifies 0.2 ns of clock uncertainty.

### Tcl File-Handling Concepts

The script also demonstrates how to generate an SDC file using Tcl.

Important commands:

```tcl
open
puts
close
read
file join
```

The script:

1. Creates the output file path.
2. Opens the file in write mode.
3. Writes SDC commands into the file.
4. Closes the file.
5. Opens the generated file again.
6. Reads and displays its contents.

### Generated File

```text
design_constraints.sdc
```

### EDA Application

SDC constraints are used in digital design workflows to communicate timing requirements.

They are important for:

- Synthesis.
- Static Timing Analysis (STA).
- Timing-driven optimization.
- Physical design.
- Clock-related analysis.

### Important Tcl Concept

The square brackets in SDC commands are escaped in the standalone Tcl generator:

```tcl
puts $fp "create_clock -name CLK_MAIN -period 10.0 \[get_ports clk\]"
```

This prevents standard Tcl from trying to execute `get_ports` while generating the file.

When an EDA tool reads the generated SDC file, the tool interprets the constraint commands using its own supported command interface.

---

## Script 49: EDA Flow Automation

**File:** `49_eda_flow_automation.tcl`

### Objective

This script demonstrates how Tcl can coordinate multiple stages of an EDA workflow.

A digital design passes through several stages before it becomes a physically implemented design.

Tcl scripts can automate repetitive tasks, execute flow stages, track execution status, and generate reports.

### Workflow Stages Demonstrated

1. Read RTL.
2. Elaborate Design.
3. Synthesis.
4. Floorplanning.
5. Placement.
6. Timing Analysis.
7. Report Generation.

### Concepts Covered

**1. Defining Workflow Stages**

```tcl
set flow_stages {
    Read RTL
    Elaborate Design
    Synthesis
    Floorplanning
    Placement
    Timing Analysis
    Report Generation
}
```

Stores the workflow stages in a Tcl list.

**2. Executing Workflow Iterations**

```tcl
foreach stage $flow_stages {
    puts "Running Stage: $stage"
}
```

Iterates through each stage.

**3. Tracking Execution Status**

```tcl
dict set flow_results $stage $status
```

Stores the execution status of each stage in a dictionary.

**4. Generating a Summary**

```tcl
dict for {stage status} $flow_results {
    puts "$stage : $status"
}
```

Displays the recorded result of every workflow stage.

**5. Counting Completed Stages**

```tcl
incr completed_count
```

Increments the number of completed stages.

**6. Generating a Report**

```tcl
set fp [open $report_file w]
puts $fp "EDA FLOW EXECUTION REPORT"
close $fp
```

Creates a text report containing the workflow execution results.

### Generated File

```text
eda_flow_report.txt
```

### EDA Application

Tcl-based flow automation is useful for:

- Coordinating design stages.
- Running repetitive commands.
- Tracking execution status.
- Generating reports.
- Organizing automation scripts.
- Building repeatable design workflows.

### Important Note

This script simulates an EDA workflow. It does not actually read RTL, perform synthesis, execute floorplanning, place cells, or run timing analysis.

Actual implementation requires integration with an EDA tool.

---

# 4. Important Tcl Commands Learned

| Tcl Command | Purpose |
|---|---|
| `info patchlevel` | Displays Tcl version |
| `info nameofexecutable` | Displays Tcl executable |
| `pwd` | Displays current working directory |
| `info script` | Returns the executing script path |
| `file dirname` | Extracts directory path |
| `file tail` | Extracts filename |
| `dict create` | Creates a dictionary |
| `dict get` | Reads dictionary values |
| `dict set` | Modifies dictionary values |
| `dict for` | Iterates through dictionary entries |
| `foreach` | Iterates through a list |
| `llength` | Counts list elements |
| `incr` | Increments a variable |
| `open` | Opens a file |
| `puts` | Writes output |
| `read` | Reads file contents |
| `close` | Closes a file |

---

# 5. Important EDA Commands to Recognize

The following commands are examples of commands found in Tcl-based EDA environments.

They are not standard Tcl built-ins.

| EDA Command | Typical Function |
|---|---|
| `read_verilog` | Reads Verilog source files |
| `read_sdc` | Reads timing constraints |
| `get_cells` | Retrieves cell objects |
| `get_ports` | Retrieves port objects |
| `get_pins` | Retrieves pin objects |
| `get_nets` | Retrieves net objects |
| `get_clocks` | Retrieves clock objects |
| `create_clock` | Defines a clock |
| `set_input_delay` | Defines input timing delay |
| `set_output_delay` | Defines output timing delay |
| `report_timing` | Generates timing reports |
| `report_area` | Generates area reports |

The exact syntax, available options, and object-query behavior vary across tools.

---

# 6. Running the Scripts in VS Code

### Step 1: Open the Repository

Open the Tcl learning repository in Visual Studio Code.

### Step 2: Open the Integrated Terminal

Select:

```text
Terminal → New Terminal
```

Ensure the terminal is at the repository root.

Example:

```powershell
PS D:\Downloads\GitHub\TCL-Learning\Tcl-Scripting Journey>
```

### Step 3: Execute Each Script

**Script 44:**

```powershell
tclsh .\12_tcl_for_eda_tools\44_eda_tool_environment.tcl
```

**Script 45:**

```powershell
tclsh .\12_tcl_for_eda_tools\45_design_objects.tcl
```

**Script 46:**

```powershell
tclsh .\12_tcl_for_eda_tools\46_collections_and_filters.tcl
```

**Script 47:**

```powershell
tclsh .\12_tcl_for_eda_tools\47_design_attributes.tcl
```

**Script 48:**

```powershell
tclsh .\12_tcl_for_eda_tools\48_sdc_constraints.tcl
```

**Script 49:**

```powershell
tclsh .\12_tcl_for_eda_tools\49_eda_flow_automation.tcl
```

### Step 4: Execute All Scripts Together

```powershell
Get-ChildItem .\12_tcl_for_eda_tools\*.tcl | Sort-Object Name | ForEach-Object {
    Write-Host "`n========== Running $($_.Name) =========="
    tclsh $_.FullName
}
```

### Step 5: Verify Generated Files

After executing the scripts, verify that these files exist:

```text
design_constraints.sdc
eda_flow_report.txt
```

Open both files in VS Code and inspect their contents.

---

# 7. Practical Exercises

Complete these exercises to strengthen your understanding.

### Exercise 1: Design Object Creation

Add three additional standard-cell instances to Script 45.

Include:

- Instance name.
- Cell type.
- Area.

Display all the cells and calculate the total number of instances.

### Exercise 2: DFF Filtering

Modify Script 46 to count the total number of DFF instances.

Display the result in this format:

```text
Total DFF Instances: 2
```

### Exercise 3: Area-Based Filtering

Modify Script 46 to identify cells with an area greater than 2.0.

Display their instance names and areas.

### Exercise 4: Attribute Management

Modify Script 47 to add the following attributes:

- Voltage domain.
- Clock domain.
- Placement region.

Display the complete updated cell information.

### Exercise 5: Clock Constraint Generation

Modify Script 48 to generate an SDC file with:

```tcl
create_clock -name CLK_MAIN -period 5.0 [get_ports clk]
```

Observe how changing the clock period changes the timing requirement.

### Exercise 6: Workflow Expansion

Modify Script 49 by adding these stages:

- Clock Tree Synthesis.
- Routing.
- Signoff Timing Analysis.

Verify that the total number of completed stages is updated correctly.

### Exercise 7: Failure Handling

Modify the workflow script to simulate a failed stage.

Instead of marking every stage as `COMPLETED`, assign one stage the status `FAILED`.

Update the final report to display:

```text
EDA Flow Status: INCOMPLETE
```

---

# 8. Real-World Relevance in VLSI Design

The concepts introduced in this phase provide a foundation for understanding Tcl-based EDA automation.

| Concept | Practical VLSI Application |
|---|---|
| Tcl environment inspection | Preparing automation environments |
| Design objects | Inspecting cells, ports, pins, and nets |
| Collections and filters | Selecting specific design instances |
| Design attributes | Inspecting cell and placement properties |
| SDC generation | Defining timing requirements |
| Flow automation | Coordinating design implementation stages |
| Report generation | Recording design-flow information |

These concepts become especially useful when working with synthesis, static timing analysis, floorplanning, placement, clock tree synthesis, and routing tools.

---

# 9. Learning Outcomes

After completing Phase 12, I have learned how to:

- Inspect a Tcl execution environment.
- Understand the relationship between Tcl and EDA tool command interfaces.
- Represent design objects using Tcl dictionaries.
- Work with mock cells and design ports.
- Filter design objects using conditions and attributes.
- Read, modify, and add object properties.
- Generate basic SDC timing constraint files.
- Understand clock definitions, input delays, output delays, and clock uncertainty.
- Automate and track simulated EDA workflow stages.
- Generate text-based execution reports.
- Distinguish standard Tcl commands from EDA-specific commands.

---

# 10. Important Technical Note

This phase focuses on the Tcl programming concepts used in EDA automation.

The scripts use standard Tcl and mock design information. They are intended for learning and can be executed using `tclsh`.

The scripts do not directly perform synthesis, floorplanning, placement, routing, or static timing analysis.

EDA-specific commands such as `get_cells`, `get_ports`, and `report_timing` require a compatible tool environment.

Actual tool integration and practical physical-design operations will be explored in the upcoming phases.

---

# 11. Phase Completion

**PHASE 12: TCL FOR EDA TOOLS — COMPLETED**

This phase established the connection between advanced Tcl programming and EDA automation.

It introduced design-object representation, collection filtering, attribute management, SDC generation, and workflow automation.

The knowledge gained here provides the foundation for moving into practical physical-design automation.

### Next Phase

**PHASE 13: PHYSICAL DESIGN AUTOMATION**

Upcoming topics will explore physical-design concepts and Tcl-driven automation for floorplanning, placement, clock tree synthesis, routing, and design reports.

---

**Tcl Scripting and EDA Journey**  
*Learn Tcl. Automate Design. Build VLSI Skills.*