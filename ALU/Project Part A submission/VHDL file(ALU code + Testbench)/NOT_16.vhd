library ieee;
use ieee.std_logic_1164.all;

entity NOT_16 is
   port(a : in bit_vector(15 downto 0);
	     b : out bit_vector(15 downto 0));
end NOT_16;

architecture arc of NOT_16 is
 
component NOT_1
   port (n_1 : in bit ;
         out_3 : out bit);
end component;

begin

arc_NOT: 
   for I in 0 to 15 generate
      Instance : NOT_1 port map(a(I),b(I));
        
   end generate arc_NOT;
end arc; 