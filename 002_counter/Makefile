%.out : %.v Makefile
	iverilog -Wall -o $*.out -s testbench_$* $*.v

%.vcd : %.out Makefile
	vvp $*.out

default:
	@echo "Usage: make <source.vcd>\n\tto compile and simulate <source.v>"

clean: 
	- rm *.out
	- rm *.vcd

reset_blaster :
	-killall jtagd
	sudo ~/intelFPGA_lite/17.0/quartus/bin/jtagd

