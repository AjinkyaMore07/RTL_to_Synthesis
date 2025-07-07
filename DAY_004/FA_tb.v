module tb();
reg a,b,cin;
wire sum,carry;

full_adder dut(a,b,cin,sum,carry);

initial begin
  a = 0; b = 0; cin = 0 ; #10;
  a = 0; b = 0; cin = 1 ; #10;
  a = 0; b = 1; cin = 0 ; #10;
  a = 0; b = 1; cin = 1 ; #10;
  a = 1; b = 0; cin = 0 ; #10;
  a = 1; b = 0; cin = 1 ; #10;
  a = 1; b = 1; cin = 0 ; #10;
  a = 1; b = 1; cin = 1 ; #10;
end


initial begin
 $monitor("a = %0d , b = %0d , cin = %0d , sum = %0d , carry = %0d ", a,b,cin,sum,carry);
 $dumpfile("full_adder.vcd");
 $dumpvars(0,tb);
end

endmodule

