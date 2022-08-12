library ieee;
use ieee.std_logic_1164.all;

entity NAND_OP is
   port(a,b : in bit_vector(15 downto 0);
	     r   : out bit_vector(15  downto 0) ) ;
end NAND_OP;

architecture arc of NAND_OP is

component NAND_2
    port(in_1,in_2: in bit;
	      output_1    : out bit);
end component;

begin
   arc_NAND: 
   for I in 0 to 15 generate
      Instance : NAND_2 port map(a(I),b(I),r(I));
        
   end generate arc_NAND;
end arc;
