# PHASE 13: PHYSICAL DESIGN AUTOMATION
### Tcl Scripting for Floorplanning, Placement, CTS and Routing Analysis

---

## 1. Introduction

Welcome to Phase 13 of the Tcl Scripting and EDA Journey.

In this phase, we explore how Tcl scripting concepts can be applied to physical design automation in VLSI.

Physical design is an important stage of the semiconductor design flow. It transforms a synthesized netlist into a physically organized implementation by defining the floorplan, assigning I/O pins, placing standard cells, building the clock distribution network, and routing signal connections.

Tcl is widely used in physical design environments to automate repetitive operations, inspect design information, execute tool commands, and generate reports.

### Objectives

- Understand floorplanning and core area calculation.
- Calculate utilization and aspect ratio.
- Understand I/O pin planning.
- Analyze standard-cell placement information.
- Understand Clock Tree Synthesis (CTS).
- Analyze routing information and completion.
- Generate physical-design reports using Tcl.

**Implementation approach:** The six scripts in this phase use standard Tcl and mock physical-design data. They are executable with `tclsh` and do not require commercial EDA software.

---

## 2. Folder Structure

```text
13_physical_design_automation/
│
├── 50_floorplan_area_calculation.tcl
├── 51_utilization_aspect_ratio.tcl
├── 52_io_pin_planning.tcl
├── 53_placement_analysis.tcl
├── 54_clock_tree_synthesis.tcl
├── 55_routing_analysis_report.tcl
│
├── physical_design_report.txt
│
└── PHASE_13_SUMMARY.txt
```

The physical-design report is generated automatically by Script 55.

---

# 3. Detailed Topic Explanation

## Script 50: Floorplan Area Calculation

**File:** `50_floorplan_area_calculation.tcl`

### Objective

Understand the fundamentals of floorplanning and calculate the approximate core and die dimensions.

Floorplanning establishes the physical layout region where the design will be implemented.

### Concepts Covered

- Total standard-cell area.
- Target utilization.
- Required core area.
- Core width and height.
- Die dimensions.
- Core-to-die margin.

### Important Formulas

**Core Area:**

Core area is estimated using:

Core Area = Total Cell Area / Target Utilization

**Core Width:**

Core Width = √(Core Area × Aspect Ratio)

**Core Height:**

Core Height = Core Area / Core Width

**Die Dimensions:**

Die Width = Core Width + 2 × Margin

Die Height = Core Height + 2 × Margin

### Example

Given:

- Total cell area = 5000 µm².
- Target utilization = 65%.
- Aspect ratio = 1.0.
- Margin = 10 µm.

The script calculates:

- Core area ≈ 7692.31 µm².
- Core width ≈ 87.71 µm.
- Core height ≈ 87.71 µm.
- Die width ≈ 107.71 µm.
- Die height ≈ 107.71 µm.

### EDA Application

Floorplanning is important for:

- Defining the core region.
- Estimating die dimensions.
- Planning available placement space.
- Establishing the initial physical-design geometry.

---

## Script 51: Utilization and Aspect Ratio

**File:** `51_utilization_aspect_ratio.tcl`

### Objective

Understand how standard-cell utilization and core aspect ratio influence physical design.

### Concepts Covered

**1. Core Area**

Core Area = Core Width × Core Height

**2. Utilization**

Utilization = (Standard Cell Area / Core Area) × 100

**3. Aspect Ratio**

Aspect Ratio = Core Width / Core Height

### Example

Given:

- Standard-cell area = 6000.
- Core width = 120.
- Core height = 100.

Results:

- Core area = 12000.
- Utilization = 50%.
- Aspect ratio = 1.20.

### Utilization Classification

The script demonstrates a simple classification:

| Utilization | Classification |
|---|---|
| Below 50% | LOW |
| 50–70% | MODERATE |
| Above 70–85% | HIGH |
| Above 85% | VERY HIGH |

These are illustrative categories for this exercise, not universal physical-design limits.

### EDA Application

Utilization analysis helps engineers understand the amount of available placement space.

High utilization can increase placement difficulty, congestion, and routing challenges.

The appropriate utilization target depends on the technology, design characteristics, and implementation flow.

