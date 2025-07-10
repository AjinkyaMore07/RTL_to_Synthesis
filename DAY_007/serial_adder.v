module Top(
    input  [3:0] in1, in2,
    input        clk, reset, load,
    output [3:0] sum,
    output       carry
);

wire FA_sum, FA_carry;  // Output from 1-bit full adder logic
wire w1, w2, w3;         // w1, w2: LSBs of shifted registers; w3: carry from previous bit

// Instantiate shift module (registers, shifter, sum collector, and carry flip-flop)
shift u1 (
    .in1(in1),
    .in2(in2),
    .clk(clk),
    .reset(reset),
    .load(load),
    .sumin(FA_sum),        // MSB-in for sum shift register
    .dffcarryin(FA_carry), // Capture FA carry
    .y1(w1),               // Current LSB of in1
    .y2(w2),               // Current LSB of in2
    .dffcarryout(w3),      // Carry from last cycle
    .sumout(sum)
);

// 1-bit Full Adder logic for LSBs (serial addition)
assign {FA_carry, FA_sum} = w1 + w2 + w3;

// Final carry output (after all bits are added serially)
assign carry = FA_carry;

endmodule


module shift(input [3:0] in1,in2,
	     input reset,
	     	   clk,
		   load,
		   sumin,
		   dffcarryin,
	    output y1,
		   y2,
		   dffcarryout,
	    output [3:0]sumout);

reg [3:0]tempA,tempB;
reg [3:0]sumout_temp;
reg temp1;
always @(posedge clk,posedge reset)
 begin
	if(reset)
	 begin
	   tempA<=0;
	   tempB<=0;
	 end
	
       else if(load)
	 begin
	   tempA <=in1;
	   tempB <=in2;
	 end

       else
	  begin
	     tempA <= {1'b0, tempA[3:1]};
	     tempB <= {1'b0, tempB[3:1]};
	  end
	   
 end

assign y1 = tempA[0];
assign y2 = tempB[0];

always @(posedge clk , posedge reset)
 begin
   if(reset)
	sumout_temp <=0;
   else 
	begin
		sumout_temp <= sumout_temp >> 1 ;
     		sumout_temp[3]<= sumin;
 	end

 end

assign sumout = sumout_temp;


always @(posedge clk , posedge reset)
begin
	if(reset) 
		temp1<=0;
	else
		temp1<=dffcarryin;
end

assign dffcarryout = temp1;

endmodule



