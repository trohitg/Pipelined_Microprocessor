entity dregister is
  generic (
    nbits : integer := 16);                    -- no. of bits
  port (
    din  : in  bit_vector(nbits-1 downto 0);
    dout : out bit_vector(nbits-1 downto 0);
    enable: in bit;
    clr: in bit;
    clk     : in  bit);
end dregister;

architecture behave of dregister is

begin  -- behave
process(clk , clr)
begin 
  if( clr = '1') then
		dout <= (others => '0');

  elsif(clk'event and clk = '1' and clr = '0') then
    if enable = '1' then
      dout <= din;
    end if;

  end if;
end process;
end behave;