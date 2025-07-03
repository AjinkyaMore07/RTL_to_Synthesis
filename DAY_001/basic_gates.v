module basic_gates(output AandB , AorB , notA , notB , AexorB , AexnorB , AnorB, AnandB , input A , B );

assign notA = !A;
assign notB = !B;
assign AorB = A|B;
assign AandB = A&B;
assign AnandB = ~(A&B);
assign AnorB = ~(A|B);
assign AexnorB = ~(A^B);
assign AexorB = (A^B);

endmodule
