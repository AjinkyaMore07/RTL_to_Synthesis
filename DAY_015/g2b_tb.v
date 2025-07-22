module tb();

wire [3:0] binary;
reg [3:0] gray;

g2b_converter dut(gray,binary);


integer i;
initial begin
 for(i=0 ; i<15 ; i=i+1)
  begin
    gray = i;
    #10;
  end
end

initial begin
 $monitor("Time = %0t , binary = %0d , gray = %0d ",$time,binary,gray);
 $dumpfile("g2b.vcd");
 $dumpvars(0,tb);
end
endmodule
