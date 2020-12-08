module testing;

reg clk,rst;
wire [31:0]data;
 
data_path d1(.clk(clk),.rst(rst),.data(data));
  
initial
	begin
		clk = 0;
		rst = 0;
		#25 rst = 1;
    end
 
always
    begin
	$dumpfile("project.vcd");
	$dumpvars(0,testing);
    forever #1 clk = ~clk;
    $monitor("%d",data);
    #150 $finish;
    end
endmodule