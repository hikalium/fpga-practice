`timescale 1ns / 1ps

module top(reset, clk, nled, nbtn, beep, seg, segsel);
input reset;		// 0: pushed, 1: released
input clk;			// 50MHz
output [3:0]nled;	// 0: off, 1: on
input [3:0] nbtn;	// negative logic
output beep;
output [7:0] seg;
output [3:0] segsel;

reg [3:0] led;
assign nled = ~led;

wire [3:0] btn_down;

reg [7:0] addr = 8'h00;


wire [7:0] memdata = mem[addr];
reg [7:0] mem [255:0];

initial begin
	$readmemh("ram.txt", mem);
end

always @(posedge clk) begin
	case(btn_down[1:0])
		2'b01: addr = addr + 1'd1;
		2'b10: addr = addr - 1'd1;
		default: addr = addr;
	endcase
	case(btn_down[3:2])
		2'b01: mem[addr] = mem[addr] + 1'd1;
		2'b10: mem[addr] = mem[addr] - 1'd1;
	endcase
end

//Beep bp(clk, 32'd56818, ~btn[0], beep);
LED7Seg led7(clk, seg, segsel, {addr, memdata});
ButtonLatch btnlatch(clk, ~nbtn, btn_down);
defparam btnlatch.PortWidth = 4;

endmodule
