# Decimal to BCD Converter (Verilog)

## 📘 Overview

        The module takes a one-hot encoded 10-bit input representing decimal digits 0 through 9 and produces a corresponding 4-bit BCD output.

## 🔢 What is BCD?
        Binary-Coded Decimal (BCD) is a class of binary encodings for decimal numbers where each digit is represented by its own binary sequence. In standard BCD (also called 8421 BCD), each decimal digit (0–9) is represented by a 4-bit binary number:


        | Decimal | BCD (4-bit) |

        | ------- | ----------- |

        | 0       | 0000        |
        
        | 1       | 0001        |

        | 2       | 0010        |

        | 3       | 0011        |

        | 4       | 0100        |

        | 5       | 0101        |

        | 6       | 0110        |

        | 7       | 0111        |

        | 8       | 1000        |

        | 9       | 1001        |


---



## 📁 File: bcd.v
        The module converts a 10-bit one-hot encoded input (only one bit is high representing a decimal digit) to a 4-bit   BCD output.


        | Port Name | Direction | Width  | Description                               |
        
        | --------- | --------- | ------ | ----------------------------------------- |

        | `in`      | Input     | \[9:0] | One-hot encoded input (only one bit high) |

        | `en`      | Input     | 1 bit  | Enable signal (active high)               |
        
        | `y`       | Output    | \[3:0] | 4-bit BCD output representing the digit   |


---



## ⚙️ Functionality

        When en is high:

        The 10-bit input in is checked using a case statement.

        The corresponding BCD output is assigned to y.

        For example, if in = 10'b0000001000 (decimal 3), y = 4'd3 → 0011.

        If en is low or if the input does not match any valid one-hot encoding, the output y is set to 0000.



---

## 📌 Notes

        Input must be one-hot encoded — only one bit should be high at a time.

        If multiple or no bits are high, the output defaults to 0000.

        This is a basic decoder and not a general-purpose decimal-to-BCD converter for larger numbers.


---


# Verilog Code


           module bcd(in,en,y);
            input [9:0]in;
            input en;
            output reg [3:0]y;

            always @(*)
             begin
              if(en)
                begin
                  case(in)
        10'b0000000001 : y = 4'd0;
        10'b0000000010 : y = 4'd1;
        10'b0000000100 : y = 4'd2;
        10'b0000001000 : y = 4'd3;
        10'b0000010000 : y = 4'd4;
        10'b0000100000 : y = 4'd5;
        10'b0001000000 : y = 4'd6;
        10'b0010000000 : y = 4'd7     
        10'b0100000000 : y = 4'd8;
        10'b1000000000 : y = 4'd9;
        default : y = 4'b0000;
        endcase
        end
        else
        y = 4'b0000;
        end

        endmodule


---

# Testbench

        module tb();
        reg [9:0] in;
        reg en;
        wire [3:0]y;

        bcd dut(in,en,y);

        integer i;

        initial begin
         for(i = 0 ;i < 10 ;i = i + 1)
          begin
            en = 1'b1;
            in[i]= 1'b1;
            #10;
            in = 10'b0;
          end
         $finish;
        end

        initial begin
         $monitor("Time = %0t , in = %0d , en = %0d , y = %0d",$time,in,en,y);
         $dumpfile("decimal_bcd.vcd");
         $dumpvars(0,tb);
        end
        endmodule

---

