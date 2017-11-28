library std;
use std.standard.all;

library ieee;
use ieee.numeric_std.all;
Use IEEE.STD_LOGIC_1164.all;

entity memory is
  port(
    data_out      : out bit_vector(15 downto 0);
    data_in       : in  bit_vector(15 downto 0);
    writeEnable : in  bit;
   
    mem_addr     : in  bit_vector(15 downto 0);
    clr	:in bit;
    clk         : in  bit
    );
end memory;


architecture behavioral of memory is
  type memoryFile is array(0 to 63) of bit_vector(15 downto 0);
  signal memories : memoryFile;
begin

  meFile : process (clk, clr) is
  begin
  if(clr = '1')then
    -- memories(0)  <= "0000000000000000";  -- Stalling;
    memories(0)  <= "0100011001100000"; -- lw r3,r1,100000
    memories(1)  <= "0110011001111111";  -- lm r3,001111111;

    memories(2)  <= "0000001100000000";  -- add r0,r1,r4";
    memories(3)  <= "0000011100010010";  -- add r2,r3,r4";
    memories(4)  <= "0000110101011001";  -- adz r3,r6,r5";
    memories(5)  <= "0001101010001010";  -- adi r2,r5,001010";
    memories(6)  <= "0010110001000000";  -- ndu r0,r6,r1";
    memories(7)  <= "0010011010000010";  -- ndc r0,r3,r2";
    memories(8)  <= "0010111100101001";  -- ndz r5,r7,r4";

    memories(9)  <= "0011011000010100";  -- lhi r3,000010100";
   -- memories(18)  <= "0100011001001100";  -- lw r3,r1,001100";
    memories(10) <= "0101101110000010";  -- sw r5,r6,000010";
    memories(11) <= "0111110000100101";  -- sm r6,000010101";

    memories(12) <= "1000100000000001";  -- jal r4,000000001";
    memories(13) <= "0000011100010000";  -- add r2,r3,r4";
    memories(14) <= "0101100110000010";  -- sw r4,r6,000010";
    memories(15) <= "0000100011101000";  -- add r5,r4,r3;

    memories(16) <= "1100101100000010";  -- beq r5,r4,000010;
    memories(17)  <= "0000010100000000";  -- add r0,r2,r4";
    memories(18)  <= "0010101010000010";  -- ndc r0,r5,r2";

    memories(19)  <= "0100001110010000"; -- lw r1,r6,010000
    memories(20)  <= "0100010110010000"; -- lw r2,r6,010000

    memories(21) <= "1001011010000000";  -- jlr r3,r2";

   	memories(22)  <= "0010011010000010";  -- ndc r0,r3,r2";
    memories(23)  <= "0010111100101001";  -- ndz r5,r7,r4";

    ---- all 00s
    memories(24)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(25)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(26)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(27)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(28)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(29)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(30)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(31)  <= "0000000000000000";  -- ndz r5,r7,r4";


    ---------data mem
    memories(32)  <= "0000000000100000"; ---r0 
    memories(33)  <= "0000000000000000"; ---r1
    memories(34)  <= "0000000000000101"; ---r2
    memories(35)  <= "0000000000000111"; --r3
    memories(36)  <= "0000000000000000"; --r4
    memories(37)  <= "0000000000001000"; --r5  
    memories(38)  <= "0000000000100000"; --r6

    memories(39)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(40)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(41)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(42)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(43)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(44)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(45)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(46)  <= "0000000000000000";  -- ndz r5,r7,r4";

    memories(47)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(48)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(49)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(50)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(51)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(52)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(53)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(54)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(55)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(56)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(57)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(58)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(59)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(60)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(61)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(62)  <= "0000000000000000";  -- ndz r5,r7,r4";
    memories(63)  <= "0000000000000000";  -- ndz r5,r7,r4";
 

	--memories   <=(others=>(others=>'0'));
    elsif (clk = '1' and writeEnable = '1') then
        memories(to_integer(unsigned(to_stdlogicvector(mem_addr)))) <= data_in;  -- Write
      end if;
  end process;
     data_out <= memories(to_integer(unsigned(to_stdlogicvector(mem_addr))));
     
end;
