module tb_Segment_Display_Decoder;
  reg [3:0] in;       // 4-bit input
  wire [6:0] y;       // 7-segment display output

  // Instantiate the Segment_Display_Decoder module
  Segment_Display_Decoder uut (
    .in(in),
    .y(y)
  );

  // Initialize and apply test vectors
  initial begin
    // Display all 16 possible 4-bit values
    in = 4'b0000; #10; // Display 0
    in = 4'b0001; #10; // Display 1
    in = 4'b0010; #10; // Display 2
    in = 4'b0011; #10; // Display 3
    in = 4'b0100; #10; // Display 4
    in = 4'b0101; #10; // Display 5
    in = 4'b0110; #10; // Display 6
    in = 4'b0111; #10; // Display 7
    in = 4'b1000; #10; // Display 8
    in = 4'b1001; #10; // Display 9
    in = 4'b1010; #10; // Display A
    in = 4'b1011; #10; // Display b
    in = 4'b1100; #10; // Display C
    in = 4'b1101; #10; // Display d
    in = 4'b1110; #10; // Display E
    in = 4'b1111; #10; // Display F
    $finish; // End simulation
  end

  // Dump waveform data for viewing
  initial begin
    $dumpfile("segment_display.vcd");
    $dumpvars(0, tb_Segment_Display_Decoder);
  end
endmodule
