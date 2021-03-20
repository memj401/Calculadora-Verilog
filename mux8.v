module mux8(
input [7:0] Dado,
input [2:0] Escolha,
output Saida
);
assign Saida = Dado[Escolha];
endmodule
