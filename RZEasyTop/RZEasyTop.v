module RZEasyTop(reset, clk, led, btn, beep);
input reset;		// 0: pushed, 1: released
input clk;			// 50MHz
output [3:0]led;	// 0: off, 1: on
input [3:0]btn;	// 0: pushed, 1: released
output beep;

Beep bp(clk, 32'd56818, ~btn[0], beep);

endmodule