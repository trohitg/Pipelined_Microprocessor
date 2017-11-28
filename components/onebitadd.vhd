-----------------------------------------------
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------
entity onebitadd is
   port(x,y,c: in bit;
        d,s: out bit);
end entity;

architecture sta of onebitadd is
   signal a,b,e: bit;
begin
   a  <= ( x and y);
   b  <= ((x or y) and (not a));
   s  <= ((b or c) and (not(b and c)));
   d  <= ( a or ((x or y) and c));
end sta;
