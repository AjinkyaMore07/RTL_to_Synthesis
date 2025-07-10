module tb_top;

  // Inputs
  reg [3:0] in1, in2;
  reg clk, reset, load;

  // Outputs
  wire [3:0] sum;
  wire carry;

  // Instantiate DUT
  Top uut (
    .in1(in1),
    .in2(in2),
    .clk(clk),
    .reset(reset),
    .load(load),
    .sum(sum),
    .carry(carry)
  );

always #5 clk = ~clk;

integer i;

initial begin
clk = 0;
for (i = 0 ; i <=4 ; i = i+ 1)
 begin 
	reset = 1;
	load=0;
	#10;

	reset = 0;
        load = 1;
       @(posedge clk) in1 = $urandom_range(1,15);
   		      in2 = $urandom_range(1,15);    
    // Wait for 4 cycles of serial addition
       @(posedge clk) load = 0;
    repeat (4) begin
      #10;
    end
    
    $display("in1 = %0d , in2 = %0d, Final Sum: %d, Carry: %d", in1,in2 ,sum, carry);

 end
$finish;
end
/*initial begin
	clk = 0;
	reset = 1;
	load=0;
	#10;

	reset = 0;
	in1 = 4'b0010;  // 2
    	in2 = 4'b0101;  // 5
    	load = 1;

	 #10;
    load = 0;
    // Wait for 4 cycles of serial addition
    repeat (7) begin
      #10;
    end
   
    // Final result
    #10;
    $display("Final Sum: %b, Carry: %b", sum, carry);

    $finish;
end
*/
initial begin

        $monitor("%0t\t%d\t%d\t%04d\t%04d\t%04d\t%d", $time, reset, load, in1, in2, sum, carry);
	$dumpfile("serial_adder.vcd");
	$dumpvars(0,tb_top);
end
endmodule
