SRCS=top.v beep.v led7seg.v
TOPMODULE=top

i: $(SRCS) Makefile
	iverilog -Wall -o $(TOPMODULE).out -s $(TOPMODULE) $(SRCS)

vcd: $(SRCS) testbench.v Makefile
	iverilog -Wall -o testbench.out -s testbench $(SRCS) testbench.v
	vvp testbench.out
