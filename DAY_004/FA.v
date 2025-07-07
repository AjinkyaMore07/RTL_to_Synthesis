module full_adder(input a,b,cin,output sum,carry);
wire w1,w2,w3,w4,w5;

xor g1 (w1,a,b);
and g2 (w2,a,b);

xor g3 (w3,w1,cin);
and g4 (w4,w1,cin);

or g5 (w5,w2,w4);


assign sum = w3;
assign carry = w5;
endmodule


/*
module full_adder(input a , b , cin , output sum, carry);
assign sum = a ^ b ^ cin;
assign carry = a&b | a&cin | b$cin ;
endmodule
*/

/*
module full_adder(input a , b , cin , output sum, carry);
assign {carry , sum } = a+b+cin;
endmodule
*/
