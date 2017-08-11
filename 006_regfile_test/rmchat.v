`timescale 1ns / 1ps

module RemoveChattering(clk, in, out);
	parameter PortWidth = 1;
	parameter CounterWidth = 16;
	//
	input clk;
	input [PortWidth-1:0] in;
	output reg [PortWidth-1:0] out;
	//
	reg [CounterWidth-1:0] counter = 0;
	reg [PortWidth-1:0] buffer;
	//
	always@(posedge clk) begin
		counter = counter + 1'd1;
		if(counter == 0) begin
			buffer <= in;
			out <= buffer;
		end
	end
endmodule
