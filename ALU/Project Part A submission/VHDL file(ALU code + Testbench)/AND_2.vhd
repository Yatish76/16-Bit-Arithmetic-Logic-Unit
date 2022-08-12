library ieee;
use ieee.std_logic_1164.all;


entity AND_2 is
   port( a_1,a_2 : in bit; out_1 : out bit );
	end AND_2;
	
architecture arc_1 of AND_2 is
begin
    out_1 <= a_1 and a_2 ;
end arc_1;