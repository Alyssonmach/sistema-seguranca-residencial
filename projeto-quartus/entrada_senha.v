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
	// entrada do usuario para escolha do digito[3] em decimal usando um binário de 4 bits
	contador_decadico dig1_usuario(escolhe_digitos[3], and1, digito1_usuario);
	// saida em um display de 7 segmentos do digito[3] escolhido
	display_7segmentos dig1_display(digito1_usuario, segmentos1_usuario);
	wire [3:0]digito1_sistema;
	// entrada do sistema para cadastro do digito[3] em decimal usando um binário de 4 bits
	contador_decadico dig1_sistema(senha_original[3], 1'b0, digito1_sistema);
	// compara o digito[3] do sistema com o do usuario
	comparador_4bits digito1(digito1_usuario, digito1_sistema, verifica_bits[3]);
	
	wire [6:0]segmentos2_usuario;
	wire [3:0]digito2_usuario;
	// entrada do usuario para escolha do digito[2] em decimal usando um binário de 4 bits
	contador_decadico dig2_usuario(escolhe_digitos[2], and1, digito2_usuario);
	// saida em um display de 7 segmentos do digito[2] escolhido
	display_7segmentos dig2_display(digito2_usuario, segmentos2_usuario);
	wire [3:0]digito2_sistema;
	// entrada do sistema para cadastro do digito[2] em decimal usando um binário de 4 bits
	contador_decadico dig2_sistema(senha_original[2], 1'b0, digito2_sistema);
	// compara o digito[2] do sistema com o do usuario
	comparador_4bits digito2(digito2_usuario, digito2_sistema, verifica_bits[2]);
	
	wire [6:0]segmentos3_usuario;
	wire [3:0]digito3_usuario;
	// entrada do usuario para escolha do digito[1] em decimal usando um binário de 4 bits
	contador_decadico dig3_usuario(escolhe_digitos[1], and1, digito3_usuario);
	// saida em um display de 7 segmentos do digito[1] escolhido
	display_7segmentos dig3_display(digito3_usuario, segmentos3_usuario);
	wire [3:0]digito3_sistema;
	// entrada do sistema para cadastro do digito[1] em decimal usando um binário de 4 bits
	contador_decadico dig3_sistema(senha_original[1], 1'b0, digito3_sistema);
	// compara o digito[1] do sistema com o do usuario
	comparador_4bits digito3(digito3_sistema, digito3_usuario, verifica_bits[1]);
	
	wire [6:0]segmentos4_usuario;
	wire [3:0]digito4_usuario;
	// entrada do usuario para escolha do digito[0] em decimal usando um binário de 4 bits
	contador_decadico dig4_usuario(escolhe_digitos[0], and1, digito4_usuario);
	// saida em um display de 7 segmentos do digito[0] escolhido
	display_7segmentos dig4_display(digito4_usuario, segmentos4_usuario);
	wire [3:0]digito4_sistema;
	// entrada do sistema para cadastro do digito[0] em decimal usando um binário de 4 bits
	contador_decadico dig4_sistema(senha_original[0], 1'b0, digito4_sistema);
	// compara o digito[0] do sistema com o do usuario
	comparador_4bits digito4(digito4_sistema, digito4_usuario, verifica_bits[0]);
	
	assign and1 = verifica_bits[3] & verifica_bits[2] & verifica_bits[1] & verifica_bits[0];
	
	assign and_bar1 = ~digito1_sistema[3] & ~digito1_sistema[2] & ~digito1_sistema[1] & ~digito1_sistema[0];
	assign and_bar2 = ~digito2_sistema[3] & ~digito2_sistema[2] & ~digito2_sistema[1] & ~digito2_sistema[0];
	assign and_bar3 = ~digito3_sistema[3] & ~digito3_sistema[2] & ~digito3_sistema[1] & ~digito3_sistema[0];
	assign and_bar4 = ~digito4_sistema[3] & ~digito4_sistema[2] & ~digito4_sistema[1] & ~digito4_sistema[0];
	
	assign and2 = and_bar1 & and_bar2 & and_bar3 & and_bar4;
	
	wire saida_estado;
	// memoriza o estado do circuito se esta habilitado ou nao
	contador_modulo2 estado_saida(and1, and2, saida_estado);
	
	assign and3 = gerador_frequencia & saida_estado;
	
	wire [8:0]segmentos_tempo;
	// temporizador de 3 min de espara antes de habilitar o sistema de seguranca
	temporizador_3min espera_habilitador(and3, ~{saida_estado, saida_estado, saida_estado}, segmentos_tempo, habilitador);
	
	wire [6:0]segmentos_minuto;
	wire [6:0]segmentos_segundo1;
	wire [6:0]segmentos_segundo2;
	// visualiza o digito de minuto do temporizador
	display_7segmentos minutos({1'b0, 1'b0, segmentos_tempo[1:0]}, segmentos_minuto);
	// visualiza o primeiro digito de segundo do temporizador
	display_7segmentos segundos1({1'b0, segmentos_tempo[4:2]}, segmentos_segundo1);
	// visualiza o segundo digito de segundo do temporizador
	display_7segmentos segundos2(segmentos_tempo[8:5], segmentos_segundo2);
	
	
endmodule 
// sistema de segurança residencial
// alysson machado e matheus victor
