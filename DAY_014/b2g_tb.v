module tb();
reg [3:0] binary;
wire [3:0] gray;

b2g dut(binary,gray);


integer i;
initial begin
 for(i=0 ; i<15 ; i=i+1)
  begin
    binary = i;
    #10;
  end
end

initial begin
 $monitor("Time = %0t , binary = %0d , gray = %0d ",$time,binary,gray);
 $dumpfile("b2g.vcd");
 $dumpvars(0,tb);
end
endmodule
