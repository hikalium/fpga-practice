module Beep(clk, cycle, sw, beep);
input clk;
input [31:0]cycle;
input sw;
output reg beep;

reg [31:0]count = 0;

always @ (posedge clk && sw) begin
	if(sw) begin
		if(count > cycle) begin
			count = 0;
			beep = ~beep;
		end
		else begin
			count = count + 1;
			beep = beep;
		end
	end
end

endmodule