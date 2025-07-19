module bcd(in,en,y);
input [9:0]in;
input en;
output reg [3:0]y;

always @(*)
 begin
  if(en)
    begin
      case(in)
        10'b0000000001 : y = 4'd0;
	10'b0000000010 : y = 4'd1;
	10'b0000000100 : y = 4'd2;
	10'b0000001000 : y = 4'd3;
	10'b0000010000 : y = 4'd4;
	10'b0000100000 : y = 4'd5;
	10'b0001000000 : y = 4'd6;
	10'b0010000000 : y = 4'd7;
	10'b0100000000 : y = 4'd8;
	10'b1000000000 : y = 4'd9;
	default : y = 4'b0000;
      endcase
     end
  else
	y = 4'b0000;
 end

endmodule


/*

module bcd(in,en,y);
input [9:0]in;
input en;
output reg [3:0]y;

always @(*)
 begin
  if(en)
   begin
    if (in[0]) y = 4'd0;
    else if (in[1]) y = 4'd1;
    else if (in[2]) y = 4'd2;
    else if (in[3]) y = 4'd3;
    else if (in[4]) y = 4'd4;
    else if (in[5]) y = 4'd5;
    else if (in[6]) y = 4'd6;
    else if (in[7]) y = 4'd7;
    else if (in[8]) y = 4'd8;
    else if (in[9]) y = 4'd9;
    else y =4'd0;
  end 
else
	y = 4'b0000;
 end

endmodule



//casex

module bcd(in,en,y);
input [9:0]in;
input en;
output reg [3:0]y;

always @(*)
 begin
  if(en)
    begin
      casex(in)
        10'b1xxxxxxxxx : y = 4'd9;
	10'b01xxxxxxxx : y = 4'd8;
	10'b001xxxxxxx : y = 4'd7;
	10'b0001xxxxxx : y = 4'd6;
	10'b00001xxxxx : y = 4'd5;
	10'b000001xxxx : y = 4'd4;
	10'b0000001xxx : y = 4'd3;
	10'b00000001xx : y = 4'd2;
	10'b000000001x : y = 4'd1;
	10'b0000000001 : y = 4'd0;
	default : y = 4'b0000;
      endcase
     end
  else
	y = 4'b0000;
 end

endmodule*/
