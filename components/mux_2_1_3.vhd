
entity mux_2_1_3 is
   port(x,y : in bit_vector(2 downto 0);
  s : in bit;
        o : out bit_vector(2 downto 0));
end entity;

architecture sta of mux_2_1_3 is
   
begin
  o(0)  <= (x(0) and s) or (y(0) and (not s));
  o(1)  <= (x(1) and s) or (y(1) and (not s));
  o(2)  <= (x(2) and s) or (y(2) and (not s));


end sta ;
