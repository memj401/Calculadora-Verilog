module 	fsm(
  				input logic reset,
				input logic ready,
            input logic [3:0] tecla,
				output  logic [3:0] d1, d0            
        );
		  
	typedef enum logic {DISPLAY_A, DISPLAY_B} statetype;
	statetype state, nextstate;

	always_ff @(posedge ready, posedge reset)
		if (reset) state <= DISPLAY_A;
		else state <= nextstate;

	always_comb
			case (state)
			
				DISPLAY_A: if (tecla<10) begin
							nextstate = DISPLAY_B;
						end
					  else nextstate = DISPLAY_A;
					  
				DISPLAY_B: if (tecla<10) begin
							nextstate = DISPLAY_A;
						end
					  else nextstate = DISPLAY_B;
					  
				default: nextstate = DISPLAY_A;

			endcase
			
	always_ff @(negedge ready, posedge reset)
			if(reset) begin
					d1 = '0; 
					d0 = '0;
			end
			else
				case (state)
					
					DISPLAY_A: if(tecla<10) d1 = tecla; 
						  
					DISPLAY_B: if(tecla<10) d0 = tecla; 
						  
					default: begin
							d1 = '0; 
							d0 = '0;
					end
					
				endcase
endmodule
