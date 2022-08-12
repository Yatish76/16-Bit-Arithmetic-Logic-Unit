library ieee;
use ieee.std_logic_1164.all;

entity XOR_2 is
   port(in_1,in_2 : in bit;
	     output_1     : out bit);
end XOR_2;

architecture arc of XOR_2 is

signal w,x,y,z : bit;

component OR_2 
     port(o_1,o_2 : in bit ;
	       out_2   : out bit );
end component ;

component AND_2
     port(a_1,a_2 : in bit;
	       out_1   : out bit);
end component ;			 

component NOT_1
     port (n_1 : in bit ;
         out_3 : out bit);
end component ; 		  

begin
    instance1: NOT_1 port map(in_1,w);
	 instance2: NOT_1 port map(in_2,x);
	 instance3: OR_2  port map(in_1,in_2,y);
	 instance4: OR_2  port map(w,x,z);
	 instance5: AND_2 port map(y,z,output_1);
	 
end arc;
