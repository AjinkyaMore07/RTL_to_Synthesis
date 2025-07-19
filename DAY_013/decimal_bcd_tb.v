module tb();
reg [9:0] in;
reg en;
wire [3:0]y;

bcd dut(in,en,y);

integer i;

initial begin
 for(i = 0 ;i < 10 ;i = i + 1)
  begin
    en = 1'b1;
    in[i]= 1'b1;
    #10;
    in = 10'b0;
  end
 $finish;
end

initial begin
 $monitor("Time = %0t , in = %0d , en = %0d , y = %0d",$time,in,en,y);
 $dumpfile("decimal_bcd.vcd");
 $dumpvars(0,tb);
end
endmodule
