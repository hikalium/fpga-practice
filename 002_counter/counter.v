`timescale 1ns / 1ps

module Counter(clk, count);
	input clk;
	output reg [31:0] count = 0;

	always @(posedge clk) begin
		count = count + 1;
	end

endmodule

module testbench_counter();
	reg clk;
	wire [31:0] count;

	Counter counter(clk, count);

	always begin
		clk = 0;
		#1;
		clk = 1;
		#1;
	end

	initial begin
		$dumpfile("counter.vcd");
		$dumpvars(0, counter);

	end

	always @(posedge clk) begin
		if(count == 100) begin
			$finish;
		end
	end

endmodule

