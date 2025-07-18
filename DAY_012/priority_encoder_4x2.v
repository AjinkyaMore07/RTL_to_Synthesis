module encoder(
  input [3:0] in,
  input en,
  output reg [1:0] y
);

  always @(*) begin
    if (en) begin
      casex (in)
        4'b1xxx: y = 2'b11;
  	4'b01xx: y = 2'b10;
  	4'b001x: y = 2'b01;
  	4'b0001: y = 2'b00;
  	default: y = 2'b00;  // Optional: fallback for invalid/multiple-bit input
      endcase
    end else begin
      y = 2'b00; // Output 0 when disabled
    end
  end

endmodule
