library work;
use work.EE224_Components.all;

entity demux_1_8_16 is
  port(di: in bit_vector(15 downto 0); s: in bit_vector(2 downto 0); d0 , d1 ,d2 , d3 ,d4 ,d5 ,d6 ,d7: out bit_vector(15 downto 0));
end entity;

architecture sta of demux_1_8_16 is

	component allower is
  port(di: in bit_vector(15 downto 0); s2,s1,s0: in bit; do: out bit_vector(15 downto 0));
	end component;
	
   signal sb : bit_vector(2 downto 0);

begin
	
	sb(0) <= not(s(0));
	sb(1) <= not(s(1));
	sb(2) <= not(s(2));
  	
  	da7: allower port map (di => di, s2 => s(2),s1 => s(1),s0 => s(0), do => d7);

  	da6: allower port map (di => di, s2 => s(2),s1 => s(1),s0 => sb(0), do => d6);

  	da5: allower port map (di => di, s2 => s(2),s1 => sb(1),s0 => s(0), do => d5);

  	da4: allower port map (di => di, s2 => s(2),s1 => sb(1),s0 => sb(0), do => d4);

	da3: allower port map (di => di, s2 => sb(2),s1 => s(1),s0 => s(0), do => d3);

  	da2: allower port map (di => di, s2 => sb(2),s1 => s(1),s0 => sb(0), do => d2);

	da1: allower port map (di => di, s2 => sb(2),s1 => sb(1),s0 => s(0), do => d1);

  	da0: allower port map (di => di, s2 => sb(2),s1 => sb(1),s0 => sb(0), do => d0);

end sta;
