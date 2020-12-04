// modulo comparador de 4 bits em binario
module comparador_4bits(A, B, out);

	input [3:0]A, B;
	output out;
	
	wire xnor1, xnor2, xnor3, xnor4;
	wire and1, and2;
	
	// so e verdade quando os bits sao iguais
	assign xnor1 = ~(A[3] ^ B[3]);
	assign xnor2 = ~(A[2] ^ B[2]);
	assign xnor3 = ~(A[1] ^ B[1]);
	assign xnor4 = ~(A[0] ^ B[0]);
	
	// garante que todos os bits sejam iguais
	assign and1 = xnor1 & xnor2;
	assign and2 = xnor3 & xnor4;
	assign out = and1 & and2;
	
endmodule
// sistema de segurança residencial
// alysson machado e matheus victor
	