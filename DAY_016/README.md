# 📘 even_parity 

📦 Module: even_parity
📥 Inputs
in : 4-bit input vector

📤 Outputs
out : 5-bit output, where out[4] is the even parity bit, and out[3:0] is the original input

🔧 Functionality
The parity bit (out[4]) is calculated as:

    in[3] ^ in[2] ^ in[1] ^ in[0]
    This XOR operation ensures that the output has even parity.

  # Verilog Code

    module even_parity(in,out);
    input [3:0]in;
    output [4:0]out; //5th bit as parity
    
    assign out = {(in[3]^in[2]^in[1]^in[0]),in};
    endmodule
---


  # Testbench 

    module tb();
      reg [3:0]in;
      wire [4:0]out;
      
      
      even_parity dut(in,out);
      integer i;
      initial begin
       for(i=0;i<10;i=i+1)
        begin
          in = $urandom_range(0,10);
          #10;
        end
      end
      
      
      initial begin
       $monitor("Time = %0t , in = %0b , out = %0b",$time,in,out);
       $dumpfile("parity.vcd");
       $dumpvars(0,tb);
      end
  
  
    endmodule

---
