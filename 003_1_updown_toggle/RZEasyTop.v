module RZEasyTop(clk, seg, segsel, nbtn);
input clk;			// 50MHz
input [3:0] nbtn;
output [7:0] seg;
output [3:0] segsel;

wire [3:0] btn = ~nbtn;

reg [31:0] timer = 0;
wire timeout = timer > 50_000_000;
reg [15:0] counter;

LED7Seg led7(clk, seg, segsel, counter);

reg toggle = 0;

always @(posedge btn[0]) toggle = ~toggle; 

always @(posedge clk) begin
	if(timeout) begin
		if(toggle)	counter = counter + 1'd1;
		else			counter = counter - 1'd1;
		timer = 0;
	end
	else begin
		timer = timer + 1;
	end
end

endmodule
