library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE224_Components.all;

entity controller is
  port(ir30: in bit_vector(3 downto 0);
    ir10: in bit_vector(1 downto 0);
    T1,T2: in bit_vector(15 downto 0); 
    zer,car,done,en,clr : in bit; 
    cs: out bit_vector(28 downto 0);
  clk: in bit ; sclr ,operation, en_z, en_c ,irf,zzfg : out bit;
  st: out bit_vector(4 downto 0));
end entity;
architecture LogicNetwork of controller is
  signal q,nq: bit_vector(4 downto 0);
  signal op: bit_vector(3 downto 0);
  signal typ: bit_vector(1 downto 0);

begin
  op <= ir30;
  typ <= ir10;
  process(op,typ,zer,car,done ,q,T1,T2)
  begin
  zzfg <= '0';
  irf <= '0';
  operation <= '0';
  sclr <= '0';
  en_z <= '0';
  en_c <= '0';
  cs <= "00001000000000000000000000000";

case q is
  
  when "00000" =>

    case op is
      when "0000" | "0010" =>
        if ( typ = "00") then
          nq <= "00010"; -- s2
        elsif (car = '1' and typ = "10") then
          nq <= "00010"; -- s2
        elsif(zer = '1' and typ = "01") then
          nq <= "00010"; -- s2
        else
          nq <= "00101"; -- s5
        end if;

      when "0001" =>
         nq <= "00010"; -- s2

      when "0011" =>
         nq <= "00101"; -- s5

      when "0100" | "0101" =>
         nq <= "01001"; -- s9

      when "0110" | "0111" =>
         nq <= "10010"; -- s18

      when "1100" =>
         nq <= "01100"; -- s12;

      when "1000" =>
         nq <= "10000"; -- s16;

      when "1001" =>
         nq <= "01110"; -- s14;

      when others =>
          nq <= "00000";
    end case;

    operation <= '0' ;
    
    irf <= '1';
    cs <= "00001000000000001010110000101"; -- s0

  when "00001" =>
      nq <= "00000"; -- s0
      cs <= "00101010000000000000100000000"; -- s1

  when "00010" =>
       if op  = "0001" then  -- ADI
        nq <= "00111"; -- s7
      else
        nq <= "00011"; -- s3
      end if;

      
      cs <= "00001000000000000000000011000"; -- s2

  when "00011" =>
      nq <= "00100"; -- s4
      en_z <= '1';
      if (op = "0000") then
       en_c <= '1' ;
      else 
        en_c <= '0';
      end if;
    if (op = "0010") then
       operation <= '1' ;
      else 
      operation <= '0' ;
      end if ;
      cs <= "00001000110110010000001000100"; -- s3

  when "00100" =>
      nq <= "00001"; -- s1
      cs <= "00001000011010000000001000000"; -- s4

  when "00101" =>
    if op  = "0011" then  -- LHI
      nq <= "10001"; -- s17
    else
      nq <= "00000"; -- s0
    end if;
    cs <= "00001000110110000000001000000"; -- s5

  when "00111" =>
    if op  = "0001" then  -- ADI
      nq <= "01000"; -- s8
      en_z <= '1';
      en_c <= '1';
    elsif op  = "0100" then  -- LW
      nq <= "01010"; -- s10
      en_z <= '1';
    else
      nq <= "01011"; -- s11
    end if;
    cs <= "00001000110110010100001000100"; -- s7

  when "01000" =>
    nq <= "00001"; -- s1
    cs <= "00001000001010000000001000000"; -- s8

  when "01001" =>
    nq <= "00111"; -- s7
    cs <= "00001101000000000000000011000"; -- s9

  when "01010" =>
    nq <= "00001"; -- s1
    cs <= "00011000000011000000001000001"; -- s10

  when "01011" =>
    nq <= "00000"; -- s0
    cs <= "00011000000000000000000000010"; -- s11

  when "01100" =>
    if T1  = T2 then
      nq <= "01101"; -- s13
    else
      nq <= "00101"; -- s5
    end if;
    cs <= "00001000000000000100000011100"; -- s12

  when "01101" =>
    nq <= "00000"; -- s0
    cs <= "01101000110010000000101000000"; -- s13

  when "01110" =>
    nq <= "00101"; -- s5
    cs <= "00101000000110000000101000000"; -- s14

  when "10000" =>
    nq <= "00101"; -- s5
    cs <= "10001000000110011100101000100"; -- s16

  when "10001" =>
    nq <= "00001"; -- s1
    cs <= "00001000000001000000001000000"; -- s17

  when "10010" =>
    if op  = "0110" then  -- LM
      nq <= "10011"; -- s19
    else
      nq <= "10100"; -- s20
    end if;
    zzfg <= '1';
    cs <= "00001000110110000000001110000"; -- s18

  when "10011" =>
    if done  = '1' then
      nq <= "00001"; -- s1
      sclr <= '1'; -- side Block Clear
    else
      nq <= "10011"; -- s19
    end if;
    cs <= "00000000010011111000001110001"; -- s19


  when "10100" =>
    if done  = '1' then
      nq <= "00001"; -- s1
      sclr <= '1'; -- side Block Clear 
    else
      nq <= "10100"; -- s20
    end if;
    cs <= "00000011000000111001000110010"; -- s20

  when others =>
      nq <= "00000";
      cs <= "00001000000000000000000000000";

  end case;

  end process;

  dd4: DF port map(d => nq(4), clk => clk ,en => en, clr => clr,q => q(4));
  dd3: DF port map(d => nq(3), clk => clk ,en => en, clr => clr,q => q(3));
  dd2: DF port map(d => nq(2), clk => clk ,en => en, clr => clr,q => q(2));
  dd1: DF port map(d => nq(1), clk => clk ,en => en, clr => clr,q => q(1));
  dd0: DF port map(d => nq(0), clk => clk ,en => en, clr => clr,q => q(0));
  
	st(4) <= q(4);
	st(3) <= q(3);
	st(2) <= q(2);
	st(1) <= q(1);
	st(0) <= q(0);
	
  -- the DFF's
  	
  
  

end LogicNetwork;

