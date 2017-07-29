`timescale 1ns / 1ps

module Counter(clk, count, down);
	input clk;
	input down;
	output reg [31:0] count = 0;

	always @(posedge clk) begin
		if(down == 0)	count = count + 1;
		else			count = count - 1;
	end

endmodule

module testbench_counter();
	reg clk;
	wire [31:0] count;
	reg down;

	Counter counter(clk, count, down);

	always begin
		clk = 0;
		#1;
		clk = 1;
		#1;
	end

	initial begin
		$dumpfile("counter.vcd");
		$dumpvars(0, counter);
		down = 0;
		#4;
		down = 1;
		#2;
		down = 0;
		#4;
	end

	always @(posedge clk) begin
		if(count == 100) begin
			$finish;
		end
	end

endmodule

