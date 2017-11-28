library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity rse9 is
port( rinput_9: in bit_vector(8 downto 0);
	 output_16: out bit_vector(15 downto 0));
end entity;

architecture simple of rse9 is
begin
output_16(7) <= rinput_9(0);
output_16(8) <= rinput_9(1);
output_16(9) <= rinput_9(2);
output_16(10) <= rinput_9(3);
output_16(11) <= rinput_9(4);
output_16(12) <= rinput_9(5);
output_16(13) <= rinput_9(6);
output_16(14) <= rinput_9(7);
output_16(15) <= rinput_9(8);
output_16(6) <= '0';
output_16(0) <= '0';
output_16(1) <= '0';
output_16(2) <= '0';
output_16(3) <= '0';
output_16(4) <= '0';
output_16(5) <= '0';
end architecture;

