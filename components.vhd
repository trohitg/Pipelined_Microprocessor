package components is
  	constant bits: integer := 16;       -- size in bits of each inputs , change it if you want to change the size of each input
	type mux_array is array (natural range <>) of bit_vector (bits -1 downto 0);
--
-- data-register
--    (as discussed in class)
--  
-- to instantiated an 8-bit register use
--   di: dregister generic map (nbits => 8) 
--      port map (din => .., dout => .. , clk => .., enable => ..);
--
component dregister is
  generic (
    nbits : integer:= 16);                    -- no. of bits
  port (
    din  : in  bit_vector(nbits-1 downto 0);
    dout : out bit_vector(nbits-1 downto 0);
    enable: in bit;
    clr: in bit;
    clk: in  bit);
end component;

--
-- combinational unsigned addition
--  (2's complement numbers)
-- 
component unsigned_adder is
  generic ( nbits : integer);
  port ( A : in  bit_vector(nbits-1 downto 0);
    B : in  bit_vector(nbits-1 downto 0);
    result   : out bit_vector(nbits-1 downto 0));
end component;

component mux_gener is 
generic (inputs: integer:= 4; signals: integer := 2);   -- size in bits of the selector, the number of inputs will be 2**n, change this if you want more 

port (inpu : in mux_array (0 to (inputs) - 1);
         sel : in bit_vector (signals - 1 downto 0);
         outpu: out bit_vector (bits - 1 downto 0));
end component; 
--------------------------------------------------------------------------------

component data_memory is
generic (data_width: integer:= 16; addr_width: integer := 31);
   port(din: in bit_vector(data_width-1 downto 0);
        dout: out bit_vector(data_width-1 downto 0);
        clr: in bit;
        wr: in bit;
        mem_addr: in bit_vector(data_width-1 downto 0);
        clk: in bit);
end component;

component code_memory is
generic (data_width: integer:= 16; addr_width: integer := 31);
   port(dout: out bit_vector(data_width-1 downto 0);
        clr: in bit;
        mem_addr: in bit_vector(data_width-1 downto 0);
        clk: in bit);
end component;

end package;
