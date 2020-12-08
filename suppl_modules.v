module Adder (input [31:0]in1, in2, 
			  output [31:0]adder_out);

assign adder_out = in1 + in2;

endmodule  

module jump_address(input [25:0]inst, 
					input [3:0]pc_segment, 
					output [31:0]jump_address_out);

assign jump_address_out[31:28] = pc_segment[3:0];
assign jump_address_out[27:2] = inst[25:0];
assign jump_address_out[1:0] = 2'b00;

endmodule

module mux(input [31:0]s0, s1, 
		   input sel, 
		   output [31:0]mux_out);
assign mux_out = sel?s1:s0;
endmodule

module shifter_block(input [31:0]in1, output [31:0]shift_out);
assign shift_out = in1<<2;
endmodule

module sign_extend(input [15:0]in1, output [31:0]out);

assign out[15:0] = in1[15:0];
assign out[31:16] = {16{in1[15]}};

endmodule
