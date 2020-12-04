// modulo temporizador de 3 minutos
module temporizador_3min(clk, clr, segmentos, hab);

	input clk;
	input [2:0]clr;
	output [8:0]segmentos;
	output hab;
	
	wire and1, and2, and3;
	wire clr_aux1, clr_aux2, clr_aux3;
	
	assign clr_aux1 = clr[2] | hab;
	// gera o primeiro digito dos segundos 0-9
	contador_decadico mod10(clk, clr_aux1, segmentos[8:5]);
	
	assign and1 = segmentos[8] & segmentos[6];
	
	assign clr_aux2 = clr[1] | hab;
	// gera o segundo digito dos segundos 0-5
	contador_modulo5 mod5(and1, clr_aux2, segmentos[4:2]);
	
	assign and2 = segmentos[4] & segmentos[3];
	
	assign clr_aux3 = clr[0] | hab;
	// gera o digito do minuto 0-2
	contador_modulo3 mod3(and2, clr_aux3, segmentos[1:0]);
	
	assign and3 = segmentos[1] & segmentos[0];
	
	// armazena o estado de habilitacao/desabilitacao em 2:59
	contador_modulo2 mod2(and3, clr[0], hab);
	
endmodule 
// sistema de segurança residencial
// alysson machado e matheus victor