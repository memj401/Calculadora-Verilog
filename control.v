module control(
	input [3:0] tecla,
	input [7:0] load,
	input [7:0] soma,
	input reset,
	output [3:0] regadress,
	output [7:0] A,
	output [7:0] B,
	output regwrite,
	output cin,
	output [7:0] store
	); 
	
	always @(*) 
begin
	
	if(reset)
	begin
	A = 8'b000000000;
		B = 8'b000000000;
	end
	
	else
	begin
		case(tecla)
			4'b0000 : B = 8'b00000000; 
			4'b0001 : B = 8'b00000001;
			4'b0010 : B = 8'b00000010; 
			4'b0011 : B = 8'b00000011; 
			4'b0100 : B = 8'b00000100; 
			4'b0101 : B = 8'b00000101; 
			4'b0110 : B = 8'b00010110; 
			4'b0111 : B = 8'b00000111; 
			4'b1000 : B = 8'b00011000; 
			4'b1001 : B = 8'b00001001;
			
			4'b1010 : begin //soma
			cin = 0;
			B = soma;
			A = 8'b00000000;
			end
			
			4'b1011 : begin //sub
			cin = 1;
			B = soma;
			A = 8'b00000000;
			end
			
			4'b1100 : begin //store
			regwrite = 1;
			regadress = B;
			store = A;
			end
			
			4'b1101 : begin //load
			regadress = B;
			B = load;
			end
			
			4'b1110 : begin //enter
			A = B;
			end
			default : B = 8'b00000000;
		endcase;
	end

end


endmodule