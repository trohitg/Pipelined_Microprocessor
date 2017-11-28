library std;
use std.standard.all;

library ieee;
use ieee.numeric_std.all;
Use IEEE.STD_LOGIC_1164.all;

entity memory is
generic (data_width: integer:= 16; addr_width: integer := 31);
   port(din: in bit_vector(data_width-1 downto 0);
        dout: out bit_vector(data_width-1 downto 0);
        en: in bit;
        wr: in bit;
        mem_addr: in bit_vector(addr_width-1 downto 0);
        clk: in bit);
end memory;


architecture behavioral of memory is
type MemArray is array(natural range <>) of bit_vector(data_width-1 downto 0);
   signal memories: MemArray(0 to ((addr_width)-1));
begin

  meFile : process (clk, clr) is
  begin
  if(clr = '1')then
    memories(0)  <= "0000000000000000";  -- Stalling;
    memories(1)  <= "0100011001100000"; -- lw r3,r1,100000
    memories(2)  <= "0110011001111111";  -- lm r3,001111111;

    memories(3)  <= "0000001100000000";  -- add r0,r1,r4";
    memories(4)  <= "0000011100010010";  -- adc r2,r3,r4";
    memories(5)  <= "0000110101011001";  -- adz r3,r6,r5";
    memories(6)  <= "0001101010001010";  -- adi r2,r5,001010";
    memories(7)  <= "0010110001000000";  -- ndu r0,r6,r1";
    memories(8)  <= "0010011010000010";  -- ndc r0,r3,r2";
    memories(9)  <= "0010111100101001";  -- ndz r5,r7,r4";

    memories(10)  <= "0011011000010100";  -- lhi r3,000010100";
   -- memories(18)  <= "0100011001001100";  -- lw r3,r1,001100";

	memories(11) <= "0100110100110100"; -- lw r6,r4,110100;

    memories(12) <= "1000000000000010";  -- jal r0,000000010";
    memories(13) <= "0000011100010000";  -- add r2,r3,r4";
    --memories(14) <= "0101100110000010";  -- sw r4,r6,000010";
    memories(14) <= "0000100011101000";  -- add r5,r4,r3;

    memories(15)  <= "1100001100000010";  -- beq r1,r4,000010;
    memories(16)  <= "0000010100000000";  -- add r0,r2,r4";
    memories(17)  <= "0010101010000010";  -- ndc r0,r5,r2";

    memories(18)  <= "0100011110010000"; -- lw r3,r6,001010
    memories(19)  <= "0100000110010000"; -- lw r0,r6,001010
    
    memories(20) <= "0101101110000111";  -- sw r5,r6,000111";
    memories(21) <= "0111110000010101";  -- sm r6,000010101";

    memories(22) <= "1001011100000000";  -- jlr r3,r4";

    memories(23)  <= "0010011010000010";  -- ndc r0,r3,r2";
    memories(24)  <= "0010111100101001";  -- ndz r5,r7,r4";


	memories   <= (others=>(others=>'0'));
    elsif (clk'event and clk = '1' and wr = '1') then
        memories(to_integer(unsigned(to_stdlogicvector(mem_addr)))) <= data_in;  -- Write
      end if;
  end process;
     data_out <= memories(to_integer(unsigned(to_stdlogicvector(mem_addr))));
     
end;
