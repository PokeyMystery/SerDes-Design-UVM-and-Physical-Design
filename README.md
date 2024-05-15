This project is oriented towards the RTL design, verification using UVM and Phusical Design of a Quad-lane Full duplex Serializer/Deserializer(SerDes).

Design:
All the system verilog design files of various sub components, encoder(8b/10b) , PISO(10b), SIPO, decoder(10b/8b), and the TOP module along with a basic randomized testbenh are provided in the RTL folder.
The SerDes.sv is the main SerDes design file, the top.sv file instantiaties this and connects the serializer with deserializer for verification purposes.

UVM Verification:
All the UVM objects and components are authored and provided in the UVM folder.
Assertions and coverage is implemented in the testbench top. The scoreboard needs further improvement.

Physical Design:
45nm fast lib obtained from Cadence webidte was used for the physical design.
The scripts to carry out the Synthesis and Place and route are provided in the PD folder along with all the results/reports obtained. The netlist file generated is also provided.
