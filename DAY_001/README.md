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



2] GTKWAVE 

  ![Basic_gates](https://github.com/user-attachments/assets/035399d4-9c15-4bee-939d-a8d85db63412)

---


# Yosys and Sky130 PDKs


---

1] read_verilog file 
  
  ![read_verilog](https://github.com/user-attachments/assets/40736518-f309-4a78-9e83-60d1a044921a)

---

2] read_liberty - sky130_fd_sc_hd__tt_025C_1v80.lib

  ![read_liberty](https://github.com/user-attachments/assets/89ad0b61-02cc-4a23-b7c7-f62942c9cb1f)

---

3] Check Hierarchy -as a general rule a synthesis script should always contain this command as first command after reading the input files.

4] show - Create a graphviz DOT file for the selected part of the design and compile it to a graphics file (usually SVG or PostScript).

      Befor Technology Dependent 

![basic_gates_before_technology_dependent yosys_show](https://github.com/user-attachments/assets/0278bcb5-c3d3-4276-8a67-d9dde8b9418a)

    
        
4] proc - The command proc converts processes (Yosys’ internal repre- sentation of Verilog always- and initial-blocks) to circuits of multiplexers and storage elements (various types of flip-flops).

5] opt - The command opt is the Yosys’ built-in optimizer. It can perform some simple optimizations such as const-folding and removing unconnected parts of the design. It is common practice to call opt after each major step in the synthesis procedure.
   In cases where too much optimization is not appreciated (for example when analyzing a design), it is recommended to call clean instead of opt

6] The command techmap turns a high-level circuit with coarse grain cells such as wide adders and multipliers to a fine-grain circuit of simple logic primitives and single-bit storage elements. The command does that by substituting the complex cells by
    circuits of simpler cells. It is possible to provide a custom set of rules for this process in the form of a Verilog source file,

7] synth - This command runs the default synthesis script. This command does not operate on partly selected designs. generic synthesis script
    
    The following commands are executed by this synthesis command:
      begin:
          hierarchy -check [-top <top> | -auto-top]  
          coarse:
                proc
                flatten
                (if -flatten)
                opt_expr
                opt_clean
                check
                opt
                wreduce
                alumacc
                share
                opt
                fsm
                opt -fast
                memory -nomap
                opt_clean
        fine:
                opt -fast -full
                memory_map
                opt -full
                techmap
                opt -fast
                abc -fast

      opt -fast
                check:
                hierarchy -check
                stat
                check
                
  
  ![synth_auto-top](https://github.com/user-attachments/assets/ed0c8b3b-6fc2-459c-8c39-ce798a8a1538)


  ---

  ![basic_gates_synth yosys_show](https://github.com/user-attachments/assets/d91e3f60-149b-4394-b187-99964588e78a)

---

8] write_verilog - Write the current design to a Verilog file.

    ![write_verilog](https://github.com/user-attachments/assets/32800690-3c1e-4683-b038-99f588fc62cd)

                
