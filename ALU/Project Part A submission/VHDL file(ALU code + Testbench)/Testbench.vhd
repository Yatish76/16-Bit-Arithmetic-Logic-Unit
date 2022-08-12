LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity Testbench is
end Testbench;


architecture tb of Testbench is

signal input1, input2, result : bit_vector(15 downto 0) ;
signal S0, S1, c, z : bit;


component ALU_16bit is
    port( Ain, Bin    : in bit_vector(15 downto 0) ;
          S0, S1      : in bit ;
	       Rout        : out bit_vector(15 downto 0) ;
          Carry, zero : out bit );
end component;

begin

dut_instance: ALU_16bit
port map (Ain=>input1, Bin=>input2, S0=>S0, S1=>S1, Rout=>result, Carry=>c, zero=>z);


process
begin



-----------------------adder tb


input1 <= "1111111111111111";
input2 <= "1111111111111111";
S0 <= '0';
S1 <= '0';
wait for 5 ns;     --1111111111111110, carry=1, zero=0

input1 <= "0000000000000000";
input2 <= "0000000000000000";
S0 <= '0';
S1 <= '0';
wait for 5 ns;     --0000000000000000, carry=0, zero=1

input1 <= "1010101010101010";
input2 <= "0101010101010101";
S0 <= '0';
S1 <= '0';
wait for 5 ns;     --1111111111111111, carry=0, zero=0

input1 <= "1000000000000000";
input2 <= "1000000000000000";
S0 <= '0';
S1 <= '0';
wait for 5 ns;     --0000000000000000, carry=1, zero=1

input1 <= "1000000000000000";
input2 <= "0000000000000000";
S0 <= '0';
S1 <= '0';
wait for 5 ns;     --1000000000000000, carry=0, zero=0

input1 <= "1111111111111111";
input2 <= "0000000000000000";
S0 <= '0';
S1 <= '0';   --1111111111111111, carry=0, zero=0
wait for 5 ns;



-----------------------subtractor tb


input1 <= "1010101010101010";
input2 <= "0010101010101010";
S0 <= '1';
S1 <= '0';
wait for 5 ns;     --1000000000000000, carry=1, zero=0

input1 <= "0000000000000000";
input2 <= "0000000000000000";
S0 <= '1';
S1 <= '0';
wait for 5 ns;     --0000000000000000, carry=1, zero=1

input1 <= "0000000000000000";
input2 <= "1111111111111111";
S0 <= '1';
S1 <= '0';
wait for 5 ns;     --0000000000000001, carry=0, zero=0

input1 <= "1111111111111111";
input2 <= "1111111111111111";
S0 <= '1';
S1 <= '0';
wait for 5 ns;     --0000000000000000, carry=1, zero=1

input1 <= "1111111111111110";
input2 <= "1111111111111111";
S0 <= '1';
S1 <= '0';
wait for 5 ns;     --1111111111111111, carry=0, zero=0



-----------------------NAND tb


input1 <= "1010111100001010";
input2 <= "0000101011110101";
S0 <= '0';
S1 <= '1';
wait for 5 ns;     --1111010111111111, carry=0, zero=0

input1 <= "1111111111111111";
input2 <= "1111111111111111";
S0 <= '0';
S1 <= '1';
wait for 5 ns;     --0000000000000000, carry=0, zero=1

input1 <= "1010101010101010";
input2 <= "0101010101010101";
S0 <= '0';
S1 <= '1';
wait for 5 ns;     --1111111111111111, carry=0, zero=0

input1 <= "0000000000000000";
input2 <= "0000000000000000";
S0 <= '0';
S1 <= '1';
wait for 5 ns;     --1111111111111111, carry=0, zero=0

input1 <= "1010101010101010";
input2 <= "1010101010101010";
S0 <= '0';
S1 <= '1';
wait for 5 ns;     --0101010101010101, carry=0, zero=0



-------------------------XOR tb


input1 <= "1010111100001010";
input2 <= "0000101011110101";
S0 <= '1';
S1 <= '1';
wait for 5 ns;     --1010010111111111, carry=0, zero=0

input1 <= "0000000000000000";
input2 <= "0000000000000000";
S0 <= '1';
S1 <= '1';
wait for 5 ns;     --0000000000000000, carry=0, zero=1

input1 <= "1010101010101010";
input2 <= "0101010101010101";
S0 <= '1';
S1 <= '1';
wait for 5 ns;     --1111111111111111, carry=0, zero=0

input1 <= "1111111111111111";
input2 <= "1111111111111111";
S0 <= '1';
S1 <= '1';
wait for 5 ns;     --0000000000000000, carry=0, zero=1

input1 <= "1010101010101010";
input2 <= "1010101010101010";
S0 <= '1';
S1 <= '1';
wait for 5 ns;     --0000000000000000, carry=0, zero=1



end process;
end tb ;
