library ieee;
use ieee.std_logic_1164.all;
library work;
use work.components.all;

entity pipeline_memory_register is
port (clk ,en , clr : in bit;
    pc_1_i ,rese_9_i , T3_i , D2_i: in  bit_vector  (15 downto 0);
    pc_1_o ,rese_9_o , T3_o , D2_o: out  bit_vector  (15 downto 0);
    cs_i: in bit_vector(15 downto 0);
    cs_o: out bit_vector(15 downto 0));
end entity;

architecture final of pipeline_memory_register is
-------------------------------------------------------
begin

memory_pc_1: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => pc_1_i,
    dout => pc_1_o,
    enable => en,
    clr => clr,
    clk => clk);

memory_rese9: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => rese_9_i,
    dout => rese_9_o,
    enable => en,
    clr => clr,
    clk => clk);

memory_t3: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => T3_i,
    dout => T3_o,
    enable => en,
    clr => clr,
    clk => clk);

memory_d2: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => D2_i,
    dout => D2_o,
    enable => en,
    clr => clr,
    clk => clk);

memory_cs: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => cs_i,
    dout => cs_o,
    enable => en,
    clr => clr,
    clk => clk);

end final;
