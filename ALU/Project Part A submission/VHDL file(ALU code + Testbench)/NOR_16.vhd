library ieee;
use ieee.std_logic_1164.all;

entity NOR_16 is

port
( Rin       : in bit_vector(15 downto 0) ;
  out_NOR16 : out bit);

end NOR_16 ;


architecture arc_NOR_16 of NOR_16 is


component OR_2

port(o_1,o_2 : in bit ;
     out_2   : out bit );

end component;

component NOT_1

port (n_1   : in bit ;
      out_3 : out bit);

end component;


signal 

M_0, M_1, K : bit;

Signal 

P8 : bit_vector(7 downto 0);

Signal

P4 : bit_vector(3 downto 0);


begin

arc_NOR8:

for J in 0 to 7 generate
	L1 : OR_2
	port map ( Rin(J) , Rin(15-J) , P8(J) ) ;

end generate arc_NOR8 ;

arc_NOR4:

for I in 0 to 3 generate
	L2 : OR_2
	port map ( P8(I) , P8(7-I) , P4(I) ) ;

end generate arc_NOR4 ;

m0 : OR_2

port map ( P4(0) , P4(1) , M_0 ) ;

m1 : OR_2

port map ( P4(2) , P4(3) , M_1 ) ;

k0 : OR_2

port map ( M_0 , M_1 , K ) ;

OutNOR : NOT_1

port map ( K , out_NOR16 ) ;


end arc_NOR_16 ;