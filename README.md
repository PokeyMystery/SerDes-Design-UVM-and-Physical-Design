# Design Verification and Physical Design of SerDES
This project is oriented towards the RTL design, verification using UVM and Phusical Design of a Quad-lane Full duplex Serializer/Deserializer(SerDes). This work was carried out as the mini project of our M.E VLSI Design, second semester.

<div align="center">
  <img src="https://github.com/PokeyMystery/SerDes-Design-UVM-and-Physical-Design/assets/120627091/eed1436a-cfeb-43f2-a940-5ee5b6c9caf8" width=60% height=60% alt="Full duplex SerDes">
</div>

## Team
- Punith P : punithprakash2001@gmail.com : https://www.linkedin.com/in/punith-p/
- Yashasvi : yashasvishetty9697@gmail.com : 

## Design
All the system verilog design files of various sub components, encoder(8b/10b) , PISO(10b), SIPO, decoder(10b/8b), and the TOP module along with a basic randomized testbenh are provided in the RTL folder.
The SerDes.sv is the main SerDes design file, the top.sv file instantiaties this and connects the serializer with deserializer for verification purposes.
<div align="center">
  <img src="https://github.com/PokeyMystery/SerDes-Design-UVM-and-Physical-Design/assets/120627091/21598556-e117-4cf9-96d9-95c6e8f537e5" width=38% height=38% alt="Serializer(quad lane)">
  <img src="https://github.com/PokeyMystery/SerDes-Design-UVM-and-Physical-Design/assets/120627091/866c41df-b6a6-451e-bb62-5532c0e4e5a5" width=38% height=38% alt="Deserializer(quad lane)">
</div>

## UVM Verification
All the UVM objects and components are authored and provided in the UVM folder.Assertions and coverage is implemented in the testbench top. The scoreboard needs further improvement.
The following is the snapshot of the simulation of the SerDes module.
<div align="center">
   <img src="https://github.com/PokeyMystery/SerDes-Design-UVM-and-Physical-Design/assets/120627091/0cbd6695-dab7-4188-a28d-37223115cd6e"  alt="SerDes simulation">
</div>


## Physical Design
45nm fast lib obtained from Cadence website was used for the physical design. The scripts to carry out the Synthesis, Place & route and timing analysis and fixing are provided in the PD folder along with all the results/reports obtained. The synthesized netlist, constraints and delays file generated is also provided.
<div align="center">
   <img src="https://github.com/PokeyMystery/SerDes-Design-UVM-and-Physical-Design/assets/120627091/44e66e1f-fe44-4179-af56-f6ca281d119a" width=70% height=70% alt="Synthesized circuit">
  <img src="https://github.com/PokeyMystery/SerDes-Design-UVM-and-Physical-Design/assets/120627091/2eeeacd5-73bf-4a0c-bf04-401eb43fdb7f" width=60% height=60% alt="Placed and routed circuit">
</div>

