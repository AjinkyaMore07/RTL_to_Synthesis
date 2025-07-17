# Encoder in Digital Electronics

## 📖 Overview

# 🔸 What is an Encoder?
         An encoder is a combinational circuit that converts one of 2ⁿ inputs into an n-bit binary code. It’s the opposite of a decoder.

         A 4x2 encoder has 4 inputs and produces a 2-bit output.

         An 8x3 encoder has 8 inputs and produces a 3-bit output.

         Assumption: Only one input is HIGH at a time. This is called a "one-hot" input.


## 🔧 Types of Encoders Covered

- **4-to-2 Encoder**
- **8-to-3 Encoder**
- **Priority Encoder**
- **Decimal to BCD Encoder**
- **octal to BCD Encoder**

# 🧾 Description

    This project demonstrates the Verilog implementation of basic digital encoders:
    
    ## 4x2 Encoder: Converts 4 input lines into a 2-bit binary code.
    
    ## 8x3 Encoder: Converts 8 input lines into a 3-bit binary code.


---

## ✅ 4x2 Encoder

            module encoder4x2(input [3:0] in, output reg [1:0] y);
              always @(*) begin
                case (in)
                  4'b0001: y = 2'b00;  // Input 0 is active
                  4'b0010: y = 2'b01;  // Input 1 is active
                  4'b0100: y = 2'b10;  // Input 2 is active
                  4'b1000: y = 2'b11;  // Input 3 is active
                  default: y = 2'b00;  // Default case for invalid input
                endcase
              end
            endmodule



        🔹 Explanation:
        input [3:0] in: 4-bit input vector. Each bit represents one input line.

        output reg [1:0] y: 2-bit output that gives the binary representation of which input is active.

        always @(*): This block runs whenever any input changes (combinational logic).

        case (in): Checks which input bit is high.

        Each line like 4'b0010: y = 2'b01; means:

        If only the 2nd input (bit 1) is high, then output 01 (binary for 1).

        🔸 The default case handles unexpected or multiple-high inputs.

---


## ✅ 8x3 Encoder


        module encoder8x3(input [7:0] in, output reg [2:0] y);
          always @(*) begin
            case (in)
              8'b00000001: y = 3'b000; // Input 0
              8'b00000010: y = 3'b001; // Input 1
              8'b00000100: y = 3'b010; // Input 2
              8'b00001000: y = 3'b011; // Input 3
              8'b00010000: y = 3'b100; // Input 4
              8'b00100000: y = 3'b101; // Input 5
              8'b01000000: y = 3'b110; // Input 6
              8'b10000000: y = 3'b111; // Input 7
              default:     y = 3'b000; // Default for invalid or multiple inputs
            endcase
          end
        endmodule



        🔹 Explanation:
        input [7:0] in: 8 input lines.

        output reg [2:0] y: 3-bit binary output.

        Each input line corresponds to a unique binary code on y.

        Example:

        If input = 8'b00100000 (i.e., input 5 is active), then y = 3'b101 (binary for 5).

---


# ⚠️ Important Note

    These are basic encoders, not priority encoders. If more than one input is HIGH at the same time, the result may be unpredictable or default.

---

# VCD Output

<img width="530" height="125" alt="encoder_vcd" src="https://github.com/user-attachments/assets/95a4ab3e-7305-4f22-8b1c-f205fce5dc95" />

---


# GTKWAVE Output

<img width="1910" height="741" alt="gtkwave" src="https://github.com/user-attachments/assets/49aba867-922e-43c9-ad31-e3a25bc57cb8" />

---

# Yosys & SKY130

1] read_verilog 
2] read_liberty
3] hierarchy

<img width="952" height="386" alt="read_Verilog_liberty" src="https://github.com/user-attachments/assets/d29e5803-6f42-4d49-aa2b-fab6b31a6df5" /> 

4] show - 

<img width="460" height="92" alt="before_proc yosys_show" src="https://github.com/user-attachments/assets/aec5a4c4-2e96-4e38-949d-ec36f8e1fc9e" />


5] proc - 

<img width="1299" height="371" alt="proc yosys_show" src="https://github.com/user-attachments/assets/a8408be6-80de-4736-8061-9f113c81ec17" />

6] opt 

<img width="873" height="371" alt="after_proc_opt yosys_show" src="https://github.com/user-attachments/assets/ba1c6a18-63f5-4177-bf1e-f9a68c0e899a" />

7] techmap 

<img width="4804" height="1921" alt="techmap yosys_show" src="https://github.com/user-attachments/assets/75460ddc-9788-4bea-86f5-e39635ce3fa6" />

8] opt 

<img width="3858" height="751" alt="after_techmap_opt yosys_show" src="https://github.com/user-attachments/assets/79300036-808c-4ca2-86e5-209f4c342451" />

9] abc opt

<img width="1357" height="897" alt="abc_opt yosys_show" src="https://github.com/user-attachments/assets/89ba17f2-dff6-4bd9-bc5c-643922bab436" />

10] stat

<img width="529" height="306" alt="stat" src="https://github.com/user-attachments/assets/9650d525-1fc9-4d84-8ba5-7944f2d3fd3b" />


11] write_verilog -attr2comment encoder_netlist.v
