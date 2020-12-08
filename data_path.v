module data_path(input clk, rst, 
				 output [31:0]data);

reg [31:0]PC_out;
wire overflow, zero, mux_sel_PC;
wire [31:0]PC_in, PC_4,instr, jmp_addr, sign_ext_data, data_for_alu_unit, add_alu, ALUOut;
wire [4:0]rs, rt, wrd;
wire [31:0]rd1, rd2, write_data, alu_res_mux, out_for_mux2, data_from_memory;
wire [1:0]ALUopcodecode;
wire [2:0]ALUOperation;
wire RegDst, MemtoReg, RegWrite, Jump, MemRead, Branch, ALUSrc, MemWrite;

  always @(posedge clk)
    begin
      if(!rst||data>32'd9999)
	  begin
        PC_out <= 0;
		
	  end
      else
        PC_out <= PC_in;
    end
   
		
Adder a1(.in1(PC_out),.in2(4),.adder_out(PC_4));

instruction_memory im(.address(PC_out),.instruction(instr));

jump_address j1(.inst(instr[25:0]),.pc_segment(PC_4[31:28]),.jump_address_out(jmp_addr));

assign rs = instr[25:21];

assign rt = instr[20:16];

assign wrd = RegDst ? instr[15:11] : instr[20:16];

register_bank rb(.clk(clk),.rst(rst),.write_en(RegWrite),.reg_write_dest(wrd), .reg_write_data(write_data),.reg_1_read_addr(rs),.reg_2_read_addr(rt),.reg_1_read_data(rd1),.reg_2_read_data(rd2), .data_out(data));

sign_extend se(.in1(instr[15:0]),.out(sign_ext_data));

shifter_block shf(.in1(sign_ext_data),.shift_out(add_alu));

Adder a2(.in1(PC_4),.in2(add_alu),.adder_out(alu_res_mux));

control_unit ctrl(.rst(rst),.opcode(instr[31:26]),.Jump(Jump),.RegDst(RegDst),.RegWrite(RegWrite),.ALUopcodecode(ALUopcodecode),.MemtoReg(MemtoReg),.Branch(Branch),.MemRead(MemRead),.ALUSrc(ALUSrc),.MemWrite(MemWrite));

ALUCtrl alu_ctrl(.ALUopcode(ALUopcodecode),.funct(instr[5:0]),.ALUOperation(ALUOperation));

assign data_for_alu_unit = ALUSrc ? sign_ext_data : rd2;

ALU alu_unit(.in1(rd1), .in2(data_for_alu_unit), .ALUOperation(ALUOperation), .ALUOut(ALUOut), .ov(overflow), .zero(zero));

and and_gate1(mux_sel_PC,Branch,zero);

mux m1(.s1(alu_res_mux),.s0(PC_4),.sel(mux_sel_PC),.mux_out(out_for_mux2));

mux m2(.s0(out_for_mux2),.s1(jmp_addr),.sel(Jump),.mux_out(PC_in));

data_memory dm(.rst(rst),.mem_access_addr(ALUOut),.mem_write_data(data_for_alu_unit),.mem_write_en(MemWrite),.mem_read(MemRead), .mem_read_data(data_from_memory));

mux m3(.s0(ALUOut),.s1(data_from_memory),.sel(MemtoReg),.mux_out(write_data));

endmodule

