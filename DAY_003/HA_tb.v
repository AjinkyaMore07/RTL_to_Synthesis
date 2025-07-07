module HA_tb();
reg in1,in2;
wire sum,carry;

half_adder dut(in1,in2,sum,carry);
initial begin
 $monitor("in1 = %0d , in2 = %0d , sum = %0d , carry = %0d",in1,in2,sum,carry);
end

initial begin 

 in1=0;in2=0;#10;
 in1=0;in2=1;#10;
 
 in1=1;in2=0;#10;
 in1=1;in2=1;#10;
 
end

initial begin
 $dumpfile("half_adder.vcd");
 $dumpvars(0,HA_tb);
end

endmodule
