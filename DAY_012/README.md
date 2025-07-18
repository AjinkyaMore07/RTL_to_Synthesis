<img width="682" height="293" alt="Screenshot from 2025-07-15 21-48-54" src="https://github.com/user-attachments/assets/b0ab945e-b714-473d-b658-02b3fd8df47a" /># ✅ What is a Priority Encoder?

A priority encoder is a combinational logic circuit that takes multiple binary inputs and encodes them into a smaller number of output bits, giving priority to the highest-order active input (i.e., the most significant input with logic '1').

It ensures that only the highest-priority input is considered when multiple inputs are active at the same time.

---

# 🧠 Working Principle:

    If more than one input is high (1), the encoder outputs the binary code of the highest-priority input.

    It usually has an additional output called “Valid” or “Output Enable”, which indicates whether any input is active.


    | Inputs (I3 I2 I1 I0) | Output (Y1 Y0) | Valid |

    | -------------------- | -------------- | ----- |
    
    | 0000                 | --             | 0     |

    | 0001                 | 00             | 1     |

    | 0010                 | 01             | 1     |

    | 0100                 | 10             | 1     |

    | 1000                 | 11             | 1     |

    | 1010                 | 11             | 1     |

    | 1100                 | 11             | 1     |


---


# 🧩 Types of Priority Encoders:

  🔸 Fixed Priority Encoder

        The priority is hardwired and fixed (e.g., I3 > I2 > I1 > I0).
        Most commonly used.
        
  🔸4 Input Priority Encoder
  🔸Decimal to BCD Priority Encoder
  🔸Octal to Binary Priority Encoder


---


# ⚙️ Applications of Priority Encoders:

  ✅ Interrupt Controllers in Microprocessors:

        Decides which interrupt request to serve first when multiple interrupts occur.

  ✅ Arbitration in Bus Systems:

        Determines which device gets control of a shared bus.

  ✅ Digital Systems / Embedded Systems:

        Detecting highest-priority event, sensor, or signal.

  ✅ Data Compression and Encoding Systems

  
  ✅ Communication Systems:

        Channel selection or priority-based data transmission.

  ✅ Multiprocessor Systems:

        Handling multiple concurrent requests and resolving priorities.



---

# Verilog_code
        
        module encoder(
          input [3:0] in,
          input en,
          output reg [1:0] y
        );
        
          always @(*) begin
            if (en) begin
              casex (in)
                4'b1xxx: y = 2'b11;
          	    4'b01xx: y = 2'b10;
            	4'b001x: y = 2'b01;
            	4'b0001: y = 2'b00;
            	default: y = 2'b00;  // Optional: fallback for invalid/multiple-bit input
              endcase
            end else begin
              y = 2'b00; // Output 0 when disabled
            end
          end
        
        endmodule


---

# Testbench

        module tb();
        reg [3:0]in;
        reg en;
        wire [1:0]y;
        
        encoder dut(in,en,y);
        
        integer i;
        initial begin
          en =0;
          #10;
          for(i = 0 ; i < 15 ; i = i + 1)
            begin
        	    en =1;
            	    in = i;
                #10;
            end
        end
        
        initial begin
         $monitor("Time = %0t , in = %0d , en = %0d , y= %0d ",$time,in,en,y);
         $dumpfile("encoder.vcd");
         $dumpvars(0,tb);
        end
        
        endmodule



---

# VCD Output

  <img width="682" height="293" alt="Screenshot from 2025-07-15 21-48-54" src="https://github.com/user-attachments/assets/5d731358-78cc-42e4-bf45-bd33bcbcbdaf" />

# GTKWAVE OUTPUT

  <img width="1910" height="627" alt="gtkwave" src="https://github.com/user-attachments/assets/b4a0cafb-9108-48d5-9c96-d2db100dd4fc" />




# YOSYS and SKY130 


