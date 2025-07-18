module tb();
reg [3:0]in;
reg en;
wire [1:0]y;

encoder dut(in,en,y);

integer i;
initial begin
  en =0;
  #10;
  for(i = 0 ; i < 15 ; i = i + 1)
    begin
	    en =1;
    	    in = i;
        #10;
    end
end

initial begin
 $monitor("Time = %0t , in = %0d , en = %0d , y= %0d ",$time,in,en,y);
 $dumpfile("encoder.vcd");
 $dumpvars(0,tb);
end

endmodule
