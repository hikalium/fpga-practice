module RZEasyTop(reset, clk, led, btn, beep, seg, segsel);
input reset;		// 0: pushed, 1: released
input clk;			// 50MHz
output [3:0]led;	// 0: off, 1: on
input [3:0]btn;	// 0: pushed, 1: released
output beep;
output [7:0] seg;
output [3:0] segsel;

reg [31:0] clkcounter = 0;

reg [15:0] counter = 16'h05ec;

Beep bp(clk, 32'd56818, ~btn[0], beep);
LED7Seg led7(clk, seg, segsel, counter);

always @(posedge clk) clkcounter = clkcounter + 1'd1;

always @(posedge clkcounter[21]) begin
	if(btn[2] && ~btn[3]) counter = counter + 1'd1;
	else if(btn[3] && ~btn[2]) counter = counter - 1'd1;
	else counter = counter;
end

endmodule