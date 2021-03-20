module SumA( 
    input  S17,
	 input [6:0] A0,
	 input [6:0] A1,
	 input [6:0] A2,
	 input [6:0] sinal,
	 output [6:0] D4,
	 output [6:0] D5,
	 output [6:0] D6,
	 output [6:0] D7
    );
    
	assign	D4 = (S17 ? ~7'b0000000 : A0);
	assign	D5 = (S17 ? ~7'b0000000 : A1);
	assign	D6 = (S17 ? ~7'b0000000 : A2);
	assign	D7 = (S17 ? ~7'b0000000 : sinal);
	

endmodule