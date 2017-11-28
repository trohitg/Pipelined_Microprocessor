library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity sixteenbitadder is
    port (x,y : in bit_vector(  15 downto 0 );
    	cin: in bit ; 
     z : out  bit_vector  (  15 downto 0);
     cout: out bit );
end entity;

architecture behave of sixteenbitadder is
    signal r : bit_vector(16 downto 0);

    component onebitadd is
        port(X,Y,C: in bit; 
	d,s: out bit);
    end component;
--------------
begin
a: onebitadd port map(X => x(0), Y => y(0), C => cin, d => r(0), s => z(0) );
b: onebitadd port map(X => x(1), Y => y(1), C => r(0), d => r(1), s => z(1) );
e: onebitadd port map(X => x(2), Y => y(2), C => r(1), d => r(2), s => z(2) );
f: onebitadd port map(X => x(3), Y => y(3), C => r(2), d => r(3), s => z(3) );
g: onebitadd port map(X => x(4), Y => y(4), C => r(3), d => r(4), s => z(4) );
h: onebitadd port map(X => x(5), Y => y(5), C => r(4), d => r(5), s => z(5) );
i: onebitadd port map(X => x(6), Y => y(6), C => r(5), d => r(6), s => z(6) );
j: onebitadd port map(X => x(7), Y => y(7), C => r(6), d => r(7), s => z(7) );
j1: onebitadd port map(X => x(8), Y => y(8), C => r(7), d => r(8), s => z(8) );
j2: onebitadd port map(X => x(9), Y => y(9), C => r(8), d => r(9), s => z(9) );
j3: onebitadd port map(X => x(10), Y => y(10), C => r(9), d => r(10), s => z(10) );
j4: onebitadd port map(X => x(11), Y => y(11), C => r(10), d => r(11), s => z(11) );
j5: onebitadd port map(X => x(12), Y => y(12), C => r(11), d => r(12), s => z(12) );
j6: onebitadd port map(X => x(13), Y => y(13), C => r(12), d => r(13), s => z(13) );
j7: onebitadd port map(X => x(14), Y => y(14), C => r(13), d => r(14), s => z(14) );
j8: onebitadd port map(X => x(15), Y => y(15), C => r(14), d => r(15), s => z(15) );

cout <= r(15);
--------------

end behave;
