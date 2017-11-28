library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity se6 is
port (input_6: in bit_vector(5 downto 0);
	output_16: out bit_vector(15 downto 0));
end entity;

architecture simple of se6 is
begin
output_16(5) <= input_6(5);
output_16(4) <= input_6(4);
output_16(3) <= input_6(3);
output_16(2) <= input_6(2);
output_16(1) <= input_6(1);
output_16(0) <= input_6(0);
output_16(9) <= '0';
output_16(8) <= '0';
output_16(7) <= '0';
output_16(6) <= '0';
output_16(15) <= '0';
output_16(14) <= '0';
output_16(13) <= '0';
output_16(12) <= '0';
output_16(11) <= '0';
output_16(10) <= '0';
end architecture;

