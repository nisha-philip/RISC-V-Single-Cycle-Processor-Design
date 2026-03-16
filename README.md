# RISC-V-Single-Cycle-Processor-Design
## 📌Project Overview

A 32-bit RISC-V processor implementation based on the RV32I Base Integer Instruction Set. This project features a modular RTL design in Verilog and a comprehensive testbench that validates instruction execution through a single-cycle datapath.
## 🏗️Technical Architecture
The processor is built with a standard 5-stage logic flow (Fetch, Decode, Execute, Memory, Write-back) squeezed into a single clock cycle.
![](https://github.com/nisha-philip/RISC-V-Single-Cycle-Processor-Design/blob/main/netlistRISC.png)

**Supported Instructions:**

R-Type: ADD, SUB, AND, OR, SLT

I-Type: ADDI, ORI, LW

S-Type: SW

B-Type: BEQ

## Core Blocks
**Program Counter (PC)** – Holds the address of the current instruction

**Instruction Memory** – Fetches the instruction corresponding to the PC

**Control Unit (CU)** – Decodes the instruction opcode and generates control signals

**Register File** – Provides source operands and receives write-back data

**Immediate Generator (Sign Extend)** – Generates sign-extended immediates

**ALU** – Performs arithmetic and address calculations

**Data Memory** – Supports load and store operations


## 🛠️ Tools Used
Language: Verilog HDL

Simulator: QuestaSim / ModelSim/ QuartusPrime: Synthesis

Waveform Viewer: GTKWave / ModelSim Wave Window

## Functionality with a Preliminary Testbench
![](https://github.com/nisha-philip/RISC-V-Single-Cycle-Processor-Design/blob/main/waveformRISCV.png)


## 🚀 Future Roadmap
-Implement a 5-Stage Pipeline to increase clock frequency.

- Add a **UVM-based verification environment** for constrained-random testing.

- Implement full support for the JAL and LUI instructions.
