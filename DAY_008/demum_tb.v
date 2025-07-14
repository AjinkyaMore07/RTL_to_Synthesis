module tb;
reg in;
reg [1:0] sel;
wire [3:0]x;

demux dut(in ,sel,x);


initial begin
  repeat(10) begin
   
      in = $urandom_range(0,1);
      sel = $urandom_range(0,5);
      #10;
   end
   
end
initial begin
 $monitor("in = %0d , sel = %0d , x = %0d ", in ,sel ,x);
 $dumpfile("demux.vcd");
 $dumpvars(0,tb);
end
endmodule
