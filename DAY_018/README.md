




















## VCD OUTPUT
## GTKWAVE OUTPUT
## YOSYS AND SKY130

1] read_verilog 2] read_liberty 3] hierarchy check

4] proc
            
    The command proc converts processes (Yosys’ internal repre- sentation of Verilog always- and initial-blocks) to circuits of multiplexers and storage elements (various types of flip-flops).

5] opt

    This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups. 
    
6] techmap

    This pass implements a very simple technology mapper that replaces cells in the design with implementations given in form of a Verilog or RTLIL source file.

7] opt

    This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups.

8] dfflibmap - 

    Map internal flip-flop cells to the flip-flop cells in the technology library specified in the given liberty file.

    This pass may add inverters as needed. Therefore it is recommended to first run this pass and then map the logic paths to the target technology.

    
9] abc

    This pass uses the ABC tool [1] for technology mapping of yosys’s internal gate library to a target architecture.

10] opt
  
    This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups. 
    

11] stat -


12] show - 

     Create a graphviz DOT file for the selected part of the design and compile it to a graphics file (usually SVG or PostScript).

  

13] write_verilog

    Write the current design to a Verilog file.
