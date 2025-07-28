module tb();
reg d, clk = 0, reset;
wire q;

dff_sync_reset dut(.d(d), .clk(clk), .reset(reset), .q(q));

// Clock generator
always #5 clk = ~clk;

integer i;

initial begin
  // Initialize signals
  d = 0;
  reset = 1;

  // Apply reset for 4 clock cycles
  repeat(4) @(posedge clk);
  reset = 0;

  // Stimulate data input
  for(i = 0; i < 10; i = i + 1) begin
    d = $urandom_range(0,1);
    @(posedge clk);
  end

  #10 $finish;
end

initial begin
  $monitor("Time = %0t | d = %b | clk = %b | reset = %b | q = %b", $time, d, clk, reset, q);
  $dumpfile("dff.vcd");
  $dumpvars(0, tb);
end

endmodule

