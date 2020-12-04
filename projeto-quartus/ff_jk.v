// modulo flip-flop jk
module ff_jk(clear, clk, j, k, q);

	input clear, clk, j, k; 
	output reg q;

  
   always @ (posedge clk, posedge clear)
		begin
		   // entrada sincrona do clear
			if(clear) q <= 1'b0;
			else 
				begin 
					case({j, k})
					   // casos de estado do flip-flop jk
						0: q = q;
						1: q = 0;
						2: q = 1;
						3: q = ~q;
					endcase
				end
		end
			
endmodule  
// sistema de segurança residencial
// alysson machado e matheus victor