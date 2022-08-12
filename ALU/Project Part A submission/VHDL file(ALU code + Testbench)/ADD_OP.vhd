library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_OP is

port(
	Ain		:in bit_vector(15 downto 0);				
	Bin		:in bit_vector(15 downto 0);				
	Sout		:out bit_vector(15 downto 0);	
	c_out	:out bit				
						
	
);

end ADD_OP;

architecture arc_ADDER of ADD_OP is

	
	signal 	Gin ,Pin, G1,G2,G3,G4,P1,P2,P3,P4, carry_temp, sum : bit_vector(15 downto 0);	
	
	component XOR_OP is
		port (a,b 	: in bit_vector (15 downto 0);
			r	: out bit_vector(15 downto 0));
	end component;
	
	
	begin
		
		adding : XOR_OP 
		port map( carry_temp , Pin, sum);

			
		process(Gin,Pin, G1,G2,G3,G4,P1,P2,P3,P4, carry_temp, sum,Ain,Bin)
		

		begin
		
		
			preprocessing:

			for i in 0 to 15 loop							
				Pin(i) <= Ain(i) XOR Bin(i);										
				Gin(i) <= Ain(i) AND Bin(i);
				
			end loop preprocessing ;
		

			P1 <= Pin;
			G1 <= Gin;

				
			Layer1:
			
			for i in 1 to 15 loop								
				
				P1(i) <= Pin(i) and Pin(i-1);
				G1(i) <= Gin(i) or (Pin(i) and Gin(i-1));
				
			end loop Layer1 ;
			
			
			G2 <= G1;
			P2 <= P1;
			

			Layer2:
				
			for i in 2 to 15 loop								
				
				G2(i) <=  G1(i) or ( G1(i-2) AND P1(i)   ) ;
				P2(i) <=  P1(i) and P1(i-2); 
				
			end loop Layer2 ;
			
			P3 <= P2 ;

			G3 <= G2 ;


			Layer3:
			
			for i in 4 to 15 loop
								
				P3(i) <= P2(i) and P2(i-4) ;
				G3(i) <=  ( P2(i) AND G2(i-4) ) or G2(i) ;
				
			end loop Layer3 ;
			
			
			P4 <=  P3  ;
			G4  <= G3  ;

			Layer4 :
			
			for i in 8 to 15 loop								
				
				P4(i) <=  P3(i) and P3(i-8);
				G4(i) <= G3(i) or ( P3(i) and G3(i-8));
				
			end loop Layer4 ;
			
			carry_temp(0)<='0';
			
			C_gen:
				for i in 0 to 14 loop								
				carry_temp(i+1) <= G4(i) OR ( carry_temp(0) and P4(i) )  ;
			end loop C_gen ;
			
			Sout <= sum ;														  
			c_out <= G4(15);
			
			
		end process;
	
end arc_ADDER;