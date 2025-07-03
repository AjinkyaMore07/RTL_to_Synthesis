# Basic Gates in Verilog

This repository contains a Verilog implementation of basic logic gates and a test bench to verify their functionality.

## Overview

The `Basic_Gates` module implements basic logic gates: NOT, AND, OR, NOR, NAND, XOR, and XNOR. The test bench (`tb_Basic_Gates`) applies different combinations of inputs to the module and displays the corresponding outputs.

## Files

- `Basic_Gates.v`: Verilog module implementing basic logic gates.
- `tb_Basic_Gates.v`: Test bench for the `Basic_Gates` module.

## Module Description

### Basic_Gates

#### Ports

- **Inputs**
  - `a_in`: Input signal A
  - `b_in`: Input signal B

- **Outputs**
  - `not_A`: NOT of input A
  - `not_B`: NOT of input B
  - `and_out`: AND of inputs A and B
  - `or_out`: OR of inputs A and B
  - `nor_out`: NOR of inputs A and B
  - `nand_out`: NAND of inputs A and B
  - `xor_out`: XOR of inputs A and B
  - `xnor_out`: XNOR of inputs A and B

## Test Bench Description

The test bench applies the following combinations of inputs to the `Basic_Gates` module:

1. `a_in = 0`, `b_in = 0`
2. `a_in = 0`, `b_in = 1`
3. `a_in = 1`, `b_in = 0`
4. `a_in = 1`, `b_in = 1`

For each combination, the outputs are displayed in the console.
   ![vcd_basic_gates](https://github.com/user-attachments/assets/305813d7-f75c-4a5a-96e8-f6d64d6a335d)

---


