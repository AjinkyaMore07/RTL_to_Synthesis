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

# VCD OUTPUT

   <img width="717" height="228" alt="vcd" src="https://github.com/user-attachments/assets/379f5815-d8c6-46b0-8f35-843a1bb24d9b" />


# GTKWAVE

   <img width="1918" height="545" alt="gtkwave" src="https://github.com/user-attachments/assets/75fcb29f-cce4-4d33-a420-7d521eecfa56" />



# Yosys and Sky130 PDKs

1] Read Verilog file 
2] Read Liberty file 
3] check Hierarchy

  <img width="967" height="396" alt="verilog+liberty" src="https://github.com/user-attachments/assets/99545d37-8fc7-4e64-b6f2-291dfe85d262" />

  
4] 4] show -
            
            Create a graphviz DOT file for the selected part of the design and compile it to a graphics file (usually SVG or PostScript).

            Before proc

    
5] proc - 
            
            The command proc converts processes (Yosys’ internal repre- sentation of Verilog always- and initial-blocks) to circuits of multiplexers and storage elements (various types of flip-flops).
    
  <img width="2451" height="806" alt="proc yosys_show" src="https://github.com/user-attachments/assets/c0fa7d3e-9fff-40f8-bc75-09b92c173c17" />



6] opt - 

 <img width="1671" height="806" alt="proc_opt yosys_show" src="https://github.com/user-attachments/assets/49439ead-5a57-46f0-aa33-d4b03ca2feeb" />



6] techmap -

            This pass implements a very simple technology mapper that replaces cells in the design with implementations given in form of a Verilog or RTLIL source file.

 <img width="8012" height="13361" alt="techmap yosys_show" src="https://github.com/user-attachments/assets/f0ceb048-8ecc-4e14-a6a0-a7510b7c5240" />

 


7] opt - 

            This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups. This pass executes the other passes in the following order:

  <img width="7979" height="2386" alt="techmap opt yosys_show" src="https://github.com/user-attachments/assets/60889836-a036-4b0b-a8bc-8f7d09e9a4c3" />


  
     
8]  abc -liberty /home/ajinkya/lib/sky130_fd_sc_hd__tt_025C_1v80.lib 

            This pass uses the ABC tool [1] for technology mapping of yosys’s internal gate library to a target architecture.

   <img width="2996" height="3457" alt="abc yosys_show" src="https://github.com/user-attachments/assets/62bfb3a7-3a10-42bd-ad7a-84de02514610" />



9] opt 

  <img width="2695" height="2896" alt="abc_opt yosys_show" src="https://github.com/user-attachments/assets/ef7581a8-6df1-4b3b-b731-0db11b037307" />



10] stat - 

   <img width="572" height="519" alt="stat" src="https://github.com/user-attachments/assets/7bca5b07-4530-4fcf-b72e-069d1061faaa" />
 
11] write_verilog -attr2comment Full_adder_netlist.v


