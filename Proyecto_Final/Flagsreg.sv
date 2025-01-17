module Flagsreg (
	input logic clk, enable,
	input logic [1:0] in,
	output logic [1:0] out
);

	always @ (posedge clk) begin
		if (enable) begin
			out <= in;
		end
	end
endmodule 