library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE224_Components.all;

entity test is
    port (clk_in,cl ,reset : in bit;
    r7,r6,r5,r4,r3,r2,r1 : out  bit_vector  (  15 downto 0);
	 en, res: out bit;
	 st: out bit_vector(4 downto 0));
end entity;

 ------------------------------------ data_out is the output of the mem and data_in is the input of mem and out of this datapath
architecture final of test is
-------------------------------------------------------
component memory is
  port(
    data_out      : out bit_vector(15 downto 0);
    data_in       : in  bit_vector(15 downto 0);
    writeEnable : in  bit;
    mem_addr     : in  bit_vector(15 downto 0);
    clr :in bit;
    clk         : in  bit
    );
end component;

component mux_4_1_16 is
   port(x0,x1,x2,x3 : in bit_vector(15 downto 0);
  s0,s1 : in bit;
        o : out bit_vector(15 downto 0));
end component;

component controller is
  port(ir30: in bit_vector(3 downto 0);
    ir10: in bit_vector(1 downto 0);
    T1,T2: in bit_vector(15 downto 0); 
    zer,car,done,en,clr : in bit; 
    cs: out bit_vector(28 downto 0);
  clk: in bit ; sclr ,operation, en_z, en_c, irf,zzfg : out bit;
  st: out bit_vector(4 downto 0));
end component;

component mux_2_1_16 is
   port(x,y : in bit_vector(15 downto 0);
  s : in bit;
        o : out bit_vector(15 downto 0));
end component;


component mux_2_1_6 is
   port(x,y : in bit_vector(5 downto 0);
  s : in bit;
        o : out bit_vector(5 downto 0));
end component;

component priority_encoder is
  port (x :in bit_vector(7 downto 0); s :out bit_vector(2 downto 0));
end component ;

component register_file is
  port(a1 , a2 ,a3 : in bit_vector(2 downto 0); d3 : in bit_vector(15 downto 0); clk , clr , wr : in bit; d1, d2,r7,r6,r5,r4,r3,r2,r1,r0 : out bit_vector(15 downto 0));
end component;

component alu is
port(din1, din2 : in bit_vector(  15 downto 0 );
  alu_con : in bit ;
  dout : out bit_vector(  15 downto 0 );
  cout,zout : out bit);
end component;

component register_16 is
  port(din: in bit_vector(15 downto 0); clk ,en ,clr : in bit; dout: out bit_vector(15 downto 0));
end component;

component mux_2_1_3 is
   port(x,y : in bit_vector(2 downto 0);
  s : in bit;
        o : out bit_vector(2 downto 0));
end component;

component mux_4_1_3 is
   port(x0,x1,x2,x3 : in bit_vector(2 downto 0);
  s0,s1 : in bit;
        o : out bit_vector(2 downto 0));
end component;

component mux_8_1_16 is
  port( d7,d6,d5,d4,d3,d2,d1,d0: in bit_vector(15 downto 0);
  s:  in bit_vector(2 downto 0);
  do: out bit_vector(15 downto 0));
end component;

component mux_8_1_3 is
   port(x0,x1,x2,x3,x4,x5,x6,x7 : in bit_vector(2 downto 0);
  s0,s1,s2 : in bit;
        o : out bit_vector(2 downto 0));
end component;


component rse9 is
port( rinput_9: in bit_vector(8 downto 0);
   output_16: out bit_vector(15 downto 0));
end component;

component se6 is
port (input_6: in bit_vector(5 downto 0);
  output_16: out bit_vector(15 downto 0));
end component;

component se9 is
port (input_9: in bit_vector(8 downto 0);
  output_16: out bit_vector(15 downto 0));
end component;

component side_block is
  port(din: in bit_vector(7 downto 0); clk , clr , en ,zzfg: in bit; dout: out bit_vector(2 downto 0); 
    zsig: out bit);
end component;

------------------------------------------------------------------
    signal input1: bit_vector (15 downto 0);
    signal rf_a1,pri_out,tem3,rf_a2,rf_a3,tem6,tem7,tem8,tem9 : bit_vector(2 downto 0);
    signal clr1,cout,zout,zin,cin ,zsig,operation,en_z,en_c,nclr,irf,zzfg,clr,clk,bclk : bit;
    signal input2 : bit_vector(5 downto 0);
   signal te001,te0,rev_se9,mem_d,rf_d3,se6_out,se9_out,rf_d1,rf_d2,t1_in,t1_out,alu_out,
   pc_out,pc_in,t3_out,alu_in1,alu_in2,t2_out,t3_in,data_out,data_in,mem_addr,r0 : bit_vector(15 downto 0);
    signal r: bit_vector(28 downto 0);


--------------
begin
tem3(0) <= '1';
tem3(1) <= '1';
tem3(2) <= '1';

res <= reset;
en <= clk_in;
clr <= not reset;
nclr <= reset;
clk <= not(clk_in);

te0 <= "0000000000000000" ;
te001 <= "0000000000000001";

ir : register_16 port map(din => data_out,clk => clk, en => r(7), clr => clr ,dout => input1) ; -------com
irf_mux : mux_2_1_6 port map (x(5 downto 2) => data_out(15 downto 12), x(1 downto 0) => data_out(1 downto 0), y(5 downto 2) =>  input1(15 downto 12), y(1 downto 0) => input1(1 downto 0), s=> irf , o => input2 );

