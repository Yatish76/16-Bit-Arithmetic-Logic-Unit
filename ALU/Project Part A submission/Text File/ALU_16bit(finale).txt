library ieee;
use ieee.std_logic_1164.all;

entity ALU_16bit is
    port( Ain,Bin : in bit_vector(15 downto 0) ;
S0, S1 : in bit ;
	      Rout   : out bit_vector(15 downto 0) ;
Carry, zero : out bit 
);

end ALU_16bit;

architecture arc of ALU_16bit is

component NAND_OP
     port(a,b : in bit_vector(15 downto 0);
	     r   : out bit_vector(15  downto 0) ) ;
end component;

component XOR_OP
     port(a,b : in bit_vector(15 downto 0);
	     r   : out bit_vector(15  downto 0) ) ;
end component;

component ADD_OP is
    port(Ain, Bin : in bit_vector(15 downto 0);
	      Sout   : out bit_vector(15 downto 0);
			c_out: out bit);
end component;

component SUB_OP is
    port(Ain, Bin : in bit_vector(15 downto 0);
	      Sout   : out bit_vector(15 downto 0);
			c_out: out bit);
end component;

component NOR_16
  
port
( Rin       : in bit_vector(15 downto 0) ;
  out_NOR16 : out bit);

end component;

component NOT_1 is
   port (n_1 : in bit ;
         out_3 : out bit);
end component;

component AND_2 is
    port(a_1,a_2 : in bit ;
	      out_1     : out bit );
end component;

component Mux4to1

port
( S0, S1, I0, I1, I2, I3  : in bit ;
  Mux_Out 		  : out bit ) ;

end component;


signal 

Rout1,Rout2, Rout3, Rout4, Rout_temp : bit_vector(15 downto 0); signal C1, C2, carry_temp : bit ;

begin
    
op1 : ADD_OP

port map (Ain,Bin,Rout1, C1);

op2 : SUB_OP

port map (Ain,Bin,Rout2, C2);

op3 : NAND_OP 

port map (Ain,Bin,Rout3);

op4 : XOR_OP

port map (Ain,Bin,Rout4);


arc_MUX:

for J in 0 to 15 generate

	m1	: Mux4to1

	port map (S0, S1, Rout1(J), Rout2(J), Rout3(J), Rout4(J), Rout_temp(J));

end generate arc_MUX ;

Rout <= Rout_temp;


m2	: Mux4to1

port map (S0, S1, C1, C2, '0' , '0', carry_temp);

Carry <= carry_temp;

z0: NOR_16

port map( Rout_temp, zero );


	 
end arc;