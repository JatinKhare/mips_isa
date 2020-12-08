module register_bank  
(input clk,  input rst,  
 input write_en,  
 input [4:0] reg_write_dest,  
 input [31:0] reg_write_data,  
 input [4:0] reg_1_read_addr, 
 input [4:0] reg_2_read_addr,  
 output [31:0] reg_1_read_data,    
 output [31:0] reg_2_read_data,
 output [31:0]data_out
);  
   
reg [31:0]reg_bank [31:0];  
     
	always @ (negedge clk ) 
		begin
			if(!rst) begin  
				reg_bank[0] <= 32'b0;    
				reg_bank[1] <= 32'b0;
				reg_bank[2] <= 32'b0;
                reg_bank[3] <= 32'b0;
                reg_bank[4] <= 32'b0;
                reg_bank[5] <= 32'b0;
                reg_bank[6] <= 32'b0;
                reg_bank[7] <= 32'b0;
                reg_bank[8] <= 32'b0;
                reg_bank[9] <= 32'b0;
                reg_bank[10] <= 32'b0;    
                reg_bank[11] <= 32'b0;
                reg_bank[12] <= 32'b0;
                reg_bank[13] <= 32'b0;
                reg_bank[14] <= 32'b0;
                reg_bank[15] <= 32'b0;
                reg_bank[16] <= 32'b0;
                reg_bank[17] <= 32'b0;
                reg_bank[18] <= 32'b0;  
                reg_bank[19] <= 32'b0;
                reg_bank[20] <= 32'b0;    
                reg_bank[21] <= 32'b0;
                reg_bank[22] <= 32'b0;
                reg_bank[23] <= 32'b0;
                reg_bank[24] <= 32'b0;
                reg_bank[25] <= 32'b0;
                reg_bank[26] <= 32'b0;
                reg_bank[27] <= 32'b0;
                reg_bank[28] <= 32'b0;  
                reg_bank[29] <= 32'b0;
				reg_bank[30] <= 32'b0;
				reg_bank[31] <= 32'b0;
			end  
			else if (write_en)    
				reg_bank[reg_write_dest] <= reg_write_data;    
			end  
	
	assign reg_1_read_data = reg_bank[reg_1_read_addr];  
	assign reg_2_read_data = reg_bank[reg_2_read_addr];  
	assign data_out = reg_bank[2][31:0];

 endmodule

