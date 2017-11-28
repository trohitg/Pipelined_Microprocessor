
entity mux_2_1_8 is
   port(x,y : in bit_vector(7 downto 0);
  s : in bit;
        o : out bit_vector(7 downto 0));
end entity;

architecture sta of mux_2_1_8 is

begin
  o(0)  <= (x(0) and s) or (y(0) and (not s));
  o(1)  <= (x(1) and s) or (y(1) and (not s));
  o(2)  <= (x(2) and s) or (y(2) and (not s));
  o(3)  <= (x(3) and s) or (y(3) and (not s));
  o(4)  <= (x(4) and s) or (y(4) and (not s));
  o(5)  <= (x(5) and s) or (y(5) and (not s));
  o(6)  <= (x(6) and s) or (y(6) and (not s));
  o(7)  <= (x(7) and s) or (y(7) and (not s));

end sta ;
