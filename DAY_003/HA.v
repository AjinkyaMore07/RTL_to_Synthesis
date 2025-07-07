 
/*module half_adder(input in1 , in2 , output sum , carry);
 xor g1 (sum , in1 , in2);
 and g2 (carry , in1 , in2);
 endmodule
*/


module half_adder(input in1 , in2 , output sum , carry);
assign sum = in1 ^ in2;
assign carry = in1 & in2;
endmodule



/* module half_adder(input in1 , in2 , output sum , carry);
 assign {carry , sum } = in1+in2;
 endmodule
*/
