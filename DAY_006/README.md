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
