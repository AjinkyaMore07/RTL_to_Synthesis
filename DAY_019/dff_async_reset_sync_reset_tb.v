/*module tb();
reg in ,clk,async_reset,sync_reset;
wire q;

dff_async_reset_sync_reset dut(in , clk ,async_reset,sync_reset,q);

always #5 clk = ~clk;

always #100 async_reset = ~async_reset;


integer i;

initial begin
 clk = 0;
 async_reset = 0;
 sync_reset = 0;

 for(i = 0 ; i < 10 i = i+1)
  begin
	  in = $urandom_range(0,1);
          #12;

	  if(i == 8)
	    sync_reset = 1;
          else 
	     sync_reset = 0;
  end

end

initial begin
 $monitor("Time = %0d , in = %0d , clk = %0d , async_reset = %0d , sync_reset = %0d , q = %0d ", $time,in,clk,async_reset,sync_reset,q);
 $dumpfile("dff_async_reset_sync_reset.vcd");
 $dumpvars(0,tb);
end
endmodule

*/

module tb();
    reg in, clk, async_reset, sync_reset;
    wire q;

    // Instantiate the DUT (Device Under Test)
    dff_async_reset_sync_reset dut(
        .in(in),
        .clk(clk),
        .async_reset(async_reset),
        .sync_reset(sync_reset),
        .q(q)
    );

    // Clock generation: 10 time units period
    always #5 clk = ~clk;

    // Toggle asynchronous reset every 100 time units
    always #200 async_reset = ~async_reset;

   always #23 in = ~in;

   always #113 sync_reset = ~sync_reset;

    initial begin
        clk = 0;
        async_reset = 1;
        sync_reset = 0;
        in = 1;

        #1000 $finish; // End the simulation after the loop
    end

    // Monitor changes and create VCD file
    initial begin
        $monitor("Time = %0t | in = %0b | clk = %0b | async_reset = %0b | sync_reset = %0b | q = %0b",
                  $time, in, clk, async_reset, sync_reset, q);
        $dumpfile("dff_async_reset_sync_reset.vcd");
        $dumpvars(0, tb);
    end
endmodule

