library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity se9 is
port (input_9: in bit_vector(8 downto 0);
	output_16: out bit_vector(15 downto 0));
end entity;

architecture simple of se9 is
begin
output_16(5) <= input_9(5);
output_16(4) <= input_9(4);
output_16(3) <= input_9(3);
output_16(2) <= input_9(2);
output_16(1) <= input_9(1);
output_16(0) <= input_9(0);
output_16(9) <= '0';
output_16(8) <= input_9(8);
output_16(7) <= input_9(7);
output_16(6) <= input_9(6);
output_16(15) <= '0';
output_16(14) <= '0';
output_16(13) <= '0';
output_16(12) <= '0';
output_16(11) <= '0';
output_16(10) <= '0';

end simple;

