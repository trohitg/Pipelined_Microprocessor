
entity priority_encoder is
port (x :in bit_vector(7 downto 0); s :out bit_vector(2 downto 0));
end entity ;

architecture comb of priority_encoder is
begin


s(0) <= (x(1) and not x(0)) or (x(3) and not x(2) and not x(1) and not x(0)) or
(x(5) and not x(4) and not x(3) and not x(2) and not x(1) and not x(0)) or
(x(7) and not x(6) and not x(5) and not x(4) and not x(3) and not x(2) and not x(1) and not x(0));

s(1) <= (x(2) and not x(1) and not x(0)) or
(x(3) and not x(2) and not x(1) and not x(0)) or (x(6) and not x(5) and not x(4) and not x(3) and not x(2) and not x(1) and not x(0)) or (x(7) and not x(6) and not x(5) and not x(4) and not x(3) and not x(2) and not x(1) and not x(0));

s(2) <= (x(4) and not x(3) and not x(2) and not x(1) and not x(0)) or (x(5) and not x(4) and not x(3) and not x(2) and not x(1) and not x(0)) or (x(6) and not x(5) and not x(4) and not x(3) and not x(2) and not x(1) and not x(0)) or (x(7) and not x(6) and not x(5) and not x(4) and not x(3) and not x(2) and not x(1) and not x(0));

end comb ;
