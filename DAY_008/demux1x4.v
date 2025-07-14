module demux(
    input in,
    input [1:0] sel,
    output [3:0] x
);

assign x[0] = (sel == 2'b00) ? in : 1'b0;
assign x[1] = (sel == 2'b01) ? in : 1'b0;
assign x[2] = (sel == 2'b10) ? in : 1'b0;
assign x[3] = (sel == 2'b11) ? in : 1'b0;

endmodule

/*
module demux_1to8_case (
    input in,
    input [2:0] sel,
    output reg [7:0] x
);
    always @(*) begin
        case (sel)
            3'b000: x[0] = in;
            3'b001: x[1] = in;
            3'b010: x[2] = in;
            3'b011: x[3] = in;
            3'b100: x[4] = in;
            3'b101: x[5] = in;
            3'b110: x[6] = in;
            3'b111: x[7] = in;
	    default :  x = 8'b00000000; // Default: all outputs 0
        endcase
    end
endmodule
*/

/*

module demux_1to8_if (
    input in,
    input [2:0] sel,
    output reg [7:0] x
);
    always @(*) begin
        

        if (sel == 3'b000) x[0] = in;
        else if (sel == 3'b001) x[1] = in;
        else if (sel == 3'b010) x[2] = in;
        else if (sel == 3'b011) x[3] = in;
        else if (sel == 3'b100) x[4] = in;
        else if (sel == 3'b101) x[5] = in;
        else if (sel == 3'b110) x[6] = in;
        else if (sel == 3'b111) x[7] = in;'
	else x = 8'b00000000; // Default: all outputs 0
    end
endmodule
*/
