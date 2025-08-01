/* Generated by Yosys 0.33 (git sha1 2584903a060) */

/* top =  1  */
/* src = "HA.v:9.1-12.10" */
module half_adder(in1, in2, sum, carry);
  /* src = "HA.v:9.50-9.55" */
  output carry;
  wire carry;
  /* src = "HA.v:9.25-9.28" */
  input in1;
  wire in1;
  /* src = "HA.v:9.31-9.34" */
  input in2;
  wire in2;
  /* src = "HA.v:9.44-9.47" */
  output sum;
  wire sum;
  sky130_fd_sc_hd__and2_0 _0_ (
    .A(in1),
    .B(in2),
    .X(carry)
  );
  sky130_fd_sc_hd__xor2_1 _1_ (
    .A(in1),
    .B(in2),
    .X(sum)
  );
endmodule
