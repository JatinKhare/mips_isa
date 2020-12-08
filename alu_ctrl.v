module ALUCtrl(input [1:0] ALUopcode, 
			   input [5:0] funct, 
			   output reg [2:0] ALUOperation);

	always@(ALUopcode or funct)
		begin
			case(ALUopcode)
				0: ALUOperation = 3'b010;
				1: ALUOperation = 3'b110;
				2: case(funct)
				1: ALUOperation = 3'b010;
				34: ALUOperation = 3'b110;
				36,44: ALUOperation = 3'b000;
				37,45: ALUOperation = 3'b001;
				7: ALUOperation = 3'b111;
				default: ALUOperation = 3'b101;
			endcase
				default: ALUOperation = 3'b101;
			endcase
		end
endmodule
