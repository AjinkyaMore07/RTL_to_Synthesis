# Multiplexers (MUX)

A multiplexer (MUX) is a digital switch that allows multiple input signals and transmits one of them to a single output line based on control signals. It can select one of many data inputs and forward it to the output.

Types of Multiplexers

    2-to-1 Multiplexer: Selects between 2 inputs using 1 control signal.
    4-to-1 Multiplexer: Selects between 4 inputs using 2 control signals.
    8-to-1 Multiplexer: Selects between 8 inputs using 3 control signals.
    16-to-1 Multiplexer: Selects between 16 inputs using 4 control signals.
    Analog Multiplexers: These can handle analog signals and are used in applications like audio signal routing.

# Advantages of Multiplexers

    Efficient Utilization of Resources: Multiplexers allow multiple signals to share a single device or resource.
    Cost-Effective: Reduce the number of required hardware components, saving on costs.
    Simplified Design: Simplifies the design and layout of complex circuits.
    Flexibility: Easily reconfigurable for different applications and purposes.
    Speed: Can switch rapidly between inputs, providing high-speed data transmission.

# Applications of Multiplexers

    Communication Systems: Used in telecommunications to combine multiple signals into one for transmission over a single line.
    Data Routing: Directs data from multiple sources to a single destination.
    Digital Signal Processing: Essential in systems that process multiple digital signals.
    Microprocessors: Utilized in CPUs to select data from registers, memory locations, or other sources.
    Control Systems: Used to manage and route control signals within complex machinery.

# Real-Life Circuit Uses
 
    Computer Memory: Multiplexers are used to select memory addresses in RAM.
    Data Acquisition Systems: Involves gathering data from multiple sensors and routing it to a single processor.
    Television Systems: Used in set-top boxes and digital TV systems to select channels.
    Audio Systems: Rout audio signals from different sources to a single speaker or recording device.
    Industrial Automation: Employed in PLCs (Programmable Logic Controllers) to route sensor inputs to processing units.

# Example of a Multiplexer in a Real-Life Circuit

# Digital Communication System:

    Description: In a digital communication system, multiple data streams from various sources need to be sent over a single communication line to a remote destination.
    Implementation: A multiplexer selects one of the input data streams based on control signals and forwards it to the communication line. At the receiving end, a demultiplexer separates the combined data       back into the original data streams.

---
# VCD OUTPUT

  ![vcd_mux2x1](https://github.com/user-attachments/assets/2da787e9-88db-42fa-bb80-253ec918d0ad)


# GTKWAVE OUTPUT 
 
 ![mux2x1](https://github.com/user-attachments/assets/03de4c2f-76be-46ea-a64b-2f97b351f794)



# Yosys and Sky130 PDKs

1] Read Verilog file 
2] Read Liberty file 
3] check Hierarchy

  ![verilog+liberty+hierarchy](https://github.com/user-attachments/assets/30915068-64de-444c-b792-6c9bc535eac1)

    
4] 4] show -
            
            Create a graphviz DOT file for the selected part of the design and compile it to a graphics file (usually SVG or PostScript).

            Before proc
  ![before_proc yosys_show](https://github.com/user-attachments/assets/68b9050f-832e-401a-8653-aa9b9831a1d6)

    
5] proc - 
            
            The command proc converts processes (Yosys’ internal repre- sentation of Verilog always- and initial-blocks) to circuits of multiplexers and storage elements (various types of flip-flops).
    
  ![proc](https://github.com/user-attachments/assets/85c5d1aa-de9f-4e8e-809f-1df50b140c10)


6] techmap -

            This pass implements a very simple technology mapper that replaces cells in the design with implementations given in form of a Verilog or RTLIL source file.

  ![techmap](https://github.com/user-attachments/assets/c7e4d4ab-d422-42e1-876a-6e5e3741333e)

7] opt - 

            This pass calls all the other opt_* passes in a useful order. This performs a series of trivial optimizations and cleanups. This pass executes the other passes in the following order:

  ![optimization_mux2x2](https://github.com/user-attachments/assets/33adfb08-4254-4601-86b5-49da99730063)
     
8]  abc -liberty /home/ajinkya/lib/sky130_fd_sc_hd__tt_025C_1v80.lib 

            This pass uses the ABC tool [1] for technology mapping of yosys’s internal gate library to a target architecture.

  ![abc_liberty yosys_show](https://github.com/user-attachments/assets/021c52b9-76bc-4f28-b104-bc115a51ed59)

9] opt 

  ![abc_liberty_optimized yosys_show](https://github.com/user-attachments/assets/a7dab2fa-cbb6-42d8-8318-b29f682df051)

10] write_verilog -attr2comment  mux2x1_netlist.v

  ![netlist](https://github.com/user-attachments/assets/c981de8a-2577-4fc1-a7c7-1fab6192c541)


    
