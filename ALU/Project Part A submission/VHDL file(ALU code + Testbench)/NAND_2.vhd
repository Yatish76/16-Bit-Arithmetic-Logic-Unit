library ieee;
use ieee.std_logic_1164.all;

entity NAND_2 is
    port(in_1,in_2: in bit;
	      output_1    : out bit);
end NAND_2;

architecture arc of NAND_2 is

signal x,y : bit;

component OR_2 
     port(o_1,o_2 : in bit ;
	       out_2   : out bit );
end component ;

component NOT_1
     port (n_1 : in bit ;
         out_3 : out bit);
end component ;

begin

 inst1: NOT_1 port map(in_1,x);			
 inst2: NOT_1 port map(in_2,y);
 inst3: OR_2  port map(x,y,output_1);
 
end arc;
