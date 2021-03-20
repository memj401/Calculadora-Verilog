module bancoReg(
	input clk, 
	input reset, 
	input we,
	input [3:0] address,
	input [7:0] wdata,
	output [7:0] rdata
	); 
  
	reg [7:0] bancoreg [9:0]; //define 10 registradores de tamanho 8 bits
	
	integer i;
	always @(posedge clk)
		if(reset)
			for (i=0;i<10;i=i+1)
				bancoreg[i] <= 8'd0;
		else
			if (we)
				bancoreg[address] <= wdata;

	assign rdata = bancoreg[address];

endmodule