---

## Script 52: I/O Pin Planning

**File:** `52_io_pin_planning.tcl`

### Objective

Understand how I/O pins are assigned to different edges of a chip.

I/O pins provide the interface between the internal design and external signals.

### Concepts Covered

- Die width and height.
- Input and output ports.
- Pin assignment.
- Left-edge placement.
- Right-edge placement.
- Top-edge placement.
- Bottom-edge placement.
- Pin coordinate calculation.

### Example Ports

| Port | Assigned Edge |
|---|---|
| clk | Left |
| rst | Left |
| data_in | Bottom |
| enable | Bottom |
| data_out | Right |
| ready | Right |

### Coordinate Calculation

For a rectangular die, pin positions can be calculated using the die width and height.

For example, a left-edge pin has:

X = 0

A right-edge pin has:

X = Die Width

A bottom-edge pin has:

Y = 0

A top-edge pin has:

Y = Die Height

### Tcl Concepts Used

- `foreach`
- `switch`
- `array set`
- `incr`
- `llength`
- `expr`
- `format`

### EDA Application

I/O pin planning is important for:

- Establishing external connectivity.
- Organizing signal interfaces.
- Managing routing access.
- Reducing physical-design complexity.
- Planning the chip boundary.

The educational script uses simplified coordinate assignment. Actual pin placement must consider technology rules, spacing, routing layers, and design constraints.

---

## Script 53: Placement Analysis

**File:** `53_placement_analysis.tcl`

### Objective

Understand how standard cells are represented by physical coordinates and dimensions.

Placement determines the physical locations of standard-cell instances within the core.

### Concepts Covered

- Cell instance names.
- X and Y coordinates.
- Cell width and height.
- Individual cell area.
- Total cell area.
- Placement bounding box.

### Mock Placement Data

| Instance | X | Y | Width | Height |
|---|---:|---:|---:|---:|
| U1 | 10 | 10 | 5 | 4 |
| U2 | 20 | 15 | 6 | 4 |
| U3 | 35 | 20 | 8 | 6 |
| U4 | 50 | 30 | 5 | 5 |
| U5 | 65 | 40 | 7 | 5 |

### Area Calculation

Individual Cell Area = Width × Height

Total Cell Area = Sum of Individual Cell Areas

### Bounding Box

The script calculates:

- Minimum X coordinate.
- Minimum Y coordinate.
- Maximum X coordinate.
- Maximum Y coordinate.
- Bounding-box width.
- Bounding-box height.
- Bounding-box area.

### Expected Results

- Total placed cells = 5.
- Total cell area = 143.
- Bounding-box width = 62.
- Bounding-box height = 35.
- Bounding-box area = 2170.

### Tcl Concepts Used

- `foreach`
- `lassign`
- `expr`
- `if`
- `format`

### EDA Application

Placement analysis is useful for:

- Inspecting cell locations.
- Understanding the physical distribution of instances.
- Calculating occupied cell area.
- Analyzing placement regions.
- Preparing placement reports.

**Important:** Bounding-box area is not the same as actual cell area or placement utilization. The script does not perform legal placement or overlap checking.

---

## Script 54: Clock Tree Synthesis (CTS)

**File:** `54_clock_tree_synthesis.tcl`

### Objective

Understand the basic concepts and reporting metrics associated with Clock Tree Synthesis.

Clock Tree Synthesis builds the clock distribution network required to deliver clock signals to sequential elements.

### Concepts Covered

- Clock name.
- Clock period.
- Sequential-cell count.
- Clock buffer count.
- Clock inverter count.
- Clock insertion delay.
- Clock skew.
- Clock transition.

### Important Concepts

**1. Clock Insertion Delay**

The delay between the clock source and the clock arrival point at a sequential element.

**2. Clock Skew**

The difference in clock arrival times between different clock endpoints.

**3. Clock Buffers**

Buffers inserted into the clock network to drive clock loads and manage signal distribution.

**4. Clock Inverters**

Inverters that may be used in clock-tree implementations where required by the design and tool strategy.

### Example Results

