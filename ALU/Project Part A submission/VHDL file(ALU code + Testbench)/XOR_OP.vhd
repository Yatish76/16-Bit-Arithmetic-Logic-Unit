library ieee;
use ieee.std_logic_1164.all;

entity XOR_OP is
   port(a,b : in bit_vector(15 downto 0);
	     r   : out bit_vector(15  downto 0) ) ;
end XOR_OP;

architecture arc of XOR_OP is

component XOR_2
    port(in_1,in_2: in bit;
	      output_1    : out bit);
end component;

begin
   arc_XOR: 
   for I in 0 to 15 generate
      Instance : XOR_2 port map(a(I),b(I),r(I));
        
   end generate arc_XOR;
end arc;