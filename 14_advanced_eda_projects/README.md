# PHASE 14 – ADVANCED EDA PROJECTS

## Overview

Phase 14 focuses on applying Tcl scripting to advanced Electronic Design Automation (EDA) concepts through practical, project-based exercises.

In this phase, individual Tcl programming concepts are combined to create small EDA automation projects involving timing path analysis, setup and hold verification, power estimation, design rule checking, automated report generation, and an integrated EDA dashboard.

The objective is to understand how Tcl can be used to collect design information, perform engineering calculations, evaluate design conditions, detect violations, and generate structured reports.

**Folder Name:** `14_advanced_eda_projects`

---

## Folder Structure

```text
14_advanced_eda_projects/
│
├── 56_timing_path_analysis.tcl
├── 57_setup_hold_analysis.tcl
├── 58_power_estimation.tcl
├── 59_design_rule_check.tcl
├── 60_report_generator.tcl
├── 61_end_to_end_eda_dashboard.tcl
│
└── PHASE_14_SUMMARY.txt
```

---

# Topics Covered

## 1. Timing Path Analysis

**Script:** `56_timing_path_analysis.tcl`

### Concepts Covered
- Timing path identification
- Startpoint and endpoint analysis
- Cell delay calculation
- Data arrival time
- Required time calculation
- Slack calculation
- Timing pass/fail evaluation

### Important Formula

`Slack = Required Time - Arrival Time`

### Practical EDA Application

Timing path analysis helps determine whether data can propagate through a design within the required timing constraints.

Tcl scripting can automate the collection and evaluation of timing information from EDA tools.

### Expected Learning Outcome

Understand how timing delays are calculated and how slack determines whether an example timing path meets its requirement.

---

## 2. Setup and Hold Analysis

**Script:** `57_setup_hold_analysis.tcl`

### Concepts Covered
- Setup timing
- Hold timing
- Maximum path delay
- Minimum path delay
- Clock uncertainty
- Setup slack
- Hold slack
- Timing violation counting

### Important Concepts

**Setup Check:** Ensures that data arrives sufficiently early before the active clock edge.

**Hold Check:** Ensures that data remains stable for the required time after the clock edge.

### Practical EDA Application

Setup and hold analysis is an important part of Static Timing Analysis (STA) and timing closure.

Engineers use these checks to identify timing problems that may require logic optimization, buffering, placement changes, or clock-tree adjustments.

### Expected Learning Outcome

Understand the difference between setup and hold checks and how Tcl can automate the evaluation of timing violations.

---

## 3. Power Estimation

**Script:** `58_power_estimation.tcl`

### Concepts Covered
- Switching activity
- Effective capacitance
- Supply voltage
- Operating frequency
- Dynamic power
- Leakage power
- Total power calculation

### Important Formula

`Dynamic Power = Switching Activity × Capacitance × Voltage² × Frequency`

### Practical EDA Application

Power estimation helps engineers understand the approximate power consumption of a digital design.

It is useful in:
- Low-power VLSI design
- Battery-operated systems
- Power optimization
- Design power budgeting

### Expected Learning Outcome

Understand the relationship between switching activity, capacitance, voltage, frequency, and dynamic power.

---

## 4. Design Rule Check (DRC)

**Script:** `59_design_rule_check.tcl`

### Concepts Covered
- Minimum spacing checking
- Minimum width checking
- Maximum transition checking
- Violation detection
- Violation counting
- Overall verification status

### Practical EDA Application

Design Rule Checking is used to verify whether physical layout geometry follows manufacturing-related constraints.

This project demonstrates how Tcl can evaluate example design measurements against defined rule limits.

### Expected Learning Outcome

Understand how rule-based verification can be automated using Tcl conditions, loops, and counters.

---

## 5. Automated EDA Report Generator

**Script:** `60_report_generator.tcl`

### Concepts Covered
- Design metric collection
- Report formatting
- File handling
- Writing structured reports
- Design status evaluation
- Automated report generation

### Generated Output File

`phase14_eda_report.txt`

### Sample Generated Report

```text
======================================
          EDA DESIGN REPORT
======================================

Design Name       : EDA_DEMO_TOP
Cell Count        : 1250
Total Cell Area   : 5200.50
Utilization       : 68.0%
Timing Slack      : 0.35 ns
Estimated Power   : 252.0 mW
DRC Violations    : 3

--------------------------------------
DESIGN STATUS
--------------------------------------
Status: NEEDS REVIEW

Report generated using Tcl automation.
```

