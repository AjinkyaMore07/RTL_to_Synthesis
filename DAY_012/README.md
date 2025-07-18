# ✅ What is a Priority Encoder?

A priority encoder is a combinational logic circuit that takes multiple binary inputs and encodes them into a smaller number of output bits, giving priority to the highest-order active input (i.e., the most significant input with logic '1').

It ensures that only the highest-priority input is considered when multiple inputs are active at the same time.

---

# 🧠 Working Principle:

    If more than one input is high (1), the encoder outputs the binary code of the highest-priority input.

    It usually has an additional output called “Valid” or “Output Enable”, which indicates whether any input is active.


    | Inputs (I3 I2 I1 I0) | Output (Y1 Y0) | Valid |

    | -------------------- | -------------- | ----- |
    
    | 0000                 | --             | 0     |

    | 0001                 | 00             | 1     |

    | 0010                 | 01             | 1     |

    | 0100                 | 10             | 1     |

    | 1000                 | 11             | 1     |

    | 1010                 | 11             | 1     |

    | 1100                 | 11             | 1     |


---


# 🧩 Types of Priority Encoders:

  🔸 Fixed Priority Encoder

        The priority is hardwired and fixed (e.g., I3 > I2 > I1 > I0).
        Most commonly used.
        
  🔸4 Input Priority Encoder
  🔸Decimal to BCD Priority Encoder
  🔸Octal to Binary Priority Encoder


---


# ⚙️ Applications of Priority Encoders:

  ✅ Interrupt Controllers in Microprocessors:

        Decides which interrupt request to serve first when multiple interrupts occur.

  ✅ Arbitration in Bus Systems:

        Determines which device gets control of a shared bus.

  ✅ Digital Systems / Embedded Systems:

        Detecting highest-priority event, sensor, or signal.

  ✅ Data Compression and Encoding Systems

  
  ✅ Communication Systems:

        Channel selection or priority-based data transmission.

  ✅ Multiprocessor Systems:

        Handling multiple concurrent requests and resolving priorities.



---

# Verilog_code






# Testbench









# VCD Output



# GTKWAVE OUTPUT





# YOSYS and SKY130 


