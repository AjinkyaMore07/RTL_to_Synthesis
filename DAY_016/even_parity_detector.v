module even_parity(in,out);
input [3:0]in;
output [4:0]out; //5th bit as parity

assign out = {(in[3]^in[2]^in[1]^in[0]),in};
endmodule
