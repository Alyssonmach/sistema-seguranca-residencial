// modulo de teste para a ativacao do sistema de alarme
module sistema_alarme
(
	input [3:0] J,
	input P, I, Y,
	input ENABLE,
	output A
);

	wire[5:0] FIO;

	and_3entradas Z1(I,~Y,ENABLE,FIO[0]);
	and_3entradas Z2(P,Y,ENABLE,FIO[1]);
	and_3entradas Z3(J[0],Y,ENABLE,FIO[2]);
	and_3entradas Z4(J[1],Y,ENABLE,FIO[3]);
	and_3entradas Z5(J[2],Y,ENABLE,FIO[4]);
	and_3entradas Z6(J[3],Y,ENABLE,FIO[5]);
	
	or_6entradas K(FIO[0],FIO[1],FIO[2],FIO[3],FIO[4],FIO[5],A);

endmodule 