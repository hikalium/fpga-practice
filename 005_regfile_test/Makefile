SRCS=top.v beep.v led7seg.v
TOPMODULE=top

DIR_QBIN=~/intelFPGA_lite/17.0/quartus/bin

default:
	$(DIR_QBIN)/quartus_map top --part=EP4CE6E22C8 --source=top.v
	$(DIR_QBIN)/quartus_fit top
	$(DIR_QBIN)/quartus_asm top


i: $(SRCS) Makefile
	iverilog -Wall -o $(TOPMODULE).out -s $(TOPMODULE) $(SRCS)

vcd: $(SRCS) testbench.v Makefile
	iverilog -Wall -o testbench.out -s testbench $(SRCS) testbench.v
	vvp testbench.out

lspgm:
	$(DIR_QBIN)/quartus_pgm -l

install:
	$(DIR_QBIN)/quartus_pgm -c 1 -m jtag -o P\;$(TOPMODULE).sof@1

resetpgm:
	killall jtagd
	sudo $(DIR_QBIN)/jtagd
