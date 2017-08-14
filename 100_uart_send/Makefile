SRCS=beep.v led7seg.v rmchat.v btnlatch.v top.v
TOPMODULE=top

DIR_QBIN=~/intelFPGA_lite/17.0/quartus/bin

default:
	$(DIR_QBIN)/quartus_map top
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
	-killall jtagd
	sudo $(DIR_QBIN)/jtagd

clean:
	-rm -r db/ incremental_db/
	-rm *.rpt
	-rm *.jdi
	-rm *.summary
	-rm *.pin
	-rm *.out
	-rm *.sld
	-rm *.sof

log:
	-cat $(TOPMODULE).map.summary
