# Carry Lookahead Adder (CLA) Implementation in Verilog

## Overview

## Files

- `cla.v`: Verilog code for the 4-bit Carry Lookahead Adder.
- `tb_cla.v`: Testbench for the CLA module to verify its correctness.

## Carry Lookahead Adder (CLA)

### Description

The Carry Lookahead Adder (CLA) computes the sum of two 4-bit binary numbers with reduced delay compared to the Ripple Carry Adder (RCA). The CLA achieves this by calculating the carry signals in advance based on the generate and propagate signals for each bit.

### Module: cla.v

#### Ports

- `input [3:0] a, b`: 4-bit input operands.
- `input cin`: Carry-in input.
- `output [3:0] sum`: 4-bit sum output.
- `output carry`: Carry-out output.

#### Logic

The CLA module computes the sum and carry as follows:
1. Calculate the intermediate carry signals using generate and propagate logic.
2. Compute the sum bits using XOR operation on the input bits and the carry bits.

### Testbench: tb_cla.v

The testbench applies a set of test vectors to the CLA module and verifies its functionality. The test vectors include various combinations of input operands and carry-in values.

## Advantages and Disadvantages of CLA

### Advantages
1. **Speed**: Reduces propagation delay compared to Ripple Carry Adders.
2. **Scalability**: More scalable for larger bit-widths.
3. **Efficiency in Parallel Computation**: Suitable for high-performance computing.

### Disadvantages
1. **Complexity**: More complex to design and understand.
2. **Area and Power Consumption**: Increases silicon area and power consumption.
3. **Fan-Out**: Higher fan-out requires more robust buffering.

--- 

# VCD_OUTPUT

  ![vcd_output](https://github.com/user-attachments/assets/2655ddb1-dd07-4a50-8c6d-0b090e78481d)

# GTKWAVE OUTPUT
  
  ![cla_gtkwave](https://github.com/user-attachments/assets/21cd4569-422f-4e45-9ccd-fdb41e1b1d5c)

# YOSYS AND SKYWATER 

1] Read Verilog
2] Read Liberty
3] Hierarchy Check

  ![verilog+liberty+hierarchy](https://github.com/user-attachments/assets/1bc3c20a-97ae-49c0-b1f1-edb769ad3c10)


4] show - 


  ![before_proc yosys_show](https://github.com/user-attachments/assets/b2951d53-94cd-4b7e-b6ec-42ff724283a3)

5] proc 

       The command proc converts processes (Yosys’ internal repre- sentation of Verilog always- and initial-blocks) to circuits of multiplexers and storage elements (various types of flip-flops).

  ![after_proc yosys_show](https://github.com/user-attachments/assets/c1b6e0b0-e9cd-4960-a37e-2f164bd4e387)

6] opt - 

  ![after_proc_opt yosys_show](https://github.com/user-attachments/assets/5a4a0335-6dcf-4e3b-b75d-b5218d0593e0)

7] Techmap - 

  ![after_techmap yosys_show](https://github.com/user-attachments/assets/fa395da5-5d52-4d93-8e31-05738827148c)

8] Opt - 

              This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups. This pass executes the other passes in the following order:

  ![after_techmap_opt yosys_show](https://github.com/user-attachments/assets/2f2b5980-fead-4fe5-a513-62839b442b1c)

9]  abc -liberty /home/ajinkya/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

        This pass uses the ABC tool [1] for technology mapping of yosys’s internal gate library to a target architecture.
  
  ![after_abc yosys_show](https://github.com/user-attachments/assets/311a0a24-2b51-42e2-b51f-88dd8bf24aef)


10] opt - 

   ![after_abc_opt yosys_show](https://github.com/user-attachments/assets/24468f56-c816-4804-b690-e3341b214cc2)

11] 10] write_verilog -attr2comment CLA_netlist.v
