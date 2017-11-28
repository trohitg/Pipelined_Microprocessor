
entity mux_4_1_16 is
   port(x0,x1,x2,x3 : in bit_vector(15 downto 0);
  s0,s1 : in bit;
        o : out bit_vector(15 downto 0));
end entity;

architecture sta of mux_4_1_16 is
   
begin
  o(0)  <= (x0(0) and (not s0) and (not s1)) or (x1(0) and (not s1) and s0) or (x2(0) and (not s0) and s1) or (x3(0) and s1 and s0);
  o(1)  <= (x0(1) and (not s0) and (not s1)) or (x1(1) and (not s1) and s0) or (x2(1) and (not s0) and s1) or (x3(1) and s1 and s0);
  o(2)  <= (x0(2) and (not s0) and (not s1)) or (x1(2) and (not s1) and s0) or (x2(2) and (not s0) and s1) or (x3(2) and s1 and s0);
  o(3)  <= (x0(3) and (not s0) and (not s1)) or (x1(3) and (not s1) and s0) or (x2(3) and (not s0) and s1) or (x3(3) and s1 and s0);
  o(4)  <= (x0(4) and (not s0) and (not s1)) or (x1(4) and (not s1) and s0) or (x2(4) and (not s0) and s1) or (x3(4) and s1 and s0);
  o(5)  <= (x0(5) and (not s0) and (not s1)) or (x1(5) and (not s1) and s0) or (x2(5) and (not s0) and s1) or (x3(5) and s1 and s0);
  o(6)  <= (x0(6) and (not s0) and (not s1)) or (x1(6) and (not s1) and s0) or (x2(6) and (not s0) and s1) or (x3(6) and s1 and s0);
  o(7)  <= (x0(7) and (not s0) and (not s1)) or (x1(7) and (not s1) and s0) or (x2(7) and (not s0) and s1) or (x3(7) and s1 and s0);
  o(8)  <= (x0(8) and (not s0) and (not s1)) or (x1(8) and (not s1) and s0) or (x2(8) and (not s0) and s1) or (x3(8) and s1 and s0);
  o(9)  <= (x0(9) and (not s0) and (not s1)) or (x1(9) and (not s1) and s0) or (x2(9) and (not s0) and s1) or (x3(9) and s1 and s0);
  o(10)  <= (x0(10) and (not s0) and (not s1)) or (x1(10) and (not s1) and s0) or (x2(10) and (not s0) and s1) or (x3(10) and s1 and s0);
  o(11)  <= (x0(11) and (not s0) and (not s1)) or (x1(11) and (not s1) and s0) or (x2(11) and (not s0) and s1) or (x3(11) and s1 and s0);
  o(12)  <= (x0(12) and (not s0) and (not s1)) or (x1(12) and (not s1) and s0) or (x2(12) and (not s0) and s1) or (x3(12) and s1 and s0);
  o(13)  <= (x0(13) and (not s0) and (not s1)) or (x1(13) and (not s1) and s0) or (x2(13) and (not s0) and s1) or (x3(13) and s1 and s0);
  o(14)  <= (x0(14) and (not s0) and (not s1)) or (x1(14) and (not s1) and s0) or (x2(14) and (not s0) and s1) or (x3(14) and s1 and s0);
  o(15)  <= (x0(15) and (not s0) and (not s1)) or (x1(15) and (not s1) and s0) or (x2(15) and (not s0) and s1) or (x3(15) and s1 and s0);

end sta ;
