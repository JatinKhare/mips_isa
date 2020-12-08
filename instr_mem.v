module instruction_memory ( input [31:0]address, output reg [31:0]instruction );

reg [31:0]program_memory[0:50];

initial
begin 
program_memory[0] = 32'b000111_01010_01100_0000000000000001; //_7_2_1_0_32

program_memory[1] = 32'b000111_01010_01100_0000000000000001; //_7_2_1_0_32
 
program_memory[2] = 32'b000000_01100_00010_00010_00000_100000; //0_1_2_3_0_32

program_memory[3] = 32'b000000_01100_01000_00010_00000_100000; //0_1_2_3_0_32

program_memory[4] = 32'b000000_00001_00010_00011_00000_100000; //0_1_2_3_0_32
//add 1,2,7
 
program_memory[5] = 32'b000000_00111_00010_00001_00000_100000; //_7_2_1_0_32
 
//add 2,3,7
 
program_memory[6] = 32'b000000_00111_00011_00010_00000_100000; //0_7_3_2_0_32
//add 6,0,8
 
program_memory[7] = 32'b000000_01000_00000_00110_00000_100000; //0_8_0_6_0_32
 
//add 0,6,7
 
program_memory[8] = 32'b000000_00110_00111_00000_00000_100000; //0_6_7_0_0_32

//beq 0,5,addr2 
program_memory[9] = 32'b000100_00000_00101_00000_00000_000001; //4_0_5_0_0_1
program_memory[10] = 32'b000100_00000_00101_00000_00000_000001; //4_0_5_0_0_1
//jump addr1
 
program_memory[11] = 32'b000010_00000_00000_00000_00000_000001; //2_0_0_0_0_1
//jump addr2
program_memory[12] = 32'b000010_00000_00000_00000_00000_001000; //2_0_0_0_0_8
end

  always @(*)
 
 
		begin
			
			instruction[31:24] = program_memory[address/4][31:24];
			instruction[23:16] = program_memory[address/4][23:16];
			instruction[15:8] = program_memory[address/4][15:8];
			instruction[7:0] = program_memory[address/4][7:0];
		end
endmodule
