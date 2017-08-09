module RZEasyTop(clk, seg, segsel, nbtn);
input clk;			// 50MHz
input [3:0] nbtn;
output [7:0] seg;
output [3:0] segsel;

wire [3:0] btn = ~nbtn;

reg [31:0] timer = 0;
wire timeout = timer > 50_000_000;
reg [15:0] counter;

reg [1:0] state = 0;
reg [1:0] next_state;

always begin
	case(state)
	2'd0:		next_state = (btn[2] ? 2'd1 : 2'd0);
	2'd1:		next_state = (counter == 16'd0 ? 2'd2 : 2'd1);
	default:	next_state = (btn[2] ? 2'd0 : 2'd2);
	endcase
end

LED7Seg led7(clk, seg, segsel, counter);

always @(posedge clk) begin
	state = next_state;
	if(timeout) timer = 0;
	else timer = timer + 1;
end

always @(posedge clk) begin
	if(timeout) begin
		case(state)
			2'd0: begin
				case(btn[1:0])
					2'b01: counter = counter + 1'd1;
					2'b10: counter = counter - 1'd1;
					default: counter = counter;
				endcase
			end
			2'd1: counter = counter - 1'd1;
			default: counter = counter;
		endcase
	end
	else counter = counter;
end

endmodule
