
library std;
use std.standard.all;

library ieee;
use ieee.numeric_std.all;
Use IEEE.STD_LOGIC_1164.all;
use work.components.all;
--------------------------------------------------------------------------------------
entity mux_gener is 
generic (inputs: integer:= 4; signals: integer := 2);   -- size in bits of the selector, the number of inputs will be 2**n, change this if you want more 

port (inpu : in mux_array (0 to (inputs) - 1);
         sel : in bit_vector (signals - 1 downto 0);
         outpu: out bit_vector (bits - 1 downto 0)
);
end entity; 
--------------------------------------------------------------------------------
architecture behavioral of mux_gener is
begin
         outpu <= inpu(to_integer(unsigned(to_stdlogicvector(sel))));
end behavioral;