### Result Analysis

The report was successfully generated and verified.

- Timing slack is positive at 0.35 ns.
- Utilization is 68%.
- Estimated total power is 252 mW.
- Three DRC violations are reported.
- Overall status is `NEEDS REVIEW`.

The status is correct because the script requires both non-negative timing slack and zero DRC violations to report `PASS`.

### Practical EDA Application

EDA tools generate reports during synthesis, timing analysis, placement, routing, and physical verification.

Tcl automation can collect important metrics and organize them into readable reports.

### Expected Learning Outcome

Learn how to automate report generation using Tcl file-handling commands such as `open`, `puts`, and `close`.

---

## 6. End-to-End EDA Dashboard

**Script:** `61_end_to_end_eda_dashboard.tcl`

### Concepts Covered
- Design information collection
- Timing summary
- Power summary
- Physical design metrics
- Routing completion calculation
- DRC status
- LVS status
- Overall design status evaluation

### Practical EDA Application

An integrated EDA dashboard provides a consolidated view of important design metrics.

It helps engineers monitor design progress and identify areas requiring further investigation.

### Expected Learning Outcome

Understand how multiple EDA-related metrics can be collected, evaluated, and presented through one Tcl automation script.

---

# How to Run the Scripts in VS Code

Open the VS Code terminal from the repository root directory.

### Run Individual Scripts

```powershell
tclsh .\14_advanced_eda_projects\56_timing_path_analysis.tcl

tclsh .\14_advanced_eda_projects\57_setup_hold_analysis.tcl

tclsh .\14_advanced_eda_projects\58_power_estimation.tcl

tclsh .\14_advanced_eda_projects\59_design_rule_check.tcl

tclsh .\14_advanced_eda_projects\60_report_generator.tcl

tclsh .\14_advanced_eda_projects\61_end_to_end_eda_dashboard.tcl
```

### Run All Scripts Together

```powershell
$files = @(
    "56_timing_path_analysis.tcl",
    "57_setup_hold_analysis.tcl",
    "58_power_estimation.tcl",
    "59_design_rule_check.tcl",
    "60_report_generator.tcl",
    "61_end_to_end_eda_dashboard.tcl"
)

foreach ($file in $files) {
    Write-Host "`nRunning $file" -ForegroundColor Cyan
    tclsh ".\14_advanced_eda_projects\$file"
}
```

### View the Generated Report

After executing Script 60, run:

```powershell
Get-Content .\phase14_eda_report.txt
```

This displays the generated EDA report directly in the VS Code terminal.

---

# Practical Exercises

1. Modify the cell delays in Script 56 and observe how timing slack changes.
2. Introduce additional setup and hold violations in Script 57.
3. Change voltage, frequency, capacitance, and switching activity in Script 58.
4. Add more sample design objects and rule violations in Script 59.
5. Add additional design metrics to the automated report in Script 60.
6. Extend the EDA dashboard in Script 61 with additional timing, power, and physical-design parameters.

---

# Learning Outcomes

After completing Phase 14, you should be able to:

- Analyze example timing paths using Tcl.
- Calculate data arrival time, required time, and slack.
- Understand setup and hold timing checks.
- Estimate dynamic and leakage power using a simplified model.
- Automate example design rule checks.
- Detect and count design violations.
- Generate structured EDA reports automatically.
- Combine multiple design metrics into an integrated dashboard.
- Apply Tcl programming concepts to project-oriented EDA automation tasks.

---

# Important Technical Note

All six scripts in this phase are standalone Tcl learning demonstrations that use simulated design data.

They demonstrate the scripting logic and engineering concepts behind EDA workflows. They do not replace actual Static Timing Analysis, power analysis, DRC, LVS, placement, or routing engines.

Real EDA tool integration requires the appropriate tool-specific Tcl commands, design databases, technology files, libraries, and tool installations.

---

# Phase 14 – Completed

**Phase Name:** Advanced EDA Projects

### Topics Completed

- Timing Path Analysis
- Setup and Hold Analysis
- Power Estimation
- Design Rule Check
- Automated EDA Report Generation
- End-to-End EDA Dashboard

### Project Achievement

Successfully developed six Tcl-based EDA learning projects demonstrating how scripting can support timing evaluation, power estimation, verification checks, report generation, and integrated design monitoring.

**Repository:** Tcl Scripting and EDA Journey

**Author:** Bibhu Asish Panda