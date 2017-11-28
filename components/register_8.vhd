library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE224_Components.all;

entity register_8 is
  port(din: in bit_vector(7 downto 0); clk ,en ,clr : in bit; dout: out bit_vector(7 downto 0));
end entity;

architecture LogicNetwork of register_8 is
begin

  d7: DF port map (d => din(7), clk => clk ,en => en, clr => clr,q => dout(7));
  d6: DF port map (d => din(6), clk => clk ,en => en, clr => clr,q => dout(6));
  d5: DF port map (d => din(5), clk => clk ,en => en, clr => clr,q => dout(5));
  d4: DF port map (d => din(4), clk => clk ,en => en, clr => clr,q => dout(4));
  d3: DF port map (d => din(3), clk => clk ,en => en, clr => clr,q => dout(3));
  d2: DF port map (d => din(2), clk => clk ,en => en, clr => clr,q => dout(2));
  d1: DF port map (d => din(1), clk => clk ,en => en, clr => clr,q => dout(1));
  d0: DF port map (d => din(0), clk => clk ,en => en, clr => clr,q => dout(0));
  
end LogicNetwork;