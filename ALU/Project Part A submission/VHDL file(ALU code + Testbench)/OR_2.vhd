library ieee;
use ieee.std_logic_1164.all;

entity OR_2 is
    port( o_1,o_2 : in bit ; out_2 : out bit );
end OR_2;

architecture arc_2 of OR_2 is
begin
    out_2 <= o_1 or o_2 ;
end arc_2;