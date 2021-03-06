library ieee;
use ieee.std_logic_1164.all;
library work;
use work.components.all;

entity controller is
  port(opcode: in bit_vector(3 downto 0);
  clk: in bit;
  cs: out bit_vector(3 downto 0));
end entity;

architecture LogicNetwork of controller is

begin

  process(opcode )

  begin

  case opcode is

    when "0000" =>
      cs <= "0000"; -- ADD/ADC/ADZ
      --op <= '0';     -- ADD OPERATION

    when "0010" =>
      cs <= "0010"; -- NDU/NDC/NDZ
      --op <= '1';     -- NAND OPERATION

    when "0001" =>
      cs <= "0001"; -- ADI

    when "0011" =>
      cs <= "0011"; -- LHI

    when "0100" =>
      cs <= "0100"; -- LW

    when "0101" =>
      cs <= "0101"; -- SW

    when "0110" =>
      cs <= "0110"; -- LM

    when "0111" =>
      cs <= "0111"; -- SM

     when "1100" =>
      cs <= "1100"; -- BEQ;

    when "1000" =>
      cs <= "1000"; -- JAL;

    when "1001" =>
      cs <= "1001"; -- JLR;

    when others =>
	 cs <= "1111"; -- OTHERS;
    end case;

  end process;

end LogicNetwork;

