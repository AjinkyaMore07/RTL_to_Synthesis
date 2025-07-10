# Decoder
- **A decoder** is a circuit that takes in a binary code and has outputs that are asserted for specific values of that code.


# Types of Decoder
1] **One-Hot Decoder** - A one-hot decoder is a circuit that has n inputs and 2n outputs. Each output will assert for one and only one input code. Since there are 2n outputs, there will always be one and only one output asserted at any given time.

2] 7-Segment Display Decoder - A 7-segment display decoder is a circuit used to drive character displays that are commonly found in applications such as digital clocks and household appliances. A character display is made up of 7 individual LEDs, typically labeled a-g. The input to the decoder is the binary equivalent of the decimal or Hex character that is to be displayed. The output of the decoder is the arrangement of LEDs that will form the character. Decoders with 2-inputs can drive characters “0” to “3.” Decoders with 3-inputs can drive characters “0” to “7.” Decoders with 4-inputs can drive characters “0” to “F” with the case of the Hex characters being “A, b, c or C, d, E and F”.


3] BCD to Decimal decoder

# 2x4 Decoder in Verilog



## Advantages of Decoders

- **Simple Design**: Easy to design and implement.
- **Multiple Outputs**: Generates multiple outputs from fewer inputs.
- **Flexibility**: Useful in various applications like memory address decoding and data demultiplexing.
- **Expandability**: Can be combined to handle more inputs and outputs.
- **Compatibility**: Works well with other digital components.

## Applications of Decoders

- **Memory Address Decoding**: Selecting memory locations in memory devices.
- **Data Demultiplexing**: Distributing data from one line to multiple lines.
- **Seven-Segment Displays**: Driving seven-segment displays in digital devices.
- **Instruction Decoding**: Decoding instruction codes in CPUs and microcontrollers.
- **PLC and Control Systems**: Signal routing and decision making in control systems.
  
Here's a brief explanation of the code:

    Inputs and Outputs:
        a, b: 2-bit input.
        enable: Enables the decoder.
        y0, y1, y2, y3: 4-bit output.

    Intermediate Wires:
        w1: Inverted a.
        w2: Inverted b.

    Gates:
        not g1(w1, a): Inverts a.
        not g2(w2, b): Inverts b.
        and g3(y0, w1, w2, enable): y0 is high when a and b are both low and enable is high.
        and g4(y1, w1, b, enable): y1 is high when a is low and b is high and enable is high.
        and g5(y2, a, w2, enable): y2 is high when a is high and b is low and enable is high.
        and g6(y3, a, b, enable): y3 is high when a and b are both high and enable is high.
