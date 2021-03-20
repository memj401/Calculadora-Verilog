module SumB( 
    input  S17,
	 input overflow,
	 input [6:0] soma0,
	 input [6:0] soma1,
	 input [6:0] soma2,
	 input [6:0] SinalSoma,
	 input [6:0] B0,
	 input [6:0] B1,
	 input [6:0] B2,
	 input [6:0] sinalB,
	 output [6:0] D0,
	 output [6:0] D1,
	 output [6:0] D2,
	 output [6:0] D3
    );
    
	assign	D0 = (S17 ? (overflow ? ~7'b1011100 : soma0 ) : B0);
	assign	D1 = (S17 ? (overflow ? ~7'b1010000 : soma1 ): B1);
	assign	D2 = (S17 ? (overflow ? ~7'b1010000 : soma2 ): B2);
	assign	D3 = (S17 ? (overflow ? ~7'b1111001 : SinalSoma ) : sinalB);
	

endmodule
