# 1-bit comparator

A 2-bit comparator is a digital logic circuit that compares two 2-bit binary numbers and determines their relationship—whether one is greater than, equal to, or less than the other.


## 🧠 Purpose of a Comparator:
   
    A 1-bit comparator compares A and B and outputs:
    
    A > B
    
    A = B
    
    A < B

## Verilog code for 1 bit comparator - Continous assignment
  


## Verilog code for 1 bit comparator - Continous assignment

    module comparator(input a,b,output eq,gr,le);
    assign eq = ~(a ^ b);
    assign le = !a & b;
    assign gr = a & !b;
    endmodule

## Verilog code for 2 bit comparator - Continous assignment

       module comparator_2bit(
        input [1:0] a, b,
        output eq, gr, le);
        
      assign eq = (a == b);
      assign gr = (a > b);
      assign le = (a < b);
    endmodule

## TestBench 


