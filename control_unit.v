module control_unit(input rst, 
					input [5:0] opcode,
					output reg Jump, RegDst, MemWrite, ALUSrc, MemtoReg, RegWrite, MemRead, Branch,
					output reg [1:0] ALUopcodecode);

	always @(*)
		begin
		  if(!rst) 
			begin
			RegDst <= 0;
			ALUSrc <= 0;
			MemtoReg <= 0;
			MemWrite <= 0;
			MemRead <= 0;
			Branch <= 0;
			RegWrite <= 0;
			ALUopcodecode <= 0;
			Jump <= 0;
			end
		else 
			begin
				case (opcode)
		  //ALU Op
			6'b000000 : begin
					RegDst <= 1;
					Branch <= 0;
					ALUSrc <= 0;
					MemtoReg <= 0;
					MemWrite <=0;
					RegWrite <= 1;
					MemRead <= 0;
					ALUopcodecode <= 2'b10;
					Jump <= 0;
						end

			 //store
			6'd35 : begin
			RegDst <= 0;
					Branch <= 0;
					ALUSrc <= 1;
					MemtoReg <= 1;
					MemWrite <=0;
					RegWrite <= 1;
					MemRead <= 1;
					ALUopcodecode <= 2'b00;
					Jump <= 0;

					end

			//branch
			6'd4 : begin 
					RegDst <= 0;
					Branch <= 1;
					ALUSrc <= 0;
					MemtoReg <= 0;
					MemWrite <= 0;
					RegWrite <= 0;
					MemRead <= 0;
					ALUopcodecode <= 2'b01;
					Jump <= 0;
					end
			//bne
			6'd5 : begin 
					RegDst <= 0;
					Branch <= 1;
					ALUSrc <= 0;
					MemtoReg <= 0;
					MemWrite <=0;
					RegWrite <= 0;
					MemRead <= 0;
					ALUopcodecode <= 2'b01;
					Jump <= 0;
					end
			  //jump
			6'd2 : begin 
					RegDst <= 0;
					Branch <= 0;
					ALUSrc <= 0;
					MemtoReg <= 0;
					MemWrite <=0;
					RegWrite <= 0;
					MemRead <= 0;
					ALUopcodecode <= 2'b00;
					Jump <= 1;
					end
			  //addi
			6'd8 : begin 
					RegDst <= 0;
					Branch <= 0;
					ALUSrc <= 1;
					MemtoReg <= 0;
					MemWrite <=0;
					RegWrite <= 1;
					MemRead <= 0;
					ALUopcodecode <= 2'b00;
					Jump <= 0;
					end
					
			//load
			6'd7 : begin
					RegDst <= 0;
					Branch <= 0;
					ALUSrc <= 1;
					MemtoReg <= 0;
					MemWrite <=0;
					RegWrite <= 1;
					MemRead <= 0;
					ALUopcodecode <= 2'b00;
					Jump <= 0;
					end
			//addiu
			/*6'd9 : begin 
					RegDst <= 0;
					Branch <= 0;
					ALUSrc <= 1;
					MemtoReg <= 0;
					MemWrite <=0;
					RegWrite <= 1;
					MemRead <= 0;
					ALUopcodecode <= 2'b00;
					Jump <= 0;
					end */
					//andi
			6'd12 : begin 
					RegDst <= 0;
					Branch <= 0;
					ALUSrc <= 1;
					MemtoReg <= 0;
					MemWrite <=0;
					RegWrite <= 1;
					MemRead <= 0;
					ALUopcodecode <= 2'b00;
					Jump <= 0;
					end
			//ori
			6'd13 : begin 
					RegDst <= 0;
					Branch <= 0;
					ALUSrc <= 1;
					MemtoReg <= 0;
					MemWrite <=0;
					RegWrite <= 1;
					MemRead <= 0;
					ALUopcodecode <= 2'b00;
					Jump <= 0;
					end
			endcase
			end
	end

	endmodule


