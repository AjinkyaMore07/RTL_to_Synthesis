module basic_gate_tb;
reg A,B;
wire AandB , AorB , notA , notB ,  AexorB , AexnorB , AnorB, AnandB ;

basic_gates dut(AandB , AorB , notA , notB ,  AexorB ,AexnorB , AnorB, AnandB,A,B);

initial begin
 A = 0;B = 0;#10;
 A = 0;B = 1;#10;
 A = 1;B = 0;#10;
 A = 1;B = 1;#10;
end

initial begin
$monitor ("A = %0d , B = %0d , AandB = %0d , AorB = %0d , notA = %0d , notB = %0d , AexorB = %0d , Aexnor = %0d , AnorB = %0d , AnandB = %0d ", A,B,AandB , AorB , notA , notB ,  AexorB ,AexnorB , AnorB, AnandB);
end
  
  initial begin
    $dumpfile("Basic_Gates.vcd");
    $dumpvars;
  end

endmodule
