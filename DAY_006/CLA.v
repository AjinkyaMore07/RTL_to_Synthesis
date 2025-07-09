module cla(input [3:0] a, b , input cin , output [3:0] sum , output carry);

wire [3:0] cout;





assign cout[0] = (a[0]&b[0]) | ((a[0] | b[0] ) & cin);

assign cout[1] = (a[1] & b[1]) | ((a[1] | b[1]) & (a[0] & b[0])) | ((a[1] | b[1] ) & ((a[0] | b[0] ) & cin));

assign cout[2] = (a[2] & b[2]) | ((b[2] | b[2]) & ((a[1] & b[1]))) | ((b[2] | b[2])  &  ((a[1] | b[1]) & (a[0] & b[0]))) | ((b[2] | b[2])  & ((a[1] | b[1] ) & ((a[0] | b[0] ) & cin)));

assign cout[3] = (a[3] & b[3]) | ((a[3] | b[3]) & (a[2] & b[2])) | ((a[3] | b[3]) & (b[2] | b[2]) & ((a[1] & b[1]))) | ((a[3] | b[3]) & ((b[2] | b[2])  &  ((a[1] | b[1]) & (a[0] & b[0])))) | (((a[3] | b[3])) &  ((b[2] | b[2])  & ((a[1] | b[1] ) & ((a[0] | b[0] ) & cin))));


assign sum = a ^ b ^ {cout[2], cout[1], cout[0], cin};
assign carry = cout[3];
endmodule
