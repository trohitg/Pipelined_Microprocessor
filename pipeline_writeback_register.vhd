library ieee;
use ieee.std_logic_1164.all;
library work;
use work.components.all;

entity pipeline_writeback_register is
port (clk ,en , clr : in bit;
    pc_1_i ,rese_9_i , T3_i , Data_mem_i: in  bit_vector  (15 downto 0);
    pc_1_o ,rese_9_o , T3_o , Data_mem_o: out  bit_vector  (15 downto 0);
    cs_i: in bit_vector(15 downto 0);
    cs_o: out bit_vector(15 downto 0));
end entity;

architecture final of pipeline_writeback_register is
-------------------------------------------------------
begin

writeback_pc_1: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => pc_1_i,
    dout => pc_1_o,
    enable => en,
    clr => clr,
    clk => clk);

writeback_rese9: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => rese_9_i,
    dout => rese_9_o,
    enable => en,
    clr => clr,
    clk => clk);

writeback_t3: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => T3_i,
    dout => T3_o,
    enable => en,
    clr => clr,
    clk => clk);

writeback_datamem: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => Data_mem_i,
    dout => Data_mem_o,
    enable => en,
    clr => clr,
    clk => clk);

writeback_cs: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => cs_i,
    dout => cs_o,
    enable => en,
    clr => clr,
    clk => clk);

end final;
