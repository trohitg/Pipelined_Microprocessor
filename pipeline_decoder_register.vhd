library ieee;
use ieee.std_logic_1164.all;
library work;
use work.components.all;

entity pipeline_decoder_register is
    port (clk ,en , clr : in bit;
    pc_1_i , pc_i , ir_i : in  bit_vector  (15 downto 0);
    pc_1_o , pc_o , ir_o : out  bit_vector  (15 downto 0));
end entity;

architecture final of pipeline_decoder_register is
-------------------------------------------------------
begin

decoder_pc_1: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => pc_1_i,
    dout => pc_1_o,
    enable => en,
    clr => clr,
    clk => clk);

decoder_pc: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => pc_i,
    dout => pc_o,
    enable =>en,
    clr => clr,
    clk => clk);

decoder_ir: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => ir_i,
    dout => ir_o,
    enable =>en,
    clr => clr,
    clk => clk);

end final;
