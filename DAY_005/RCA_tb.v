module RCA_tb;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire carry;
integer i;

ripple_carry_adder dut(a,b,cin,sum,carry);

initial begin
 $monitor("a = %0d , b = %0d , cin = %0d ,sum = %0d ,carry = %0d",a,b,cin,sum,carry);
 $dumpfile("RCA.vcd");
 $dumpvars(0,RCA_tb);
end


initial begin
 for(i = 0 ; i <= 15 ; i = i+1)
  begin
     a = $urandom_range(15);
     b = $urandom_range(15);
     cin = 0;
     #10;
  end 

end
endmodule
