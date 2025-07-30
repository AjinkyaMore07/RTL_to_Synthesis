## Verilog code 

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

---

## TestBench

  
    module tb();
        reg in, clk, async_reset, sync_reset;
        wire q;
    
        // Instantiate the DUT (Device Under Test)
        dff_async_reset_sync_reset dut(
            .in(in),
            .clk(clk),
            .async_reset(async_reset),
            .sync_reset(sync_reset),
            .q(q)
        );
    
        // Clock generation: 10 time units period
        always #5 clk = ~clk;
    
        // Toggle asynchronous reset every 100 time units
        always #200 async_reset = ~async_reset;
    
       always #23 in = ~in;
    
       always #113 sync_reset = ~sync_reset;
    
        initial begin
            clk = 0;
            async_reset = 1;
            sync_reset = 0;
            in = 1;
    
            #1000 $finish; // End the simulation after the loop
        end
    
        // Monitor changes and create VCD file
        initial begin
            $monitor("Time = %0t | in = %0b | clk = %0b | async_reset = %0b | sync_reset = %0b | q = %0b",
                      $time, in, clk, async_reset, sync_reset, q);
            $dumpfile("dff_async_reset_sync_reset.vcd");
            $dumpvars(0, tb);
        end
    endmodule

---

## VCD OUTPUT

  <img width="680" height="901" alt="vcd" src="https://github.com/user-attachments/assets/905f07c0-bcfb-4399-857e-5d13d0673dbc" />

---

## GTKWAVE OUTPUT

  <img width="1919" height="617" alt="gtkwave" src="https://github.com/user-attachments/assets/82ff2275-10f3-4c9d-a52d-306cd379e9bc" />

---

## YOSYS AND SKY130 

1] read_Verilog

2] read_liberty

3] hierarchy

  <img width="710" height="366" alt="verilog+liberty" src="https://github.com/user-attachments/assets/b9c9e550-bd57-49ea-9bcf-921276f990d2" />

4] proc

  <img width="1221" height="285" alt="proc yosys_show" src="https://github.com/user-attachments/assets/50b33659-28b9-47f8-88ad-cd663ccace25" />

5] opt

  <img width="771" height="328" alt="proc_opt yosys_show" src="https://github.com/user-attachments/assets/31569174-12a6-475f-84f9-1fff78bbbadb" />

6] Techmap ; opt;

<img width="803" height="279" alt="techmap_opt yosys_show" src="https://github.com/user-attachments/assets/7d47a523-7073-4f0d-bb6d-2d2cacc7957c" />

7] dfflibmap

  <img width="1003" height="368" alt="dfflibmap yosys_show" src="https://github.com/user-attachments/assets/64489697-d0fd-4ebd-8a0d-1dbb158281ab" />

8] abc

  <img width="1443" height="295" alt="abc yosys_show" src="https://github.com/user-attachments/assets/45d609da-b81a-4e8e-82d7-9a3170df6423" />

9] opt

  <img width="1203" height="304" alt="abc_opt yosys_show" src="https://github.com/user-attachments/assets/abe7c1c6-8656-4718-b5bc-22ce3e4b88bc" />

10] stat

  <img width="540" height="265" alt="stat" src="https://github.com/user-attachments/assets/f49417b4-fd5e-4087-a7db-33945fe4ff15" />

11] write_verilog

