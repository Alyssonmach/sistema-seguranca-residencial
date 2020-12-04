// modulo contador modulo 5
module contador_modulo5(clk, clear, s);

	input clk, clear;
	output [2:0]s;
	
	wire and1, and2;
	wire clear_aux;
	 
	ff_jk ff1(clear_aux, clk, 1, 1, s[0]);
	ff_jk ff2(clear_aux, clk, s[0], s[0], s[1]);
	assign and1 = s[0] & s[1];
	ff_jk ff3(clear_aux, clk, and1, and1, s[2]);
	
	assign and2 = s[1] & s[2];
	assign clear_aux = clear | and2;
	
endmodule
// sistema de segurança residencial
// alysson machado e matheus victor
	