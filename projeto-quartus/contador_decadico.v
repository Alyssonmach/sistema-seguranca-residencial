// modulo do contador de decada sincrono
module contador_decadico(clk, clear, s);

	input clk, clear;
	output [3:0]s;
	
	wire and1;
	wire and2;
	wire and3;
	wire clr_aux;
	
	// parte combinacional para o contador
	assign and3 = (s[3] & s[1]);
	assign clr_aux = and3 | clear;
	
	// usando flip-flops jk para montar um contador de modulo 10 (parte sequencial)
	ff_jk ff1(clr_aux, clk, 1, 1, s[0]);
	ff_jk ff2(clr_aux, clk, s[0], s[0], s[1]);
	assign and1 = s[0] & s[1];
	ff_jk ff3(clr_aux, clk, and1, and1, s[2]);
	assign and2 = s[0] & s[1] & s[2];
	ff_jk ff4(clr_aux, clk, and2, and2, s[3]);


endmodule 
// sistema de segurança residencial
// alysson machado e matheus victor