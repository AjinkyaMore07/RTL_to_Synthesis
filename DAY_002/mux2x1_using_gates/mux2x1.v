module mux2x1(input in1 ,in2 , sel , output out);
wire w1,w2,w3;
not g1(w1,sel);
and g2(w2,in1,w1);
and g3(w3,in2,sel);
or g4(out,w2,w3);
endmodule 
