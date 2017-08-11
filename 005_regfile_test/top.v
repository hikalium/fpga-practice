`timescale 1ns / 1ps

module top(reset, clk, led, nbtn, beep, seg, segsel);
input reset;		// 0: pushed, 1: released
input clk;			// 50MHz
output [3:0]led;	// 0: off, 1: on
input [3:0] nbtn;	// negative logic
output beep;
output [7:0] seg;
output [3:0] segsel;
//
wire [3:0] btn;

reg [7:0] addr = 8'h00;

//Beep bp(clk, 32'd56818, ~btn[0], beep);
LED7Seg led7(clk, seg, segsel, {8'h00, addr});

defparam rmchat0.PortWidth = 4;
RemoveChattering rmchat0(clk, ~nbtn, btn);

always @(posedge btn[0]) begin
	addr = addr + 1;
end

endmodule
