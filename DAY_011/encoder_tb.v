`timescale 1ns / 1ps

module tb();

  reg [3:0] in;
  wire [1:0] y;

  // Instantiate the encoder module
  encoder4x2 dut (in, y);

  integer i;

  initial begin
    for (i = 0; i < 4; i = i + 1) begin
      in = 4'b0000;        // Clear all bits
      in[i] = 1'b1;        // Set only the i-th bit
      #10;                 // Wait to observe output
    end

    // Optional: Test an invalid case (multiple bits set)
    in = 4'b0110; #10;

    $finish;
  end

  initial begin
    $monitor("Time = %0t, in = %b, y = %b", $time, in, y);
    $dumpfile("encoder.vcd");
    $dumpvars(0, tb);
  end

endmodule
