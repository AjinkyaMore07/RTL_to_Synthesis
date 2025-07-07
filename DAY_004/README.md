# Full Adder in Verilog

## Overview

The `Fa` module implements a Full Adder, a fundamental digital circuit that adds three single-bit binary numbers. It produces a sum and a carry-out output.

## Files

- `Fa.v`: Verilog module for the Full Adder.
- `tb_Fa.v`: Testbench for the Full Adder module.

## Module Description

### Full Adder (`Fa`)

#### Ports

- **Inputs**
  - `a_in`: Input bit A
  - `b_in`: Input bit B
  - `c_in`: Carry-in bit

- **Outputs**
  - `sum`: Sum of inputs A, B, and C
  - `carry`: Carry-out of the addition

#### Functionality

The Full Adder calculates the sum and carry-out for three single-bit binary inputs. The `sum` is computed using XOR operation, and the `carry` is computed using AND and OR operations.

## Testbench Description

The testbench (`tb_Fa`) applies the following combinations of inputs to the `Fa` module:

1. `a_in = 0`, `b_in = 0`, `c_in = 0`
2. `a_in = 0`, `b_in = 0`, `c_in = 1`
3. `a_in = 0`, `b_in = 1`, `c_in = 0`
4. `a_in = 0`, `b_in = 1`, `c_in = 1`
5. `a_in = 1`, `b_in = 0`, `c_in = 0`
6. `a_in = 1`, `b_in = 0`, `c_in = 1`
7. `a_in = 1`, `b_in = 1`, `c_in = 0`
8. `a_in = 1`, `b_in = 1`, `c_in = 1`

It displays the values of `sum` and `carry` for each input combination and generates a waveform file for visualization.

a_in b_in c_in | sum carry

0    0    0    | 0   0

0    0    1    | 1   0

0    1    0    | 1   0

0    1    1    | 0   1

1    0    0    | 1   0

1    0    1    | 0   1

1    1    0    | 0   1

1    1    1    | 1   1

---

# VCD OUTPUT

![full_adder_vcd](https://github.com/user-attachments/assets/ff68e91c-ce50-441e-ba0b-913bd5af82b5)


# GTKWAVE

![full_adder_gtkwave](https://github.com/user-attachments/assets/1252f774-8883-428b-91a7-881ddf254f62)



# Yosys and Sky130 PDKs

1] Read Verilog file 
2] Read Liberty file 
3] check Hierarchy

 ![verilog+liberty+hierarchy](https://github.com/user-attachments/assets/3831e895-a1f5-4bf0-8ed6-5d36d89a0d3b)


    
4] 4] show -
            
            Create a graphviz DOT file for the selected part of the design and compile it to a graphics file (usually SVG or PostScript).

            Before proc
 
  ![before_proc yosys_show](https://github.com/user-attachments/assets/98d628a4-d203-41ed-8c9c-5b731fab1258)


    
5] proc - 
            
            The command proc converts processes (Yosys’ internal repre- sentation of Verilog always- and initial-blocks) to circuits of multiplexers and storage elements (various types of flip-flops).
    
  ![after_proc yosys_show](https://github.com/user-attachments/assets/84d92d7a-3efe-4a21-8357-82a3c662a95b)

6] opt - 

  ![after_proc_opt yosys_show](https://github.com/user-attachments/assets/dcac23df-7e5d-487e-b7d1-2574d38f5ab4)


6] techmap -

            This pass implements a very simple technology mapper that replaces cells in the design with implementations given in form of a Verilog or RTLIL source file.

  ![after_techmap yosys_show](https://github.com/user-attachments/assets/a638e19b-6a63-4fcc-a02c-1d8d9e7e6371)



7] opt - 

            This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups. This pass executes the other passes in the following order:

  ![after_techmap_opt yosys_show](https://github.com/user-attachments/assets/a986b755-494a-42e3-bbdc-1142575ad0ef)

  
     
8]  abc -liberty /home/ajinkya/lib/sky130_fd_sc_hd__tt_025C_1v80.lib 

            This pass uses the ABC tool [1] for technology mapping of yosys’s internal gate library to a target architecture.

![after_abc yosys_show](https://github.com/user-attachments/assets/1aa9776b-d62b-479d-af94-73d5f89873ab)


9] opt 

![after_abc_opt yosys_show](https://github.com/user-attachments/assets/fb812b61-d686-4901-99ba-e33b09bd974c)

10] write_verilog -attr2comment Full_adder_netlist.v




    


