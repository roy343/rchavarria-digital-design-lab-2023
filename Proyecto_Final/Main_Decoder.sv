module Main_Decoder (
	input logic [1:0] Op,
	input logic [5:0] Funct,
	output logic Branch, RegW, MemW, MemtoReg, ALUSrc, ALUOp, Byte,
	output logic [1:0] ImmSrc, RegSrc
);
	
	
	always_comb begin
		Byte = 0;
		case (Op) 
			2'b00: begin // Data_Processing
				if (Funct[5]) begin // Immediate
					Branch = 0;
					MemtoReg = 0;
					MemW = 0;
					ALUSrc = 1;
					ImmSrc = 2'b00;
					RegW = 1;
					RegSrc = 2'b00;
					ALUOp = 1;
				end else begin // Register
					Branch = 0;
					MemtoReg = 0;
					MemW = 0;
					ALUSrc = 0;
					ImmSrc = 2'b00;
					RegW = 1;
					RegSrc = 2'b00;
					ALUOp = 1;
				end
			end
			2'b01: begin  // Memory
				if (Funct[0]) begin  // Load
					Branch = 0;
					MemtoReg = 1;
					MemW = 0;
					ALUSrc = 1;
					ImmSrc = 2'b01;
					RegW = 1;
					RegSrc = 2'b00;
					ALUOp = 0;
					if (Funct[5]) begin
						ALUSrc = 0;
					end
					if (Funct[2]) begin
						Byte = 1;
					end
				end else begin  // Store
					Branch = 0;
					MemtoReg = 0;
					MemW = 1;
					ALUSrc = 1;
					ImmSrc = 2'b01;
					RegW = 0;
					RegSrc = 2'b10;
					ALUOp = 0;
					if (Funct[2]) begin
						Byte = 1;
					end
				end
			end
			
			2'b10: begin  // Branch
				Branch = 1;
				MemtoReg = 0;
				MemW = 0;
				ALUSrc = 1;
				ImmSrc = 2'b10;
				RegW = 0;
				RegSrc = 2'b01;
				ALUOp = 0;
			end
			
			default: begin
				Branch = 0;
				RegW = 0;
				MemW = 0;
				MemtoReg = 0;
				ALUSrc = 0;
				ALUOp = 0;
				ImmSrc = 2'b00;
				RegSrc = 2'b00;
			end
		endcase
	end
endmodule