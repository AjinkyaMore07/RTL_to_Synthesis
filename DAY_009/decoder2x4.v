module decoder2x4(input a , b , output [3:0] F);
assign F[0] = (~a & ~b);
assign F[1] = (~a & b);
assign F[2] = (a & ~b);
assign F[3] = (a & b);
endmodule
