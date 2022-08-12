library ieee;
use ieee.std_logic_1164.all;

entity SUB_OP is
    port(Ain, Bin : in bit_vector(15 downto 0);
	      Sout   : out bit_vector(15 downto 0);
			c_out: out bit);
end SUB_OP;


architecture arc of SUB_OP is

component ADD_OP
    port(
	Ain		:in bit_vector(15 downto 0);				
	Bin		:in bit_vector(15 downto 0);				
	Sout		:out bit_vector(15 downto 0);	
	c_out	   :out bit);
end component;	
	
component NOT_16
    port(a : in bit_vector(15 downto 0);
	     b : out bit_vector(15 downto 0));
end component;

signal x_16,y_16,z_16        : bit_vector(15 downto 0);
signal y_1,z_1,temp_c        : bit;

begin

x_16 <= "0000000000000001"		 ;

instance01 : NOT_16 port map(Bin,y_16);
instance02 : ADD_OP port map(Ain,y_16,z_16,y_1); 
instance03 : ADD_OP port map(z_16,x_16,Sout,z_1);

temp_c <= y_1 or z_1 ;
c_out <= temp_c;

end arc;


