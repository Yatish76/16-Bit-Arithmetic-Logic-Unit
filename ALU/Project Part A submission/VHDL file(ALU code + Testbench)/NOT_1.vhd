library ieee;
use ieee.std_logic_1164.all;

entity NOT_1 is
   port (n_1 : in bit ; out_3 : out bit);
end NOT_1;

architecture arc_3 of NOT_1 is
begin 
   out_3 <= not n_1;
end arc_3;