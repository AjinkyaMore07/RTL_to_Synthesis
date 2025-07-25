module tb();
reg [3:0]in;
wire [4:0]out;


even_parity dut(in,out);
integer i;
initial begin
 for(i=0;i<10;i=i+1)
  begin
    in = $urandom_range(0,10);
    #10;
  end
end


initial begin
 $monitor("Time = %0t , in = %0b , out = %0b",$time,in,out);
 $dumpfile("parity.vcd");
 $dumpvars(0,tb);
end


endmodule
