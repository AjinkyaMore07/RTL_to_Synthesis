/*module encoder4x2(input [3:0] in, output [1:0] y);
    assign y = (in[3]) ? 2'b11 :
               (in[2]) ? 2'b10 :
               (in[1]) ? 2'b01 :
               (in[0]) ? 2'b00 :
                         2'b00; // default if all are 0
endmodule
*/


module encoder4x2(input [3:0] in, output reg [1:0] y);
  always @(*) begin
    case (in)
      4'b0001: y = 2'b00;
      4'b0010: y = 2'b01;
      4'b0100: y = 2'b10;
      4'b1000: y = 2'b11;
      default:     y = 2'b00; // optional: could set to 'x' or an error code
    endcase
  end
endmodule



/*
module encoder8x3(input [7:0]in,output reg [2:0]y)
 always @(*)
  begin
    case(in)
     d'0 : y = 3'b000;
     d'2 : y = 3'b001;
     d'4 : y = 3'b010;
     d'8 : y = 3'b011;
     d'16 : y = 3'b100;
     d'32: y = 3'b101;
     d'64 : y = 3'b110;
     d'128 : y = 3'b111;
     default : y = 3'b000;  
    endcase
  end
endmodule*/

/*
module encoder8x3(input [7:0] in, output reg [2:0] y);
  always @(*) begin
    case (in)
      8'b00000001: y = 3'b000;
      8'b00000010: y = 3'b001;
      8'b00000100: y = 3'b010;
      8'b00001000: y = 3'b011;
      8'b00010000: y = 3'b100;
      8'b00100000: y = 3'b101;
      8'b01000000: y = 3'b110;
      8'b10000000: y = 3'b111;
      default:     y = 3'b000; // optional: could set to 'x' or an error code
    endcase
  end
endmodule
*/
