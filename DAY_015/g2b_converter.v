module g2b_converter(gray,binary);
input [3:0]gray;
output [3:0]binary;

assign binary[3] = gray[3];  		 // MSB is the same
assign binary[2] = gray[2] ^ binary[3];  // B2 = G2 ^ B3
assign binary[1] = gray[1] ^ binary[2];  // B1 = G1 ^ B2
assign binary[0] = gray[0] ^ binary[1];  // B0 = G0 ^ B1
endmodule
