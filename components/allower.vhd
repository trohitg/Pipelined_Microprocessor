library work;
use work.EE224_Components.all;

entity allower is
  port(di: in bit_vector(15 downto 0); s2,s1,s0: in bit; do: out bit_vector(15 downto 0));
end entity;

architecture LogicNetwork of allower is
begin

  do(0) <= ((s2 and s1) and s0) and di(0);
  do(1) <= ((s2 and s1) and s0) and di(1);
  do(2) <= ((s2 and s1) and s0) and di(2);
  do(3) <= ((s2 and s1) and s0) and di(3);
  do(4) <= ((s2 and s1) and s0) and di(4);
  do(5) <= ((s2 and s1) and s0) and di(5);
  do(6) <= ((s2 and s1) and s0) and di(6);
  do(7) <= ((s2 and s1) and s0) and di(7);
  do(8) <= ((s2 and s1) and s0) and di(8);
  do(9) <= ((s2 and s1) and s0) and di(9);
  do(10) <= ((s2 and s1) and s0) and di(10);
  do(11) <= ((s2 and s1) and s0) and di(11);
  do(12) <= ((s2 and s1) and s0) and di(12);
  do(13) <= ((s2 and s1) and s0) and di(13);
  do(14) <= ((s2 and s1) and s0) and di(14);
  do(15) <= ((s2 and s1) and s0) and di(15);
  
end LogicNetwork;