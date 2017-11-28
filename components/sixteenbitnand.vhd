library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity sixteenbitnand is
    port (x,y : in bit_vector(  15 downto 0 );
	  z : out  bit_vector  (  15 downto 0));

end entity;

architecture behave of sixteenbitnand is

--------------
begin
z(15 downto 0) <= x(15 downto 0) nand y(15 downto 0) ;
--------------
end behave;
