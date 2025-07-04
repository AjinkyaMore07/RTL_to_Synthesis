module mux_tb;
reg in1,in2,sel;
wire out;

mux2x1 dut(in1,in2,sel,out);

initial begin
  in1 = 0 ; in2 = 0 ; sel = 0;#10;
  in1 = 0 ; in2 = 0 ; sel = 1;#10;
  in1 = 0 ; in2 = 1 ; sel = 1;#10;
  in1 = 0 ; in2 = 1 ; sel = 0;#10;
  in1 = 1 ; in2 = 0 ; sel = 0;#10;
  in1 = 1 ; in2 = 0 ; sel = 1;#10;
  in1 = 1 ; in2 = 1 ; sel = 0;#10;
  in1 = 1 ; in2 = 1 ; sel = 1;#10;
end

initial begin
   $monitor("in1 = %0d , in2 = %0d , sel = %0d, out = %0d " , in1,in2,sel,out);
end


initial begin
 $dumpfile("mux2x1.vcd");
 $dumpvars(0,mux_tb);
end
endmodule
