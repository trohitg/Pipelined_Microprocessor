library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity alu is
port(din1, din2 : in bit_vector(  15 downto 0 );
	alu_con : in bit ;
	dout : out bit_vector(  15 downto 0 );
	cout,zout : out bit);
end entity;
-----------------------------------------------------------
architecture behave of alu is
  component mux_2_1_16 is
   port(x,y : in bit_vector(15 downto 0);
 	 s : in bit;
        o : out bit_vector(15 downto 0));
end component;

  component sixteenbitnand is
	  port (x,y : in bit_vector(  15 downto 0 );
	  z : out  bit_vector  (  15 downto 0));

end component;


 component sixteenbitadder is
 port (x,y : in bit_vector(  15 downto 0 );
    	cin: in bit ; 
     z : out  bit_vector  (  15 downto 0);
     cout: out bit );
end component;

 signal r3,r4,r5: bit_vector(15 downto 0);

 signal i1,i2 : bit;
----------------------------------------------------------
begin
add : sixteenbitadder port map(x => din1,y => din2,cin => '0',z => r3, cout => cout );
nand1: sixteenbitnand port map(x => din1, y=> din2, z=> r4);
mux1: mux_2_1_16 port map(y => r3, x => r4, s => alu_con, o=> r5);
dout <= r5 ;
zout <= not(r5(0) or r5(1) or r5(2) or r5(3) or r5(4) or r5(5) or r5(6) or r5(7) or r5(8) or r5(9) or r5(10) or r5(11) or r5(12) or r5(13) or r5(14) or r5(15) );  
end behave;
