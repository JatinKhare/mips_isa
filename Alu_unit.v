module ALU(input [31:0]in1, in2, 
		   input [2:0]ALUOperation, 
		   output reg [31:0]ALUOut, 
		   output reg ov, zero);

initial
begin
	ov = 0;
	zero = 0;
end
	always @(in1 or in2 or ALUOperation)
	begin
		case(ALUOperation)
		0: begin
			ALUOut = in1 & in2;
			if(ALUOut==0)
			zero = 1;
			else
			zero = 0;
			end
		1: begin
			ALUOut = in1 | in2;
			if(ALUOut==0)
			zero = 1;
			else 
			zero = 0;
			end
		2: begin
			ALUOut = in1 + in2 ;
			if(ALUOut==0)
			zero = 1;
			else 
			zero = 0;
			if( (in1[31]==in2[31]) && (in1[31] != ALUOut[31]))
			ov = 1;
			else
			ov = 0;
			end
		6: begin
			ALUOut = in1 - in2;
			if(ALUOut==0)
			zero = 1;
			else 
			zero = 0;
			if( (in1[31]!= in2[31]) && ( in2[31] == ALUOut[31]))
			ov = 1;
			else
			ov = 0;
			end
		7: if (in1 < in2)
			ALUOut = 1;
		   else
			ALUOut = 0;
		default: ALUOut = 0;
	endcase
end

endmodule
