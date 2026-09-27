# Tcl Scripting Journey

A hands-on journey from **Tcl fundamentals to practical EDA/HDL automation**. The repository focuses on learning Tcl by building small scripts first and gradually applying the language to real VLSI/EDA-style workflows.

## Learning Path

```text
01 Core Syntax (Tcl fundamentals)
              ↓
02 Data Handling (Lists, arrays, dictionaries)
              ↓
03 Procedures (Reusable procedures and scope)
              ↓
04 String Processing (Strings, formatting, parsing)
              ↓
05 File Automation (File and directory automation)
              ↓
06 Pattern Matching (Glob, regex, log parsing)
              ↓
07 Error Handling (Errors and validation)
              ↓
08 Automation Utilities (Commands, environment, arguments)
              ↓
09 EDA Workflows (EDA reports and log analysis)
              ↓
10 Practical HDL Automation (Tcl + Verilog simulation automation)
```

## What I Learned

- Tcl command structure, variables and substitutions
- Expressions, conditions and loops
- Lists, arrays and dictionaries
- Procedures, arguments, return values and scope
- String manipulation and text parsing
- File/directory operations
- Glob and regular expressions
- Error handling with `catch`
- Command-line arguments and environment variables
- External command execution using `exec`
- Log and report parsing
- Timing and cell-report analysis
- Automated report generation
- Tcl-based HDL compilation and simulation
- Integration with **Icarus Verilog** and **GTKWave**
- Building repeatable EDA automation flows

## Practical EDA Flow

The final stages apply Tcl to real Verilog designs:

```text
RTL + Testbench
      ↓
    Tcl
      ↓
Compile with Icarus
      ↓
Run Simulation
      ↓
Capture Output
      ↓
Generate VCD
      ↓
Analyze with GTKWave
      ↓
Generate Report
```

Current HDL examples include:

- D Flip-Flop
- 4-bit ALU
- UART TX/RX

## Core Automation Pattern

```text
INPUT
  ↓
READ
  ↓
PARSE
  ↓
ANALYZE
  ↓
VALIDATE
  ↓
REPORT
```

This repository was built to move from **learning Tcl syntax** to understanding how Tcl can automate repetitive tasks in practical **VLSI/EDA workflows**.

## Tools

- Tcl
- Ubuntu / WSL
- VS Code
- Git / GitHub
- Icarus Verilog
- GTKWave

## 📌 Status

**Completed — Tcl fundamentals → EDA scripting → practical HDL automation.**

Future extensions can include self-checking testbenches, automated PASS/FAIL verification, larger RTL flows, synthesis automation and tool-specific EDA scripting.

---

## Author

**Bibhu Asish Panda**  
Electronics / VLSI / Digital Design Enthusiast

[GitHub](https://github.com/BibhuAsish1925) ·
[LinkedIn](www.linkedin.com/in/bibhu-asish-panda-05332b288)
