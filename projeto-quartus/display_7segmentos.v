// modulo display de 7 segmentos
module display_7segmentos(dados, segmentos);

	input [3:0]dados;
	output reg [6:0]segmentos;
	
	always @(*)
		// aciona os segmentos a cada digito binario com 4 bits
		case(dados)
		0: segmentos = 7'b1111110;
		1: segmentos = 7'b0110000;
		2: segmentos = 7'b1101101;
		3: segmentos = 7'b1111001;
		4: segmentos = 7'b0110011;
		5: segmentos = 7'b1011011;
		6: segmentos = 7'b1011111;
		7: segmentos = 7'b1110000;
		8: segmentos = 7'b1111111;
		9: segmentos = 7'b1110011;
		default: segmentos = 7'b0000000;
		endcase
endmodule
// sistema de segurança residencial
// alysson machado e matheus victor