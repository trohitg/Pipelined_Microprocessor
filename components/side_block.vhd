library work;
use work.EE224_Components.all;

entity side_block is
  port(din: in bit_vector(7 downto 0); clk , clr , en,zzfg : in bit; dout: out bit_vector(2 downto 0); zsig: out bit);
end entity;

architecture sta1 of side_block is

	component register_8  is
 	  port(din: in bit_vector(7 downto 0); clk ,en ,clr : in bit; dout: out bit_vector(7 downto 0));
	end component;
	
	component decoder is
	    port(din: in bit_vector(2 downto 0); dout: out bit_vector(7 downto 0));
	end component;

	component priority_encoder is
	   port (x :in bit_vector(7 downto 0); s :out bit_vector(2 downto 0));
	end component;

	component mux_2_1_8 is
	   port(x,y : in bit_vector(7 downto 0);
  s : in bit;
        o : out bit_vector(7 downto 0));
	end component;

   signal ss0 , ss1 ,ss2 , ss3 : bit_vector(7 downto 0);
	
   signal ss5 : bit_vector(2 downto 0);
	signal zs , zs1,zs2: bit;


begin
	
	zs1 <= not(ss1(7) or ss1(6) or ss1(5) or ss1(4) or ss1(3) or ss1(2) or ss1(1) or ss1(0));
	--zs2 <= zs or zs1;

	s0: decoder port map (din => ss5 , dout => ss0 );
	s1: register_8 port map (din => ss1, clk => clk ,en => en ,clr => clr, dout =>  ss2);

  	s2: priority_encoder port map (x => ss2, s => ss5);
	s3: mux_2_1_8 port map (x => din ,y => ss2 , s => zzfg,
        o => ss3);
	s4: DF port map (d => zs1, clk => clk ,en => en, clr => clr,q => zs);
	
  	ss1(0) <= (ss3(0) and not(ss0(0) and not(zzfg)));
  	ss1(1) <= ss3(1) and not(ss0(1));
  	ss1(2) <= ss3(2) and not(ss0(2));
  	ss1(3) <= ss3(3) and not(ss0(3));
  	ss1(4) <= ss3(4) and not(ss0(4));
  	ss1(5) <= ss3(5) and not(ss0(5));
  	ss1(6) <= ss3(6) and not(ss0(6));
  	ss1(7) <= ss3(7) and not(ss0(7));
  
  	dout <= ss5;
	zsig <= zs1;
  end sta1;
