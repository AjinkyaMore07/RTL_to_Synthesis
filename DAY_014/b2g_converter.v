module b2g(binary,gray);
input [3:0] binary;
output [3:0]gray;

assign gray[3] = binary[3];   //// MSB remains the same
assign gray[2] = binary[3] ^ binary[2]; // G2 = B3 XOR B2
assign gray[1] = binary[2] ^ binary[1]; // G1 = B3 XOR B1
assign gray[0] = binary[1] ^ binary[0];	// G0 = B3 XOR B0
endmodule
