library work;
use work.EE224_Components.all;

entity decoder is
  port(din: in bit_vector(2 downto 0); dout: out bit_vector(7 downto 0));
end entity;

architecture LogicNetwork of decoder is
begin

  dout(0) <= (not(din(2)) and not (din(1))) and not(din(0));
  dout(1) <= (not(din(2)) and not (din(1))) and din(0);
  dout(2) <= (not(din(2)) and din(1)) and not(din(0));
  dout(3) <= (not(din(2)) and din(1)) and din(0);
  dout(4) <= (din(2) and not (din(1))) and not(din(0));
  dout(5) <= (din(2) and not (din(1))) and din(0);
  dout(6) <= (din(2) and din(1)) and not(din(0));
  dout(7) <= (din(2) and din(1)) and din(0);

end LogicNetwork;
