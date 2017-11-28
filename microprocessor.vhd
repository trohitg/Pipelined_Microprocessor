library ieee;
use ieee.std_logic_1164.all;
library work;
use work.components.all;

entity microprocessor is
    port (clk_in , clk, clr : in bit;
    r7,r6,r5,r4,r3,r2,r1,r0 : out  bit_vector  (15 downto 0));
end entity;

 ------------------------------------ data_out is the output of the mem and data_in is the input of mem and out of this datapath
architecture final of microprocessor is

-------------------------------------------------------
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
port(din: in bit_vector(7 downto 0); clk , clr , en : in bit; dout: out bit_vector(2 downto 0); 
    zsig: out bit);
end component;

component sixteenbitadder is
port (x,y : in bit_vector( 15 downto 0 );
    cin: in bit ; 
    z : out  bit_vector  ( 15 downto 0);
    cout: out bit );
end component;

component pipeline_decoder_register is
    port (clk ,en , clr : in bit;
    pc_1_i , pc_i , ir_i : in  bit_vector  (15 downto 0);
    pc_1_o , pc_o , ir_o : out  bit_vector  (15 downto 0));
end component;

component pipeline_file_register is
    port (clk ,en , clr : in bit;
    pc_1_i , pc_i ,se_6_i ,se_6_9_i ,rese_9_i: in  bit_vector  (15 downto 0);
    pc_1_o , pc_o ,se_6_o ,se_6_9_o ,rese_9_o: out  bit_vector  (15 downto 0);
    ir_7_0_i: in bit_vector(7 downto 0);
    ir_7_0_o: out bit_vector(7 downto 0);
    cs_i: in bit_vector(7 downto 0);
    cs_o: out bit_vector(7 downto 0);
    A1_i , A2_i: in bit_vector(2 downto 0);
    A1_o , A2_o: out bit_vector(2 downto 0)
    );
end component;

component pipeline_execution_register is
	port (clk ,en , clr : in bit;
    pc_1_i ,rese_9_i , ALU_1_i , ALU_2_i , D2_i: in  bit_vector  (15 downto 0);
    pc_1_o ,rese_9_o , ALU_1_o , ALU_2_o , D2_o: out  bit_vector  (15 downto 0);
    cs_i: in bit_vector(7 downto 0);
    cs_o: out bit_vector(7 downto 0));
end component;

component pipeline_memory_register is
    port (clk ,en , clr : in bit;
    pc_1_i ,rese_9_i , T3_i , D2_i: in  bit_vector  (15 downto 0);
    pc_1_o ,rese_9_o , T3_o , D2_o: out  bit_vector  (15 downto 0);
    cs_i: in bit_vector(7 downto 0);
    cs_o: out bit_vector(7 downto 0));
end component;

component pipeline_writeback_register is
 	port (clk ,en , clr : in bit;
    pc_1_i ,rese_9_i , T3_i , Data_mem_i: in  bit_vector  (15 downto 0);
    pc_1_o ,rese_9_o , T3_o , Data_mem_o: out  bit_vector  (15 downto 0);
    cs_i: in bit_vector(7 downto 0);
    cs_o: out bit_vector(7 downto 0));
end component;

	signal input1: bit_vector (15 downto 0);
    signal rf_a1,pri_out,tem3,rf_a2,rf_a3,tem6,tem7,tem8,tem9 : bit_vector(2 downto 0);
    signal clr1,cout,zout,zin,cin ,zsig,operation,en_z,en_c,nclr : bit;
    signal te001,te0,rev_se9,mem_d,rf_d3,se6_out,se9_out,rf_d1,rf_d2,t1_in,t1_out,alu_out,
    pc_out,pc_in,t3_out,alu_in1,alu_in2,t2_out,t3_in : bit_vector(15 downto 0);
    signal r: bit_vector(28 downto 0);

begin

--------------------------------------------------------------------------------
	--	Fetch Section.

mux_fetch_1: mux_gener generic map (inputs => 4, signals => 2)
	port map(inpu(0) => ,
	inpu(1) => ,
	inpu(2) => ,
	inpu(3) => ,
	outpu => , 
	sel => );

pc: dregister generic map (nbits => 16)                    -- no. of bits
    port map(din  => ,
    dout => ,
    enable => ,
    clr => ,
    clk => );

memory_code: code_memory generic map (data_width => , addr_width => )
	port map(din => ,
    dout => ,
    clr => ,
    mem_addr => ,
    clk => );

fetch_adder: sixteenbitadder 
	port map(x => ,
	y => ,
    cin => , 
    z => ,
    cout => );

----------------------------------------------------------------------------
	-- Decode Section.

pipeline_reg_decode: pipeline_decoder_register
    port (clk => clk, en => , clr => ,
    pc_1_i => , 
    pc_i => , 
    ir_i => ,
    pc_1_o => , 
    pc_o => , 
    ir_o => );

mux_decode_1: mux_2_1_3 
	port map(x => ,
	y => ,
	s => ,
	o => );

mux_decode_2: mux_2_1_3 
	port map(x => ,
	y => ,
	s => ,
	o => ); 

mux_decode_3: mux_gener  generic map (inputs => 2, signals => 1)
	port map ( inpu(0) => , 
	inpu(1) => , 
	s => , 
	outpu => );

