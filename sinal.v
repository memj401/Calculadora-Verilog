module sinal( 
    output [6:0] Pos,
    input  sinal
    );
    
	assign Pos  = ( sinal ? ~7'b1000000 : ~7'b0000000);
	
endmodule