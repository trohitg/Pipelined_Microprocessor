
entity mux_4_1_3 is
   port(x0,x1,x2,x3 : in bit_vector(2 downto 0);
  s0,s1 : in bit;
        o : out bit_vector(2 downto 0));
end entity;

architecture sta of mux_4_1_3 is
   
begin
  o(0)  <= (x0(0) and (not s0) and (not s1)) or (x1(0) and (not s1) and s0) or (x2(0) and (not s0) and s1) or (x3(0) and s1 and s0);
  o(1)  <= (x0(1) and (not s0) and (not s1)) or (x1(1) and (not s1) and s0) or (x2(1) and (not s0) and s1) or (x3(1) and s1 and s0);
  o(2)  <= (x0(2) and (not s0) and (not s1)) or (x1(2) and (not s1) and s0) or (x2(2) and (not s0) and s1) or (x3(2) and s1 and s0);
 
end sta ;
