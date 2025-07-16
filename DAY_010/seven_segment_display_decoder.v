module display7_segment(
    input  [3:0] in,
    input        en,
    output reg a, b, c, d, e, f, g
);

always @(*) begin
    if (!en) begin
        // Turn off all segments when not enabled
        {a, b, c, d, e, f, g} = 7'b0000000;
    end else begin
        case (in)
            4'd0 : {a, b, c, d, e, f, g} = 7'b1111110;
            4'd1 : {a, b, c, d, e, f, g} = 7'b0110000;
            4'd2 : {a, b, c, d, e, f, g} = 7'b1101101;
            4'd3 : {a, b, c, d, e, f, g} = 7'b1111001;
            4'd4 : {a, b, c, d, e, f, g} = 7'b0110011;
            4'd5 : {a, b, c, d, e, f, g} = 7'b1011011;
            4'd6 : {a, b, c, d, e, f, g} = 7'b1011111;
            4'd7 : {a, b, c, d, e, f, g} = 7'b1110000;
            4'd8 : {a, b, c, d, e, f, g} = 7'b1111111;
            4'd9 : {a, b, c, d, e, f, g} = 7'b1111011;
            4'd10: {a, b, c, d, e, f, g} = 7'b1110111; // A
            4'd11: {a, b, c, d, e, f, g} = 7'b0011111; // b
            4'd12: {a, b, c, d, e, f, g} = 7'b1001110; // C
            4'd13: {a, b, c, d, e, f, g} = 7'b0111101; // d
            4'd14: {a, b, c, d, e, f, g} = 7'b1001111; // E
            4'd15: {a, b, c, d, e, f, g} = 7'b1000111; // F
            default: {a, b, c, d, e, f, g} = 7'b0000001; // dash (-)
        endcase
    end
end

endmodule
