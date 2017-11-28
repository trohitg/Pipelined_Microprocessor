library std;
use std.standard.all;

library ieee;
use ieee.numeric_std.all;
Use IEEE.STD_LOGIC_1164.all;

entity data_memory is
generic (data_width: integer:= 16; addr_width: integer := 31);
   port(din: in bit_vector(data_width-1 downto 0);
        dout: out bit_vector(data_width-1 downto 0);
		clr: in bit;
        wr: in bit;
        mem_addr: in bit_vector(data_width-1 downto 0);
        clk: in bit);
end entity;


architecture behavioral of data_memory is
type MemArray is array(natural range <>) of bit_vector(data_width-1 downto 0);
   signal memories: MemArray(0 to ((addr_width)-1));
begin

  meFile : process (clk, clr , wr) is
  begin
  if(clr = '1')then
	 memories   <= (others=>(others=>'0'));

    elsif (clk'event and clk = '1' and wr = '1') then
				memories(to_integer(unsigned(to_stdlogicvector(mem_addr)))) <= din;  -- Write
		end if;
  end process;
		dout <= memories(to_integer(unsigned(to_stdlogicvector(mem_addr))));

end;