| Parameter | Value |
|---|---:|
| Clock Period | 10 ns |
| Sequential Cells | 120 |
| Clock Buffers | 18 |
| Clock Inverters | 4 |
| Total Clock Cells | 22 |
| Insertion Delay | 0.85 ns |
| Clock Skew | 0.12 ns |
| Clock Transition | 0.18 ns |

### EDA Application

CTS is important for:

- Clock distribution.
- Managing clock skew.
- Controlling insertion delay.
- Driving sequential-cell clock pins.
- Evaluating clock-tree quality.

**Important:** The values in this exercise are illustrative. The script does not execute an actual CTS engine.

---

## Script 55: Routing Analysis and Report Generation

**File:** `55_routing_analysis_report.tcl`

### Objective

Understand routing metrics and generate a physical-design routing report using Tcl.

Routing connects design components through metal interconnects.

### Concepts Covered

- Total number of nets.
- Routed nets.
- Unrouted nets.
- Total wirelength.
- Routing violations.
- Horizontal congestion.
- Vertical congestion.
- Routing completion percentage.
- Routing status.
- Report generation.

### Important Formulas

**Unrouted Nets:**

Unrouted Nets = Total Nets − Routed Nets

**Routing Completion:**

Routing Completion = (Routed Nets / Total Nets) × 100

### Example Results

| Parameter | Value |
|---|---:|
| Total Nets | 250 |
| Routed Nets | 245 |
| Unrouted Nets | 5 |
| Total Wirelength | 12500 |
| Routing Violations | 3 |
| Horizontal Congestion | 72% |
| Vertical Congestion | 68% |
| Routing Completion | 98% |

### Routing Status

The script reports:

`NEEDS REVIEW`

This is because the example design has five unrouted nets and three routing violations.

### Generated Report

```text
physical_design_report.txt
```

The report contains the design name, routing statistics, congestion information, completion percentage, and final routing status.

### EDA Application

Routing analysis helps engineers evaluate:

- Signal connectivity.
- Routing completion.
- Wirelength.
- Congestion.
- Design-rule violations.
- Physical implementation quality.

**Important:** The script uses mock routing data. Actual routing and design-rule checking require a physical-design tool.

---

# 4. Important Tcl Commands Learned

| Tcl Command | Purpose |
|---|---|
| `expr` | Performs mathematical calculations |
| `sqrt` | Calculates square roots |
| `format` | Formats numerical values |
| `foreach` | Iterates through design data |
| `lassign` | Assigns list elements to variables |
| `llength` | Counts list elements |
| `switch` | Selects an execution branch |
| `array set` | Initializes an array |
| `incr` | Increments a variable |
| `if` | Performs conditional checks |
| `elseif` | Checks additional conditions |
| `open` | Opens a file |
| `puts` | Writes information |
| `close` | Closes a file |
| `file join` | Creates a platform-independent path |

---

# 5. Physical Design Concepts Covered

| Physical Design Stage | Main Purpose |
|---|---|
| Floorplanning | Defines the core and die regions |
| Utilization Analysis | Evaluates cell area relative to core area |
| I/O Pin Planning | Assigns pins around the die boundary |
| Placement | Determines standard-cell locations |
| Clock Tree Synthesis | Builds the clock distribution network |
| Routing | Connects physical design objects through metal layers |

These stages are essential parts of a digital physical-design flow. Actual implementation flows may include additional operations, iterations, and verification stages.

---

# 6. How to Run the Scripts in VS Code

Open the repository in Visual Studio Code.

Open the integrated terminal:

**Terminal → New Terminal**

Ensure that the current working directory is the repository root.

Example:

```powershell
PS D:\Downloads\GitHub\TCL-Learning\Tcl-Scripting Journey>
```

### Execute Individual Scripts

**Script 50:**

```powershell
tclsh .\13_physical_design_automation\50_floorplan_area_calculation.tcl
```

**Script 51:**

```powershell
tclsh .\13_physical_design_automation\51_utilization_aspect_ratio.tcl
```

**Script 52:**

```powershell
tclsh .\13_physical_design_automation\52_io_pin_planning.tcl
```

**Script 53:**

```powershell
tclsh .\13_physical_design_automation\53_placement_analysis.tcl
```

**Script 54:**