mux_a1: mux_2_1_3 port map(x => input1(8 downto 6),y => input1(11 downto 9) ,s => r(23) ,o=>rf_a1 ); -----------com rf_a1 = input a1 

mux_a2: mux_4_1_3 port map(x0 => input1(8 downto 6),x1 => input1(11 downto 9),x2 => tem3,x3 => pri_out, s0=>r(21),s1=> r(22), o =>rf_a2 ); ---------------pri = pri_out  ... rf_a2 = a2

mux_a3: mux_8_1_3 port map(x1 => input1(8 downto 6),x0 => input1(11 downto 9), x2 => pri_out, x3 => input1(5 downto 3), x4=> tem3, x5=> tem3,x6 => tem3,x7=> tem3,s0 => r(18),s1=> r(19),s2 => r(20), o => rf_a3 ); ----------- rf_a3 = a3


controll: controller port map(st => st, ir30 => input2(5 downto 2),ir10 => input2(1 downto 0),zzfg => zzfg, T1 => t1_out, T2 => t2_out, zer => zout,car => cout,done => zsig,irf => irf,en => nclr,clr => clr, cs => r, clk => clk ,sclr =>clr1, operation => operation,en_z =>en_z, en_c => en_c);
--------------------------------------------------
mux_d3: mux_8_1_16 port map(d0 =>rf_d2,d1=> rev_se9, d2 => t3_out, d3=> data_out, d6 => pc_out, d5 => te0,d4=> te0, d7=> te0, s(0)=>r(15), s(1)=>r(16), s(2) => r(17), do=> rf_d3  ) ; ---------rf_d2 = rf_d2,rev_se9 = rev se9,mem_d = mem_d,t3_out =t3,pc_out=pc,rf_d3 = rf_d3

se6_1 : se6 port map (input_6 => input1(5 downto 0), output_16 => se6_out); -------- se6_out = se6_out

se9_1 : se9 port map(input_9 => input1(8 downto 0), output_16 => se9_out); ---------se9_out = se9_out

revse9_1 : rse9 port map (rinput_9 => input1(8 downto 0), output_16 => rev_se9) ; --------rev_se9 = revse9

rf_reg : register_file port map (a1 => rf_a1,a2=> rf_a2,a3=> rf_a3, d3=>rf_d3,clk => clk,clr => clr ,wr => r(6) ,
d1 => rf_d1, d2 => rf_d2 ,r7 => r7,r6 => r6 ,r5 => r5 ,r4 => r4 ,r3 => r3,r2 => r2,r1 => r1,r0 => r0 ); -----------com rf_d1 = d1,rf_d2 = d2 

-----------------------------------------------
mux_t1 : mux_2_1_16 port map ( x => alu_out, y => rf_d1, s => r(14) , o => t1_in); --------- t1_in mux_ 1_out

mux_alu1: mux_4_1_16 port map (x0 => pc_out,x1 => t1_out,x2 => te0, x3 => t3_out, s0 => r(13),s1 => r(28),o => alu_in1 );

t1 : register_16 port map (din => t1_in,clk => clk , en => r(4),clr => clr , dout => t1_out); --------com t1_out t1_out

t2 : register_16 port map (din => rf_d2, clk => clk , en => r(3), clr => clr , dout => t2_out); ------- com

mux_alu2: mux_4_1_16 port map(x0 => t2_out, x1 => se6_out, x2 => te001, x3 => se9_out, s0 => r(11),s1 => r(12),o => alu_in2 ); 


alu1 :  alu port map (din1 => alu_in1, din2 => alu_in2, dout => alu_out, alu_con => operation, cout => cin , zout => zin); ----------------com

mux_t3 : mux_2_1_16 port map (y=> alu_out,x => pc_out,s => r(10),o => t3_in );

t3: register_16 port map (din => t3_in,clk => clk, en => r(2),clr => clr ,dout => t3_out ); ---------------com

-------------------------------------------------------------------------------------------------- 
mux_pc : mux_4_1_16 port map(x0 => alu_out,x1 => rf_d2, x3 => t3_out,x2 => te0 , s0 => r(26),s1 => r(27), o => pc_in );

pc: register_16 port map(din => pc_in, clk => clk , en => r(8), clr => clr , dout=> pc_out); -----------com

mux_mem : mux_4_1_16 port map(x0 =>t1_out, x1 => pc_out, x3 => t3_out, x2 => te0 , s0 => r(24),s1 => r(25), o=>mem_addr );

syn_mem: memory port map(data_out => data_out, data_in => data_in, writeEnable => r(1) ,mem_addr => mem_addr ,clr => clr , clk => clk); --------------------------------incom

mux_mem_data_in : mux_2_1_16 port map (y => t2_out, x=> rf_d2, s => r(9), o => data_in);
--------------------------------------------------------------------------------------------------------
pri: side_block port map (din => input1(7 downto 0), clk => clk, clr => clr1 ,en => r(5), dout => pri_out , zsig => zsig,zzfg => zzfg); -------------com

zflag : DF port map (d => zin, clk => clk ,en => en_z, clr => clr,q => zout);

-- double_clk : DF port map (d => bclk, clk => clk_in ,en => '1', clr => '0',q => clk);

-- bclk <= not(clk);

cflag : DF port map (d => cin, clk => clk ,en => en_c, clr => clr,q => cout);
--------------

end final;
