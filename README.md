# FPGA_template_repo
This is a template repository that works well for my current workflow. 
## VHDL
VHDL is compiled using GHDL and TBs are writen for VUnit. Waveforms are ploted in GTK-Wave. 

## Verilog/SystemVerilog
SystemVerilog is compiled using verilator and testbenches are writen in C++. Waveforms are also ploted in GTK-Wave. 
ToDo: Make TBs in SystemVerilog
ToDo: Make Dut and scoreboard setup

## Building bitsterams
TCL scripts and Vivado are used to build bitstreams and program devices. 
ToDo: Make script to intigrate wiht <https://github.com/acoustic-warfare/zybo-rt-sampler>

