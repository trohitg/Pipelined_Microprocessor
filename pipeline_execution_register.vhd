library ieee;
use ieee.std_logic_1164.all;
library work;
use work.components.all;

entity pipeline_execution_register is
    port (clk ,en , clr : in bit;
    pc_1_i ,rese_9_i , ALU_1_i , ALU_2_i , D2_i: in  bit_vector  (15 downto 0);
    pc_1_o ,rese_9_o , ALU_1_o , ALU_2_o , D2_o: out  bit_vector  (15 downto 0);
    cs_i: in bit_vector(15 downto 0);
    cs_o: out bit_vector(15 downto 0));
end entity;

architecture final of pipeline_execution_register is
-------------------------------------------------------
begin

execution_pc_1: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => pc_1_i,
    dout => pc_1_o,
    enable => en,
    clr => clr,
    clk => clk);

execution_rese9: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => rese_9_i,
    dout => rese_9_o,
    enable => en,
    clr => clr,
    clk => clk);

execution_alu1: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => ALU_1_i,
    dout => ALU_1_o,
    enable => en,
    clr => clr,
    clk => clk);

execution_alu2: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => ALU_2_i,
    dout => ALU_2_o,
    enable => en,
    clr => clr,
    clk => clk);

execution_d2: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => D2_i,
    dout => D2_o,
    enable => en,
    clr => clr,
    clk => clk);

execution_cs: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => cs_i,
    dout => cs_o,
    enable => en,
    clr => clr,
    clk => clk);

end final;
