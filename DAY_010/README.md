# Parallel Adder in Verilog

## Overview

The `parallel_adder` module performs the addition of two 4-bit binary numbers with an additional carry-in. It outputs a 4-bit sum and a carry-out.

## Files

- `Fa.v`: Verilog module for the Full Adder used in the Parallel Adder.
- `parallel_adder.v`: Verilog module for the Parallel Adder.
- `tb_parallel_adder.v`: Testbench for the Parallel Adder module.

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

The Full Adder calculates the sum and carry-out for three single-bit binary inputs using XOR, AND, and OR operations.

### Parallel Adder (`parallel_adder`)

#### Ports

- **Inputs**
  - `a_in`: 4-bit input vector A
  - `b_in`: 4-bit input vector B
  - `c_in`: Carry-in bit

- **Outputs**
  - `sum`: 4-bit sum output
  - `carry`: Carry-out of the addition

#### Functionality

The Parallel Adder uses four Full Adders in series to compute the sum and carry-out of two 4-bit binary numbers. The carry-out of each Full Adder is passed to the next Full Adder as its carry-in.

## Testbench Description

The testbench (`tb_parallel_adder`) applies various input combinations to the `parallel_adder` module and displays the results. It covers different cases to verify the correctness of the addition.

### Test Cases

1. **Inputs**: `a_in = 0000`, `b_in = 0000`, `c_in = 0`  
   **Outputs**: `sum = 0000`, `carry = 0`

2. **Inputs**: `a_in = 0001`, `b_in = 0001`, `c_in = 0`  
   **Outputs**: `sum = 0010`, `carry = 0`

3. **Inputs**: `a_in = 0011`, `b_in = 0011`, `c_in = 0`  
   **Outputs**: `sum = 0110`, `carry = 0`

4. **Inputs**: `a_in = 0111`, `b_in = 0111`, `c_in = 0`  
   **Outputs**: `sum = 1110`, `carry = 0`

5. **Inputs**: `a_in = 1111`, `b_in = 1111`, `c_in = 0`  
   **Outputs**: `sum = 1110`, `carry = 1`

6. **Inputs**: `a_in = 0101`, `b_in = 1010`, `c_in = 1`  
   **Outputs**: `sum = 1111`, `carry = 0`

7. **Inputs**: `a_in = 1110`, `b_in = 0001`, `c_in = 1`  
   **Outputs**: `sum = 0000`, `carry = 1`

8. **Inputs**: `a_in = 1010`, `b_in = 0101`, `c_in = 1`  
   **Outputs**: `sum = 0000`, `carry = 1`

