library work;
use work.components.all;

entity register_file is
  port(a1 , a2 ,a3 : in bit_vector(2 downto 0); d3 : in bit_vector(15 downto 0); clk , clr , wr : in bit; d1, d2,r7,r6,r5,r4,r3,r2,r1,r0 : out bit_vector(15 downto 0));
end entity;

architecture sta1 of register_file is

	component mux_8_1_16 is
	port( d7,d6,d5,d4,d3,d2,d1,d0: in bit_vector(15 downto 0);
	s:	in bit_vector(2 downto 0);
	do:	out bit_vector(15 downto 0));
	end component;

	component decoder is
  port(din: in bit_vector(2 downto 0); dout: out bit_vector(7 downto 0));
	end component;

   signal z0,z1,z2,z3,z4,z5,z6,z7 : bit_vector(15 downto 0);
	signal x0,x1 : bit_vector(7 downto 0);

begin

	s00: decoder port map (din => a3 , dout => x0 );
	
  x1(0) <= x0(0) and wr;
  x1(1) <= x0(1) and wr;
  x1(2) <= x0(2) and wr;
  x1(3) <= x0(3) and wr;
  x1(4) <= x0(4) and wr;
  x1(5) <= x0(5) and wr;
  x1(6) <= x0(6) and wr;
  x1(7) <= x0(7) and wr;
  
d07: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => d3,
    dout => z7,
    enable => x1(7),
    clr => clr,
    clk => clk);

d06: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => d3,
    dout => z6,
    enable => x1(6),
    clr => clr,
    clk => clk);

d05: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => d3,
    dout => z5,
    enable => x1(5),
    clr => clr,
    clk => clk);

d04: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => d3,
    dout => z4,
    enable => x1(4),
    clr => clr,
    clk => clk);

d03: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => d3,
    dout => z3,
    enable => x1(3),
    clr => clr,
    clk => clk);

d02: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => d3,
    dout => z2,
    enable => x1(2),
    clr => clr,
    clk => clk);

d01: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => d3,
    dout => z1,
    enable => x1(1),
    clr => clr,
    clk => clk);

d00: dregister generic map (nbits => 16)                    -- no. of bits
  port map(
    din  => d3,
    dout => z0,
    enable => x1(0),
    clr => clr,
    clk => clk);

	r7 <= z7;
	r6 <= z6;
	r5 <= z5;
	r4 <= z4;
	r3 <= z3;
	r2 <= z2;
	r1 <= z1;
	r0 <= z0;


s12: mux_8_1_16 port map( d7 => z7,d6 => z6,d5 => z5,d4 => z4,d3 => z3,d2 => z2,d1 => z1,d0 => z0, s => a1, do => d1);
  	
s13: mux_8_1_16 port map( d7 => z7,d6 => z6,d5 => z5,d4 => z4,d3 => z3,d2 => z2,d1 => z1,d0 => z0, s => a2, do => d2);
	
  end sta1;
