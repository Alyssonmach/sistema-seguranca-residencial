// modulo de cadastro de senha
module entrada_senha(escolhe_digitos, senha_original, gerador_frequencia, habilitador);

	input [3:0]escolhe_digitos, senha_original;
	input gerador_frequencia;
	output habilitador;
	
	wire and1, and2, and3;
	wire and_bar1, and_bar2, and_bar3, and_bar4;
	wire [3:0]verifica_bits;
	
	wire [6:0]segmentos1_usuario;
	wire [3:0]digito1_usuario;
	contador_decadico dig1_usuario(escolhe_digitos[3], and1, digito1_usuario);
	display_7segmentos dig1_display(digito1_usuario, segmentos1_usuario);
	wire [3:0]digito1_sistema;
	contador_decadico dig1_sistema(senha_original[3], 1'b0, digito1_sistema);
	comparador_4bits digito1(digito1_usuario, digito1_sistema, verifica_bits[3]);
	
	wire [6:0]segmentos2_usuario;
	wire [3:0]digito2_usuario;
	contador_decadico dig2_usuario(escolhe_digitos[2], and1, digito2_usuario);
	display_7segmentos dig2_display(digito2_usuario, segmentos2_usuario);
	wire [3:0]digito2_sistema;
	contador_decadico dig2_sistema(senha_original[2], 1'b0, digito2_sistema);
	comparador_4bits digito2(digito2_usuario, digito2_sistema, verifica_bits[2]);
	
	wire [6:0]segmentos3_usuario;
	wire [3:0]digito3_usuario;
	contador_decadico dig3_usuario(escolhe_digitos[1], and1, digito3_usuario);
	display_7segmentos dig3_display(digito3_usuario, segmentos3_usuario);
	wire [3:0]digito3_sistema;
	contador_decadico dig3_sistema(senha_original[1], 1'b0, digito3_sistema);
	comparador_4bits digito3(digito3_sistema, digito3_usuario, verifica_bits[1]);
	
	wire [6:0]segmentos4_usuario;
	wire [3:0]digito4_usuario;
	contador_decadico dig4_usuario(escolhe_digitos[0], and1, digito4_usuario);
	display_7segmentos dig4_display(digito4_usuario, segmentos4_usuario);
	wire [3:0]digito4_sistema;
	contador_decadico dig4_sistema(senha_original[0], 1'b0, digito4_sistema);
	comparador_4bits digito4(digito4_sistema, digito4_usuario, verifica_bits[0]);
	
	assign and1 = verifica_bits[3] & verifica_bits[2] & verifica_bits[1] & verifica_bits[0];
	
	assign and_bar1 = ~digito1_sistema[3] & ~digito1_sistema[2] & ~digito1_sistema[1] & ~digito1_sistema[0];
	assign and_bar2 = ~digito2_sistema[3] & ~digito2_sistema[2] & ~digito2_sistema[1] & ~digito2_sistema[0];
	assign and_bar3 = ~digito3_sistema[3] & ~digito3_sistema[2] & ~digito3_sistema[1] & ~digito3_sistema[0];
	assign and_bar4 = ~digito4_sistema[3] & ~digito4_sistema[2] & ~digito4_sistema[1] & ~digito4_sistema[0];
	
	assign and2 = and_bar1 & and_bar2 & and_bar3 & and_bar4;
	
	wire saida_estado;
	contador_modulo2 estado_saida(and1, and2, saida_estado);
	
	assign and3 = gerador_frequencia & saida_estado;
	
	wire [8:0]segmentos_tempo;
	temporizador_3min espera_habilitador(and3, ~{saida_estado, saida_estado, saida_estado}, segmentos_tempo, habilitador);
	
	wire [6:0]segmentos_minuto;
	wire [6:0]segmentos_segundo1;
	wire [6:0]segmentos_segundo2;
	display_7segmentos minutos({1'b0, 1'b0, segmentos_tempo[1:0]}, segmentos_minuto);
	display_7segmentos segundos1({1'b0, segmentos_tempo[4:2]}, segmentos_segundo1);
	display_7segmentos segundos2(segmentos_tempo[8:5], segmentos_segundo2);
	
	
endmodule 
// sistema de segurança residencial
// alysson machado e matheus victor
