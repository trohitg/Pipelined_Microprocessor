entity mux_8_1_16 is
port( d7,d6,d5,d4,d3,d2,d1,d0: in bit_vector(15 downto 0);
	s:	in bit_vector(2 downto 0);
	do:	out bit_vector(15 downto 0));
end entity;

architecture behv of mux_8_1_16 is

begin
    
    process(d7,d6,d5,d4,d3,d2,d1,d0,s)
    begin
      case s is
	when "000" => do <= d0;
    when "001" => do <= d1;
	when "010" => do <= d2; 
	when "011" => do <= d3;
	when "100" => do <= d4;
    when "101" => do <= d5;
	when "110" => do <= d6; 
	when "111" => do <= d7;
	when others =>  
      end case;
    end process;

end behv;