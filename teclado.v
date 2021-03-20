module teclado (
	inout  logic [35:0] 	GPIO_1,
	input  logic 			CLOCK_50,
	output logic [3:0] 	tecla,
	output logic  			ready
	);
	
	wire [3:0] lin,col;
	
	//DE2, DE2-115 e DE1
	assign col={GPIO_1[11],GPIO_1[13],GPIO_1[15],GPIO_1[17]};
	assign {GPIO_1[19],GPIO_1[21],GPIO_1[23],GPIO_1[25]}=lin;

	// DE2-70
//	assign col={GPIO_1[9],GPIO_1[11],GPIO_1[13],GPIO_1[14]};
//	assign {GPIO_1[15],GPIO_1[17],GPIO_1[19],GPIO_1[21]}=lin;
	
	controlador U0 (.clk(CLOCK_50), .linhaN(lin),.colunaN(col),.tecla(tecla),.ready(ready));


endmodule
	


	
module controlador (
	input   		clk,
	output reg [3:0] linhaN,
	input 	  [3:0] colunaN,
	output reg [3:0] tecla,
	output ready
	);
	
	wire [3:0] linha,coluna;
	assign linhaN=~linha;
	assign coluna=~colunaN;
	
	wire [7:0] valor;
	integer contador;
	
	initial
		begin
			linha<=4'b0001;
			tecla<=4'b0000;
			ready<=1'b0;
		end
			
			
		assign valor={linha,cold};
	
			
	always @(posedge clk)
		if (contador>=1000000 && ~ready)
		begin	
			contador<=0;
			if(linha==4'b1000)
				linha<=4'b0001;
			else
				linha<=linha<<1;
		end
		else
			contador<=contador+1;
	
		
	
	assign ready = (valor[3:0]==4'b0000 ? 1'b0 : 1'b1);

	always @(posedge clk)
			case (valor)
				8'b00010001: tecla<=4'b0001;
				8'b00010010: tecla<=4'b0010;
				8'b00010100: tecla<=4'b0011;		
				8'b00011000: tecla<=4'b1010;

				8'b00100001: tecla<=4'b0100;
				8'b00100010: tecla<=4'b0101;
				8'b00100100: tecla<=4'b0110;		
				8'b00101000: tecla<=4'b1011;
				
				8'b01000001: tecla<=4'b0111;
				8'b01000010: tecla<=4'b1000;
				8'b01000100: tecla<=4'b1001;		
				8'b01001000: tecla<=4'b1100;
				
				8'b10000001: tecla<=4'b1111;
				8'b10000010: tecla<=4'b0000;
				8'b10000100: tecla<=4'b1110;		
				8'b10001000: tecla<=4'b1101;
				
				default: tecla<=tecla;
			endcase
			
wire [3:0] cold;

	
Debouncer d0 (.iClock(clk),.iBouncy(coluna[0]), .oPulse(), .oState(cold[0]));
Debouncer d1 (.iClock(clk),.iBouncy(coluna[1]), .oPulse(), .oState(cold[1]));
Debouncer d2 (.iClock(clk),.iBouncy(coluna[2]), .oPulse(), .oState(cold[2]));
Debouncer d3 (.iClock(clk),.iBouncy(coluna[3]), .oPulse(), .oState(cold[3]));


endmodule
	
				

module Debouncer
(
	input wire iClock,
	input wire iBouncy,
	output reg oPulse,
	output reg oState
);

reg [1:0] FF = 2'b0;

always @(posedge iClock)
	FF <= { FF[0], iBouncy };
	
reg [18:0] Counter = 19'b0;
wire [18:0] NextCounter;
wire CarryOut;

assign { CarryOut, NextCounter } = Counter + 1'b1;

always @(posedge iClock)
	if (^FF)
		Counter <= 19'b0;
	else if (!CarryOut)
		Counter <= NextCounter;
		
reg State = 1'b0;
		
always @(posedge iClock)
	if (CarryOut)
		State <= FF[1];
		
assign oState = State;
assign oPulse = State != FF[1] && CarryOut && !State;

endmodule