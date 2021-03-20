module positivo(
input [7:0] Bin,
output [7:0] Bp
);

assign Bp = {0,(~Bin[6:0]+ 'b1)};

endmodule
