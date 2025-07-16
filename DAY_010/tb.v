module tb();

  reg [3:0] in;
  reg en;
  wire a, b, c, d, e, f, g;

  // Instantiate the Unit Under Test (UUT)
  display7_segment uut (
    .in(in),
    .en(en),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g)
  );


integer i;
  // Apply test stimulus
  initial begin
    en = 1;
    // Test all inputs from 0 to 15
    
    for (i = 0; i < 16; i = i + 1) begin
       
      in = i;
       #10;
    end

    // Test with en = 0 (segments should all be off)
    #10;
    en = 0;
    in = 4'd5;  // Arbitrary value
    #10;

    $finish;
  end
    


// Display monitored signals
  initial begin
    $monitor("Time=%0t | in=%0d | en=%b | a=%b b=%b c=%b d=%b e=%b f=%b g=%b", $time, in, en, a, b, c, d, e, f, g);
             
    $dumpfile("BCD_seven_seg.vcd");
    $dumpvars(0, tb);
  end

endmodule
