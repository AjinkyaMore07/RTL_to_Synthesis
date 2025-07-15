module decoder_tb();
reg a,b;
wire [3:0]F;

decoder2x4 uut(a,b,F);
integer i;

initial begin
 for(i = 0 ; i <=10 ; i=i+1) 
    begin
	#10;
    	{a,b} = $urandom_range(0,4);
    end  
end



initial begin
  $monitor("a = %0d , b = %0d , F = %0d",a,b,F);
  $dumpfile("decoder.vcd");
  $dumpvars(0,decoder_tb);
end
endmodule

