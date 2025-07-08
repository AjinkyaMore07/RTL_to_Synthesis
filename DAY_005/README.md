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

# VCD_OUTPUT

![vcd_output](https://github.com/user-attachments/assets/3af15fa8-efb9-45d1-894d-fef2a48dc6a4)

# GTKWAVE OUTPUT

![gtkwave_output](https://github.com/user-attachments/assets/c4cc6e93-a9e2-4cd0-a003-d36cb6200ae7)

# YOSYS AND SKY130 PDK

1] Read_verilog 

2] Read liberty 

  ![verilog+liberty](https://github.com/user-attachments/assets/e1218a3b-9cf0-4953-b62d-adcf65ac6119)

3] Hierarchy check
  
  ![hierarchy_check](https://github.com/user-attachments/assets/55fdeeb4-762f-4f61-9db0-5cc13473d092)

4] show -

        Create a graphviz DOT file for the selected part of the design and compile it to a graphics file (usually SVG or PostScript).

        Before proc

  ![before_proc yosys_show](https://github.com/user-attachments/assets/e5debd41-9c0b-45b4-a4d5-9482bf20e56c)

---

  ![before_proc_full_adder yosys_show](https://github.com/user-attachments/assets/043324e7-c9d4-4f74-9513-c5ad303d108b)

---


5] proc -

        The command proc converts processes (Yosys’ internal repre- sentation of Verilog always- and initial-blocks) to circuits of multiplexers and storage elements (various types of flip-flops).

  ![after_proc yosys_show](https://github.com/user-attachments/assets/7c16452e-9be5-4445-b4ff-1dc3fbc549dd)

---

  ![after_proc_full_adder yosys_show](https://github.com/user-attachments/assets/8d8c82b5-3aaf-4113-b6f9-bc23e5835503)

---


6] opt - 

  ![after_proc_opt_RCA yosys_show](https://github.com/user-attachments/assets/9a83c962-c7de-4f0f-a9af-062a7ed79032)
  
  ![after_proc_opt_full_Adder yosys_show png yosys_show](https://github.com/user-attachments/assets/f035876e-0f22-4491-82f3-a845365bf5d4)


7] techmap -

        This pass implements a very simple technology mapper that replaces cells in the design with implementations

      
  ![after_techmap yosys_show](https://github.com/user-attachments/assets/3ca9f998-f9c7-43e8-ac49-f60a0478cab5)


8]  abc -liberty /home/ajinkya/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

        This pass uses the ABC tool [1] for technology mapping of yosys’s internal gate library to a target architecture.

  
  ![after_abc_opt_RCA yosys_show](https://github.com/user-attachments/assets/612610c7-dda1-4c7a-90ad-53d1b724d867)

---

  ![after_abc_opt_Full_adder yosys_show](https://github.com/user-attachments/assets/954b8100-5f7e-45e7-b4d3-ce7c2059d5c3)

---

9] Stat check - 

    Before Opt - 
    
  ![after_opt_stat](https://github.com/user-attachments/assets/22fce095-45df-4071-84fd-18d2ac3e5fa8)

    After Opt - 

  ![stats](https://github.com/user-attachments/assets/7735bba5-b317-4d63-be9e-3481e09c5fdb)

---


10] Write_verilog -attr2comment RCA_netlist.v
