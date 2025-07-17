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
