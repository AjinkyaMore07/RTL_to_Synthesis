module dff_async_reset_sync_reset(
    input  in,
    input  clk,
    input  async_reset,
    input  sync_reset,
    output reg q
);
    always @(posedge clk or posedge async_reset) begin
        if (async_reset)
            q <= 1'b0;
        else if (sync_reset)
            q <= 1'b0;
        else
            q <= in;
    end
endmodule

