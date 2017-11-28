
entity mux_8_1_3 is
   port(x0,x1,x2,x3,x4,x5,x6,x7 : in bit_vector(2 downto 0);
  s0,s1,s2 : in bit;
        o : out bit_vector(2 downto 0));
end entity;

architecture sta of mux_8_1_3 is
   signal ns0,ns1,ns2: bit ;
begin
   ns0 <= not s0 ;
   ns1 <= not s1 ;
   ns2 <= not s2 ;
   

  o(0)  <= (x0(0) and ns2 and ns1 and ns0) or (x1(0) and ns2 and ns1 and s0) or (x2(0) and ns2 and s1 and ns0) or (x3(0) and ns2 and s1 and s0) or (x4(0) and s2 and ns1 and ns0) or (x5(0) and s2 and ns1 and s0) or (x6(0) and s2 and s1 and ns0) or (x7(0) and s2 and s1 and s0);
  o(1)  <= (x0(1) and ns2 and ns1 and ns0) or (x1(1) and ns2 and ns1 and s0) or (x2(1) and ns2 and s1 and ns0) or (x3(1) and ns2 and s1 and s0) or (x4(1) and s2 and ns1 and ns0) or (x5(1) and s2 and ns1 and s0) or (x6(1) and s2 and s1 and ns0) or (x7(1) and s2 and s1 and s0);
  o(2)  <= (x0(2) and ns2 and ns1 and ns0) or (x1(2) and ns2 and ns1 and s0) or (x2(2) and ns2 and s1 and ns0) or (x3(2) and ns2 and s1 and s0) or (x4(2) and s2 and ns1 and ns0) or (x5(2) and s2 and ns1 and s0) or (x6(2) and s2 and s1 and ns0) or (x7(2) and s2 and s1 and s0);
  
end sta ;
