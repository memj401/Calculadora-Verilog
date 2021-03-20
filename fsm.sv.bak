module 	fsm(
            
            input logic clk,
            input logic reset,
            input logic m,
            output logic la, lv 
            
        );

	typedef enum logic [1:0] {APAGA_TODAS, ACENDE_TODAS, ACENDE_VERMELHO, ACENDE_AZUL} statetype;
	statetype state, nextstate;

	always_ff @(posedge clk, posedge reset)
		if (reset) state <= APAGA_TODAS;
		else state <= nextstate;

	always_comb
	  	case (state)

			APAGA_TODAS: if (m) nextstate = ACENDE_VERMELHO;
						  else nextstate = ACENDE_TODAS;

			ACENDE_TODAS: nextstate = APAGA_TODAS;

			ACENDE_VERMELHO: if (m) nextstate = ACENDE_AZUL;
							  else nextstate = APAGA_TODAS;

			ACENDE_AZUL: nextstate = APAGA_TODAS;

			default: nextstate = APAGA_TODAS;

		endcase

	always_comb
		case (state)

			APAGA_TODAS:		begin 
									la = 0; 
									lv = 0;
						 		end	

			 ACENDE_TODAS:		begin 
									la = 1; 
									lv = 1;
						   		end
			
			 ACENDE_VERMELHO:	begin 
									la = 0; 
									lv = 1;
								end	 

			 ACENDE_AZUL:  		begin 
									la = 1; 
									lv = 0;
								end	

			default:  			begin 
									la = 0; 
									lv = 0;
								end	

		endcase

endmodule