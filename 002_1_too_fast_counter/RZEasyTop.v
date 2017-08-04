module RZEasyTop(clk, seg, segsel);
input clk;			// 50MHz
output [7:0] seg;
output [3:0] segsel;

reg [15:0] counter;
wire [15:0] next_counter;
assign next_counter = counter + 1;

LED7Seg led7(clk, seg, segsel, counter);

always @(posedge clk) begin
	counter = next_counter;
end

endmodule