```powershell
tclsh .\13_physical_design_automation\54_clock_tree_synthesis.tcl
```

**Script 55:**

```powershell
tclsh .\13_physical_design_automation\55_routing_analysis_report.tcl
```

### Execute All Scripts Together

```powershell
Get-ChildItem .\13_physical_design_automation\*.tcl |
Sort-Object Name |
ForEach-Object {
    Write-Host "`n========== Running $($_.Name) =========="
    tclsh $_.FullName
}
```

---

# 7. Practical Exercises

Complete these exercises to strengthen your physical-design automation knowledge.

### Exercise 1: Floorplan Modification

Modify Script 50 with:

- Cell area = 8000 µm².
- Target utilization = 70%.
- Aspect ratio = 1.5.
- Margin = 15 µm.

Calculate the updated core and die dimensions.

### Exercise 2: Utilization Analysis

Modify Script 51 to calculate utilization for three different core sizes.

Compare the utilization values and classify them.

### Exercise 3: I/O Pin Planning

Modify Script 52 to include:

- Five additional input ports.
- Two additional output ports.
- At least one pin assigned to the top edge.

Display the updated pin assignments.

### Exercise 4: Placement Analysis

Modify Script 53 to add five more standard-cell instances.

Recalculate:

- Total cell count.
- Total cell area.
- Placement bounding box.

### Exercise 5: CTS Analysis

Modify Script 54 with:

- 200 sequential cells.
- 25 clock buffers.
- 6 clock inverters.
- Clock skew of 0.25 ns.

Observe the updated clock-tree report and skew-check result.

### Exercise 6: Routing Analysis

Modify Script 55 to simulate:

- 300 total nets.
- 290 routed nets.
- 10 unrouted nets.
- 5 routing violations.

Verify the routing completion percentage and final status.

### Exercise 7: Report Enhancement

Modify Script 55 to include a timestamp and design name in the generated report.

Use Tcl's `clock format` command to generate the timestamp.

---

# 8. Real-World Applications in VLSI

The concepts introduced in this phase are relevant to several physical-design engineering activities.

| Concept | Real-World Application |
|---|---|
| Floorplan calculation | Estimating core and die dimensions |
| Utilization analysis | Evaluating placement density |
| I/O pin planning | Organizing chip interfaces |
| Placement analysis | Inspecting cell coordinates |
| CTS analysis | Evaluating clock distribution |
| Routing analysis | Checking connectivity and congestion |
| Report generation | Documenting physical-design results |

These concepts provide the foundation for more advanced physical-design automation using actual EDA tools.

---

# 9. Learning Outcomes

After completing Phase 13, I have learned how to:

- Calculate core area using target utilization.
- Estimate core and die dimensions.
- Understand aspect ratio.
- Calculate standard-cell utilization.
- Assign I/O pins to die edges.
- Represent placed cells using physical coordinates.
- Calculate cell area and placement bounding boxes.
- Understand clock-tree parameters.
- Analyze clock insertion delay and skew.
- Calculate routing completion.
- Track unrouted nets and routing violations.
- Generate physical-design reports using Tcl.

---

# 10. Technical Implementation Note

All six scripts in this phase are standalone Tcl demonstrations.

They use illustrative physical-design information and mock measurements. They do not perform actual floorplanning, pin placement, standard-cell placement, clock-tree synthesis, routing, or design-rule checking.

Real physical-design operations require an EDA tool and a compatible technology setup.

The purpose of this phase is to understand the calculations, automation logic, and reporting techniques before integrating Tcl with an actual physical-design environment.

---

# 11. Phase Completion

**PHASE 13: PHYSICAL DESIGN AUTOMATION — COMPLETED**

This phase introduced important physical-design concepts and demonstrated how Tcl can be used to calculate, analyze, organize, and report physical-design information.

The knowledge gained here provides a foundation for more advanced EDA automation and practical implementation workflows.

### Next Phase

**PHASE 14: ADVANCED EDA PROJECTS**

The next phase will focus on combining Tcl, RTL, design-flow automation, and open-source EDA tools to build more realistic hands-on projects.

---

**Tcl Scripting and EDA Journey**

*Learn Tcl. Automate Design. Build VLSI Skills.*