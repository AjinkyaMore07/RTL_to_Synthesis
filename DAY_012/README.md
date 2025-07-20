<img width="3195" height="707" alt="after_techmap_opt yosys_show" src="https://github.com/user-attachments/assets/7c2461b4-72b7-475d-9815-73769792cee5" /># ✅ What is a Priority Encoder?

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



# VCD Output

  <img width="682" height="293" alt="Screenshot from 2025-07-15 21-48-54" src="https://github.com/user-attachments/assets/4426da6c-6171-4a1d-bac4-60149dabe6ba" />

# GTKWAVE OUTPUT
 
  <img width="1910" height="627" alt="gtkwave" src="https://github.com/user-attachments/assets/538e51d4-df91-4249-bb2a-898fa1df8ba8" />

# YOSYS and SKY130 

1] Read Verilog file 
2] Read Liberty file 
3] check Hierarchy

4] show -
            
            Create a graphviz DOT file for the selected part of the design and compile it to a graphics file (usually SVG or PostScript).
            
5] proc - 
            
            The command proc converts processes (Yosys’ internal repre- sentation of Verilog always- and initial-blocks) to circuits of multiplexers and storage elements (various types of flip-flops).

   <img width="1173" height="492" alt="after_proc_opt yosys_show" src="https://github.com/user-attachments/assets/9907b380-1e1e-4f15-a7a6-d45f3a9e0e05" />


6] techmap -

            This pass implements a very simple technology mapper that replaces cells in the design with implementations given in form of a Verilog or RTLIL source file.

   <img width="3195" height="707" alt="after_techmap_opt yosys_show" src="https://github.com/user-attachments/assets/99b82c57-e18c-4099-b20a-41e5e83aab75" />

7] opt - 

            This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups. This pass executes the other passes in the following order:


8]  abc -liberty /home/ajinkya/lib/sky130_fd_sc_hd__tt_025C_1v80.lib 

            This pass uses the ABC tool [1] for technology mapping of yosys’s internal gate library to a target architecture.

  <img width="1313" height="430" alt="after_abc_opt yosys_show" src="https://github.com/user-attachments/assets/2bb76a31-5311-4e0a-93b2-5769d612dc30" />


9] write_verilog -attr2comment Full_adder_netlist.v


