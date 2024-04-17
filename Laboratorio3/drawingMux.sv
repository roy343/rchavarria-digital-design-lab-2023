module drawingMux(

	input logic line,
	input logic [23:0]rgb0,rgb1,rgb2,rgb3,rgb4,rgb5,rgb6,rgb7,rgb8,rgb9,rgb10,rgb11,rgb12,rgb13,rgb14,rgb15,rgb16,rgb17,rgb18,rgb19,rgb20,rgb21,rgb22,rgb23,
	input logic pos0,pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,pos10,pos11,pos12,pos13,pos14,pos15,pos16,pos17,pos18,pos19,pos20,pos21,pos22,pos23,pos24,
	input logic win,lose,
	output logic [7:0]r,g,b

);

	logic[23:0]out_rgb;
	
	always @(line or pos0 or pos1 or pos2 or pos3 or pos4 or pos5 or pos6 or pos7 or pos8 or
				pos9 or pos10 or pos11 or pos12 or pos13 or pos14 or pos15 or pos16 or pos17 or pos18 or pos19 or pos20 or pos21 or pos22 or pos23 or pos24 or win or lose)
				
		begin   
			case ({line,pos0,pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,pos10,pos11,pos12,pos13,pos14,pos15,pos16,pos17,pos18,pos19,pos20,pos21,pos22,pos23,pos24,win,lose})
			
			27'b000000000000000000000000000 : out_rgb     <= 24'b000000000000000000000000;
			27'b100000000000000000000000000 : out_rgb     <= 24'b111111111111111111111111;
			27'b010000000000000000000000000 : out_rgb     <= rgb0;
			27'b001000000000000000000000000 : out_rgb     <= rgb1;
			27'b000100000000000000000000000 : out_rgb     <= rgb2;
			27'b000010000000000000000000000 : out_rgb     <= rgb3;
			27'b000001000000000000000000000 : out_rgb     <= rgb4;
			27'b000000100000000000000000000 : out_rgb     <= rgb5;
			27'b000000010000000000000000000 : out_rgb     <= rgb6;
			27'b000000001000000000000000000 : out_rgb     <= rgb7;
			27'b000000000100000000000000000 : out_rgb     <= rgb8;
			27'b000000000010000000000000000 : out_rgb     <= rgb9;
			27'b000000000001000000000000000 : out_rgb     <= rgb10;
			27'b000000000000100000000000000 : out_rgb     <= rgb11;
			27'b000000000000010000000000000 : out_rgb     <= rgb12;
			27'b000000000000001000000000000 : out_rgb     <= rgb13;
			27'b000000000000000100000000000 : out_rgb     <= rgb14;
			27'b000000000000000010000000000 : out_rgb     <= rgb16;
			27'b000000000000000001000000000 : out_rgb     <= rgb17;
			27'b000000000000000000100000000 : out_rgb     <= rgb18;
			27'b000000000000000000010000000 : out_rgb     <= rgb19;
			27'b000000000000000000001000000 : out_rgb     <= rgb20;
			27'b000000000000000000000100000 : out_rgb     <= rgb21;
			27'b000000000000000000000010000 : out_rgb     <= rgb22;
			27'b000000000000000000000001000 : out_rgb     <= rgb23;
						 
			
			//Casos win/lose
			27'b100000000000000000000000010 : out_rgb     <= 24'b000000000000000011111111;
			27'b100000000000000000000000001 : out_rgb     <= 24'b111111110000000000000000;
			
			default  : out_rgb <= 24'b111111111111111111111111;
			
			endcase
		end
		
	assign r = out_rgb[23:16];
	assign g = out_rgb[15:8];
	assign b = out_rgb[7:0];
	
endmodule