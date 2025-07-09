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

#   VCD OUTPUT

  ![vcd_output](https://github.com/user-attachments/assets/bd202c9d-f458-4e63-9633-fd2c30f3edff)

# GTKWAVE OUTPUT

  ![cla_gtkwave](https://github.com/user-attachments/assets/fe4f3c05-28eb-4e05-894f-a8bba7ca8a72)

# YOSYS AND SKYWATER130

  1] Read Verilog
  2] Read liberty
  3] Hierarchy check
    
  ![verilog+liberty+hierarchy](https://github.com/user-attachments/assets/6f990408-dbcb-43da-879e-b377c8c8f152)

4] show - 

  ![before_proc yosys_show](https://github.com/user-attachments/assets/a1a7bb18-1df7-47c7-9504-b6151e9106b3)

5] proc -

  ![after_proc yosys_show](https://github.com/user-attachments/assets/d2779772-bf48-41ee-804e-316755f7617f)

6] opt - 

  ![after_proc_opt yosys_show](https://github.com/user-attachments/assets/3ed98ba1-f508-435f-aef5-1f899cfea1d1)

7] Techmap -
  
  ![after_techmap yosys_show](https://github.com/user-attachments/assets/015865c7-09a6-42e9-94ef-4c30a80bcc88)
 
8] opt - 
  
  ![after_techmap_opt yosys_show](https://github.com/user-attachments/assets/64e36608-bc16-469b-ad58-0672a264f539)

9] abc -liberty 

  ![after_abc yosys_show](https://github.com/user-attachments/assets/fb3b34a3-ed66-40e5-9fe3-7f2a8da10ace)

10] opt - 

  ![after_abc_opt yosys_show](https://github.com/user-attachments/assets/62d0f436-d8b6-48f6-a351-6fbcfe0b5596)

11] stat - 

  ![stat](https://github.com/user-attachments/assets/d59c38ab-772e-4689-a0d5-1ec7da77ea91)

12] write_verilog -attr2comment cla_netlist.v

  



    
  
   
