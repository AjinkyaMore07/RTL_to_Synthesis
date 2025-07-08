
module Full_adder(input in1,in2,cin,output s,c);
assign {c,s} = in1+in2+cin;
endmodule


module ripple_carry_adder(input [3:0]a,b, input cin , output [3:0]sum ,output carry );

wire [3:0]cout;

Full_adder g1(a[0],b[0],cin,sum[0],cout[0]);
Full_adder g2(a[1],b[1],cout[0],sum[1],cout[1]);
Full_adder g3(a[2],b[2],cout[1],sum[2],cout[2]);
Full_adder g4(a[3],b[3],cout[2],sum[3],cout[3]);

assign carry = cout[3];

endmodule
