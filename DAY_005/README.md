# Ripple Carry Adder in Verilog

## Overview

The `ripple_carry_Adder` module adds two 4-bit binary numbers along with a carry-in bit and outputs a 4-bit sum and a carry-out bit. The carry-out of each Full Adder is passed to the next Full Adder, creating a ripple effect.

## Files

- `Fa.v`: Verilog module for the Full Adder used in the Ripple Carry Adder.
- `ripple_carry_Adder.v`: Verilog module for the Ripple Carry Adder.
- `tb_ripple_carry_Adder.v`: Testbench for the Ripple Carry Adder module.

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

The Full Adder computes the sum and carry-out of three single-bit binary inputs using XOR, AND, and OR operations.

### Ripple Carry Adder (`ripple_carry_Adder`)

#### Ports

- **Inputs**
  - `a_in`: 4-bit input vector A
  - `b_in`: 4-bit input vector B
  - `c_in`: Carry-in bit

- **Outputs**
  - `sum`: 4-bit sum output
  - `carry`: Carry-out of the addition

#### Functionality

The Ripple Carry Adder uses four Full Adders connected in series to perform the addition of two 4-bit binary numbers. The carry-out from each Full Adder is fed into the next Full Adder as its carry-in.

## Testbench Description

The testbench (`tb_ripple_carry_Adder`) applies various input combinations to the `ripple_carry_Adder` module and displays the results. It verifies the correctness of the adder by covering different input scenarios.

### Test Cases

1. **Inputs**: `a_in = 0000`, `b_in = 0000`, `c_in = 0`  
   **Outputs**: `sum = 0000`, `carry = 0`

2. **Inputs**: `a_in = 0101`, `b_in = 0011`, `c_in = 0`  
   **Outputs**: `sum = 1000`, `carry = 0`

3. **Inputs**: `a_in = 1100`, `b_in = 1010`, `c_in = 0`  
   **Outputs**: `sum = 0110`, `carry = 1`

4. **Inputs**: `a_in = 0111`, `b_in = 1001`, `c_in = 1`  
   **Outputs**: `sum = 0001`, `carry = 1`

5. **Inputs**: `a_in = 1110`, `b_in = 1111`, `c_in = 1`  
   **Outputs**: `sum = 1110`, `carry = 1`

6. **Inputs**: `a_in = 0010`, `b_in = 0101`, `c_in = 0`  
   **Outputs**: `sum = 0111`, `carry = 0`

7. **Inputs**: `a_in = 1011`, `b_in = 1101`, `c_in = 0`  
   **Outputs**: `sum = 1000`, `carry = 1`

8. **Inputs**: `a_in = 1111`, `b_in = 0001`, `c_in = 1`  
   **Outputs**: `sum = 0001`, `carry = 1`

---

a_in   b_in   c_in | sum    carry

------------------------------

0000   0000   0   | 0000  0

0101   0011   0   | 1000  0

1100   1010   0   | 0110  1

0111   1001   1   | 0001  1

1110   1111   1   | 1110  1

0010   0101   0   | 0111  0

1011   1101   0   | 1000  1

1111   0001   1   | 0001  1

---

