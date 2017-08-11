`timescale 1ns / 1ps

module ButtonLatch(clk, in, out);
	// ボタンが押されたときに、1clk分のパルスをclkに同期して出力する。
	// btnは正論理で入力。チャタリングはこのモジュール内で除去される。
	parameter PortWidth = 1;
	//
	input clk;
	input [PortWidth-1:0] in;
	output [PortWidth-1:0] out;
	//
	reg		[PortWidth-1:0] buffer;
	wire	[PortWidth-1:0] in_nochat;
	//
	assign out = in_nochat & ~buffer;

	always@(posedge clk) begin
		buffer = in_nochat;
	end

	RemoveChattering rmchat0(clk, in, in_nochat);
	defparam rmchat0.PortWidth = PortWidth;
endmodule
