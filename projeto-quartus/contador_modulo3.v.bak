// modulo contador modulo 3
module contador_modulo3(clk, clear, s);

	input clk, clear;
	output [1:0]s;
	
	wire and1;
	wire clear_aux;
	
	ff_jk ff1(clear_aux, clk, 1, 1, s[0]);
	ff_jk ff2(clear_aux, clk, s[0], s[0], s[1]);
	
	assign and1 = s[0] & s[1];
	assign clear_aux = and1 | clear;
	
endmodule
// sistema de segurança residencial
// alysson machado e matheus victor