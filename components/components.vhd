library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

package EE224_Components is
   
   component positive_d_latch is
	port (d, clk: in bit; q : out bit);
   end component;
   
   component negative_d_latch is
	port (d, clk: in bit; q : out bit);
   end component;
   
   component DF is
	port (d, clk ,en, clr: in bit; q : out bit);
   end component;

end EE224_Components;



library ieee;
use ieee.std_logic_1164.all;
use work.EE224_Components.all; 
entity positive_d_latch is
  port (d, clk: in bit; q: out bit);
end entity positive_d_latch;
architecture Equations of positive_d_latch is
   signal qsig: bit;
begin
   -- q cannot be read.
   qsig    <= (d and clk) or (qsig and (not clk));
   q <= qsig;
end Equations;

library ieee;
use ieee.std_logic_1164.all;
use work.EE224_Components.all; 
entity negative_d_latch is
  port (d, clk: in bit; q: out bit);
end entity negative_d_latch;
architecture Equations of negative_d_latch is
   signal qsig: bit;
begin
   qsig    <= (d and (not clk)) or (qsig and clk);
   q <= qsig;
end Equations;

library ieee;
use ieee.std_logic_1164.all;
use work.EE224_Components.all; 
entity DF is
  port (d, clk ,en, clr: in bit; q : out bit);
end entity DF;

architecture Struct of DF is
   signal U ,a1,a2: bit;
begin
   a1 <= (((d and en) or ( a2 and not(en))) and not(clr));
   master: negative_d_latch
            port map (d => a1, clk => clk, q => U);
   slave: positive_d_latch
            port map (d => U, clk => clk, q => a2);
	q <= a2;
end Struct;