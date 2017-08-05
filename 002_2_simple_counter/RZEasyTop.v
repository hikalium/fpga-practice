module RZEasyTop(clk, seg, segsel);
input clk;			// 50MHz
output [7:0] seg;
output [3:0] segsel;

reg [31:0] timer = 0;
wire timeout = timer > 50_000_000;
reg [15:0] counter;

LED7Seg led7(clk, seg, segsel, counter);

always @(posedge clk) begin
	if(timeout) begin
		counter = counter + 1;
		timer = 0;
	end
	else begin
		timer = timer + 1;
	end
end

endmodule
