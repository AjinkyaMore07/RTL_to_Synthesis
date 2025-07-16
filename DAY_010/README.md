7-Segment Display Decoder Overview

    Purpose:
        The 7-segment display decoder drives a 7-segment display to show characters (digits or letters). It translates a binary or hexadecimal input into signals that light up specific segments of the display.

    7-Segment Display:
        Consists of 7 LEDs arranged in a figure-eight pattern, labeled a through g. By turning on specific combinations of these LEDs, different characters can be displayed.

    Decoder Inputs and Outputs:
        2-Input Decoder: Drives characters from "0" to "3" (binary 00 to 11).
        3-Input Decoder: Drives characters from "0" to "7" (binary 000 to 111).
        4-Input Decoder: Drives characters from "0" to "F" (binary 0000 to 1111), including hex characters A, b, c or C, d, E, and F.

Typical 7-Segment Display Decoder Example

A common 7-segment display decoder is the 74LS47, which is a BCD to 7-segment latch/decoder/driver.

Inputs:

    BCD (Binary-Coded Decimal) inputs.

Outputs:

    7 segments (a-g) that control the display.

Working:

    Each input combination (from 0000 to 1111) activates specific segments to display the corresponding character.
Advantages

    Ease of Use:
        Simple to understand and implement, especially for displaying numerical digits and some letters.

    Low Cost:
        Widely available and inexpensive, making them a cost-effective choice for many applications.

    Low Power Consumption:
        Consumes relatively low power compared to more complex display technologies.

    Readability:
        Provides clear and easily readable numeric and alphanumeric information.

    Direct Control:
        Directly controls each segment of the display, simplifying the interface between the decoder and the display.

    Versatility:
        Can be used in a variety of devices and applications, from simple digital clocks to complex electronic displays.
  Applications of 7-Segment Display Decoders

    Digital Clocks:
        Commonly used in digital clocks to display the current time. Each digit of the time is driven by a 7-segment display.

    Calculators:
        Used in calculators to display numbers and basic operations. The simplicity and readability make them ideal for this purpose.

    Household Appliances:
        Found in various household appliances like microwave ovens, washing machines, and ovens to display settings and status.

    Electronic Meters:
        Used in digital voltmeters, ammeters, and other measurement instruments to display numerical readings.

    Scoreboards:
        Utilized in sports scoreboards and other counting devices where numeric information needs to be displayed clearly.

    Automotive Displays:
        Applied in car dashboards to show information such as speed, fuel level, and other metrics.

    Industrial Equipment:
        Used in industrial equipment and machinery to display operational parameters and status.

    Tachometers:
        Employed in tachometers to show RPM (Revolutions Per Minute) in various machines and engines.

    Temperature and Humidity Displays:
        Applied in devices that display temperature and humidity readings in a digital format.


---
# Verilog Code 

    module Segment_Display_Decoder (
        input [3:0] in,   
        output reg [6:0] y );
  
            always @(*) begin
                case (in)
                    4'b0000: y = 7'b0111111; // 0
                    4'b0001: y = 7'b0000110; // 1
                    4'b0010: y = 7'b1011011; // 2
                    4'b0011: y = 7'b1001111; // 3
                    4'b0100: y = 7'b1100110; // 4
                    4'b0101: y = 7'b1101101; // 5
                    4'b0110: y = 7'b1111101; // 6
                    4'b0111: y = 7'b0000111; // 7
                    4'b1000: y = 7'b1111111; // 8
                    4'b1001: y = 7'b1101111; // 9
                    4'b1010: y = 7'b1110111; // A
                    4'b1011: y = 7'b1111100; // b
                    4'b1100: y = 7'b0111001; // C
                    4'b1101: y = 7'b1011110; // d
                    4'b1110: y = 7'b1111001; // E
                    4'b1111: y = 7'b1110001; // F
                    default: y = 7'b0111111; // Default to '0'
                endcase
            end
    endmodule


---

# TestBench 


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

---

# VCD Output


# GTKWAVE Output



# Yosys and SKY130 

