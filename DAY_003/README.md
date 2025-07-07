# Half Adder in Verilog


## Overview

The `ha` module implements a Half Adder, a fundamental digital circuit that adds two single-bit binary numbers. It produces a sum and a carry-out output.

## Files

- `ha.v`: Verilog module for the Half Adder.
- `tb_ha.v`: Testbench for the Half Adder module.

## Module Description

### Half Adder (`ha`)

#### Ports

- **Inputs**
  - `a`: Input bit A
  - `b`: Input bit B

- **Outputs**
  - `sum`: Sum of inputs A and B
  - `carry`: Carry-out of the addition

#### Functionality

The Half Adder calculates the sum and carry-out for two single-bit binary inputs. The `sum` is computed using XOR operation, and the `carry` is computed using AND operation.

## Testbench Description

The testbench (`tb_ha`) applies the following combinations of inputs to the `ha` module:

1. `a = 0`, `b = 0`
2. `a = 0`, `b = 1`
3. `a = 1`, `b = 0`
4. `a = 1`, `b = 1`

It displays the values of `sum` and `carry` for each input combination and generates a waveform file for visualization.


a b | sum carry

0 0 | 0   0

0 1 | 1   0

1 0 | 1   0

1 1 | 0   1

---


# VCD OUTPUT
  
  ![vcd_half_adder](https://github.com/user-attachments/assets/9322429f-6038-438b-b878-c0f80d06b26c)


# GTKWAVE OUTPUT
  
  ![half_adder](https://github.com/user-attachments/assets/75640c77-54b8-4979-a88d-3e4fc98ba8d4)

# Yosys and Sky130 PDKs

  1] Read Verilog file 
  
  2] Read Liberty file
  
  3] check Hierarchy

  ![read_verilog+liberty+hierarchy](https://github.com/user-attachments/assets/b2953855-1586-4f3e-aec9-ec9c61f47540)


  4] show -

      Create a graphviz DOT file for the selected part of the design and compile it to a graphics file (usually SVG or PostScript).

      Before proc
  
   ![before_proc yosys_show](https://github.com/user-attachments/assets/8297ad67-2fb8-4541-90bd-9c8d22f60231)


 5] proc -

        The command proc converts processes (Yosys’ internal repre- sentation of Verilog always- and initial-blocks) to circuits of multiplexers and storage elements (various types of flip-flops).

   ![proc](https://github.com/user-attachments/assets/8550bee4-6d45-4e3a-8d3f-0ea661087cc8)


 6] techmap -

        This pass implements a very simple technology mapper that replaces cells in the design with implementations given in form of a Verilog or RTLIL source file.

  ![after_techmap yosys_show](https://github.com/user-attachments/assets/f1ed6b09-2c56-4a7b-8a78-c48a88474383)

 7] opt -

        This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups. This pass executes the other passes in the following order:

 8] abc -liberty /home/ajinkya/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

        This pass uses the ABC tool [1] for technology mapping of yosys’s internal gate library to a target architecture.

  ![after_abc yosys_show](https://github.com/user-attachments/assets/253f7aed-e1ff-4b83-b817-92fc4722470e)
  
  ![abc](https://github.com/user-attachments/assets/d451b6f2-b0f5-4930-a001-8c9567a9a320)


9] opt - 

  ![after_abc_opt yosys_show](https://github.com/user-attachments/assets/357061fe-8b3f-4301-97d6-e9e0e52906a6)

10] write_verilog -attr2comment half_adder_netlist.v



