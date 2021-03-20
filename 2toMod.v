module toMod( 
    output [7:0] Pos,
    input [7:0] A
    );
    
	assign Pos  = (A[7] ? ~A + 1 : A);
	
endmodule