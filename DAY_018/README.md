# Verilog Code

            module dff_sync_reset(input d , clk ,reset, output reg q);
            
            always @(posedge clk)
             begin
              if(reset)
                q <= 1'b0;
              else
                q <= d;
             end
            endmodule


# Test Bench
            
            module tb();
            reg d, clk = 0, reset;
            wire q;
            
            dff_sync_reset dut(.d(d), .clk(clk), .reset(reset), .q(q));
            
            // Clock generator
            always #5 clk = ~clk;
            
            integer i;
            
            initial begin
              // Initialize signals
              d = 0;
              reset = 1;
            
              // Apply reset for 4 clock cycles
              repeat(4) @(posedge clk);
              reset = 0;
            
              // Stimulate data input
              for(i = 0; i < 10; i = i + 1) begin
                d = $urandom_range(0,1);
                @(posedge clk);
              end
            
              #10 $finish;
            end
            
            initial begin
              $monitor("Time = %0t | d = %b | clk = %b | reset = %b | q = %b", $time, d, clk, reset, q);
              $dumpfile("dff.vcd");
              $dumpvars(0, tb);
            end
            
            endmodule
---



## VCD OUTPUT

<img width="671" height="658" alt="vcd" src="https://github.com/user-attachments/assets/f8aed78f-f129-4ff8-bff5-21ba815b8de4" />

## GTKWAVE OUTPUT

<img width="1863" height="588" alt="gtkwave" src="https://github.com/user-attachments/assets/8c47a94b-0c2f-4fa6-8ae3-a1a534f81ba4" />


## YOSYS AND SKY130

1] read_verilog 2] read_liberty 3] hierarchy check



4] proc
            
    The command proc converts processes (Yosys’ internal repre- sentation of Verilog always- and initial-blocks) to circuits of multiplexers and storage elements (various types of flip-flops).

  <img width="1006" height="235" alt="proc yosys_show" src="https://github.com/user-attachments/assets/e4c09168-82e8-4376-b873-7dfa142e0e54" />
 

5] opt

    This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups. 

<img width="459" height="233" alt="proc_opt yosys_show" src="https://github.com/user-attachments/assets/e48da328-067b-44e1-a531-3a3934c2ed9b" />

    
6] techmap

    This pass implements a very simple technology mapper that replaces cells in the design with implementations given in form of a Verilog or RTLIL source file.


<img width="506" height="233" alt="techmap yosys_show" src="https://github.com/user-attachments/assets/b65f1240-e422-45d6-8742-abb64f7408cf" />


7] opt

    This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups.

<img width="506" height="233" alt="techmap_opt yosys_show" src="https://github.com/user-attachments/assets/c20ab077-2dcd-41b1-bd3a-5daa12e6e6b5" />



8] dfflibmap - 

    Map internal flip-flop cells to the flip-flop cells in the technology library specified in the given liberty file.

    This pass may add inverters as needed. Therefore it is recommended to first run this pass and then map the logic paths to the target technology.


<img width="866" height="256" alt="dfflibmap yosys_show" src="https://github.com/user-attachments/assets/bbc5dd72-a375-435a-8ba1-ca12ce1ead00" />

    
9] abc

    This pass uses the ABC tool [1] for technology mapping of yosys’s internal gate library to a target architecture.

<img width="1306" height="197" alt="abc yosys_show" src="https://github.com/user-attachments/assets/7a6d4fde-80ca-4f72-b09a-85d1649d023a" />


10] opt
  
    This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups. 

 <img width="1066" height="205" alt="abc_opt yosys_show" src="https://github.com/user-attachments/assets/8fbf57f0-144b-4452-855c-2207b3c38454" />


11] show - 

     Create a graphviz DOT file for the selected part of the design and compile it to a graphics file (usually SVG or PostScript).

  

13] write_verilog

    Write the current design to a Verilog file.