se6_1 : se6 
	port map (input_6 => ,
	output_16 => ); -------- se6_out = se6_out

se9_1 : se9 
	port map(input_9 => ,
	output_16 => ); ---------se9_out = se9_out

revse9_1 : rse9 
	port map (rinput_9 => , 
	output_16 => ) ; --------rev_se9 = revse9

--------------------------------------------------------------------------------
	--	Register File Section.

pipeline_reg_rf: pipeline_file_register
    port (clk => clk, en => , clr => ,
    pc_1_i => , 
    pc_i => ,
    se_6_i => ,
    se_6_9_i => ,
    rese_9_i => ,
    pc_1_o => , 
    pc_o => ,
    se_6_o => ,
    se_6_9_o => ,
    rese_9_o => ,
    ir_7_0_i => ,
    ir_7_0_o => ,
    cs_i => ,
    cs_o => ,
    A1_i => , 
    A2_i => ,
    A1_o => , 
    A2_o => 
    );

rf_adder: sixteenbitadder 
	port map(x => ,
	y => ,
    cin => , 
    z => ,
    cout => );

mux_rf_1: mux_2_1_3 
	port map(x => ,
	y => ,
	s => ,
	o => ); 

mux_rf_2: mux_gener generic map (inputs => 3, signals => 2)
	port map(inpu(0) => ,
	inpu(1) => ,
	inpu(2) => ,
	outpu => , 
	sel => );

mux_rf_3: mux_gener generic map (inputs => 4, signals => 2)
	port map(inpu(0) => ,
	inpu(1) => ,
	inpu(2) => ,
	inpu(3) => ,
	outpu => , 
	sel => );

mux_rf_4: mux_gener generic map (inputs => 4, signals => 2)
	port map(inpu(0) => ,
	inpu(1) => ,
	inpu(2) => ,
	inpu(3) => ,
	outpu => , 
	sel => );

rf_reg : register_file 
	port map (a1 => rf_a1,
		a2 => rf_a2,
		a3 => rf_a3, 
		d3 =>rf_d3,
		clk => clk,
		clr => clr ,
		wr => r(6) ,
		d1 => rf_d1, 
		d2 => rf_d2 ,
		r7 => r7,
		r6 => r6 ,
		r5 => r5 ,
		r4 => r4 ,
		r3 => r3,
		r2 => r2,
		r1 => r1,
		r0 => r0 );

pri: side_block 
	port map (din => ,
	clk => , 
	clr => ,
	en => , 
	dout =>  , 
	zsig => );

mux_rf_side_block: mux_2_1_3 
	port map(x => ,
	y => ,
	s => ,
	o => ); 

--------------------------------------------------------------------------------
	--	Execution

pipeline_reg_execution: pipeline_execution_register
    port (clk => clk, en => , clr => ,
    pc_1_i => ,
    rese_9_i => , 
    ALU_1_i => , 
    ALU_2_i => , 
    D2_i => ,
    pc_1_o => ,
    rese_9_o => , 
    ALU_1_o => , 
    ALU_2_o => , 
    D2_o => ,
    cs_i => ,
    cs_o => 
    );


mux_execution_1: mux_gener  generic map (inputs => 2, signals => 1)
	port map ( inpu(0) => , 
	inpu(1) => , 
	s => , 
	outpu => );

alu_execution: alu 
	port map (din1 => alu_in1, 
	din2 => alu_in2, 
	dout => alu_out, 
	alu_con => operation, 
	cout => cin , 
	zout => zin);

zflag: dregister generic map (nbits => 16) 
	port map (din => zin, 
	clk => clk ,
	enable => en_z, 
	clr => clr,
	dout => zout);

cflag: dregister generic map (nbits => 16) 
	port map (din => cin, 
	clk => clk ,
	enable => en_c, 
	clr => clr,
	dout => cout);

--------------------------------------------------------------------------------
	--	Memory Section.

pipeline_reg_memory: pipeline_memory_register
	port (clk => clk, en => , clr => ,
    pc_1_i => ,
    rese_9_i => , 
    T3_i => , 
    D2_i => ,
    pc_1_o => ,
    rese_9_o => ,
    T3_o => , 
    D2_o => ,
    cs_i => ,
    cs_o =>
    );

memory_data: data_memory generic map (data_width => , addr_width => )
	port map(din => ,
    dout => ,
    clr => ,
    wr => ,
    mem_addr => ,
    clk => );

mux_memory_2: mux_gener  generic map (inputs => 2, signals => 1)
	port map ( inpu(0) => , 
	inpu(1) => , 
	s => , 
	outpu => );


--------------------------------------------------------------------------------
	--  Writeback Section.
pipeline_reg_write_back: pipeline_writeback_register 
port (clk => clk, en => , clr => ,
    pc_1_i => ,
    rese_9_i => ,
    T3_i => , 
    Data_mem_i => ,
    pc_1_o => ,
    rese_9_o => ,
    T3_o => , 
    Data_mem_o => ,
    cs_i => ,
    cs_o => 
    );

mux_writeback_1: mux_gener generic map (inputs => 4, signals => 2)
	port map(inpu(0) => ,
	inpu(1) => ,
	inpu(2) => ,
	inpu(3) => ,
	outpu => , 
	sel => );

end final;