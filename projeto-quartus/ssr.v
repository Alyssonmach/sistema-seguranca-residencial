// modulo do projeto de sistema de seguranca residencial completo
module ssr
(
	input [4:1]j,		
	input p, i, y,	
	input [3:0]senha_sistema, senha_usuario, 
	input gerador_frequencia,
	output alarme

);

	wire habilitador;
	wire[5:0]fio;
	wire and1, or1;
	
	// instanciacao do modulo de entrada de senha
	entrada_senha es_ssr(senha_usuario, senha_sistema, gerador_frequencia, habilitador);
	
	// verifica as possibilidades de violacao da residencial
	and_3entradas Z1(i,~y,habilitador,fio[0]);
	and_3entradas Z2(p,y,habilitador,fio[1]);
	and_3entradas Z3(j[1],y,habilitador,fio[2]);
	and_3entradas Z4(j[2],y,habilitador,fio[3]);
	and_3entradas Z5(j[3],y,habilitador,fio[4]);
	and_3entradas Z6(j[4],y,habilitador,fio[5]);
	
	// verifica se pelo menos uma das entradas da casa foi violada
	or_6entradas K(fio[0],fio[1],fio[2],fio[3],fio[4],fio[5],alarme);

endmodule 
// sistema de segurança residencial
// alysson machado e matheus victor