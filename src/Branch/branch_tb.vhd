library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_arith.all;

entity branch_tb is


end branch_tb;

architecture branch_tb_arch of branch_tb is

	signal	tb_clock			:	std_logic := '0';
	signal	tb_reset			:	std_logic := '0';
	signal	tb_op_sys			:	std_logic := '0';
	signal	tb_op_ret			:	std_logic := '0';
	signal	tb_op_jp			:	std_logic := '0';
	signal	tb_op_call			:	std_logic := '0';
	signal	tb_op_sei			:	std_logic := '0';
	signal	tb_op_ser			:	std_logic := '0';
	signal	tb_op_snei			:	std_logic := '0';
	signal	tb_op_sner			:	std_logic := '0';

	signal	tb_vx_in			:	std_logic_vector(7 downto 0) 	:= x"A5";
	signal	tb_vy_in			:	std_logic_vector(7 downto 0) 	:= x"32";
	signal	tb_kk_in			:	std_logic_vector(7 downto 0) 	:= x"45";
	signal	tb_nnn_in			:	std_logic_vector(11 downto 0)	:= x"EEE";
	signal	tb_stack_data_in	:	std_logic_vector(11 downto 0)	:= x"078";

	signal	tb_pc_out			:	std_logic_vector(11 downto 0)	:= (others => '0');
	signal	tb_stack_addr		:	std_logic_vector(7 downto 0)	:= (others => '0');
	signal	tb_stack_data_out	:	std_logic_vector(11 downto 0)	:= (others => '0');
	signal	tb_stack_data_w		:	std_logic := '0';

	type	STACK_TYPE	is array (0 to 255) of std_logic_vector(11 downto 0);
	signal	stack	: STACK_TYPE;

begin


	tb_clock <= not tb_clock after 5 ns;

	tb_reset <= '1', '0' after 123 ns;

	process(tb_clock)
	begin
		if tb_clock'event and tb_clock = '1' then
			if tb_stack_data_w = '1' then
				stack(conv_integer(tb_stack_addr)) <= tb_stack_data_out;
			end if;
		end if;
	end process;


	branch: entity work.branch
	port map
	(
		clock			=> tb_clock,
		reset			=> tb_reset,			
		op_sys			=> tb_op_sys,			
		op_ret			=> tb_op_ret,			
		op_jp			=> tb_op_jp,			
		op_call			=> tb_op_call,			
		op_sei			=> tb_op_sei,						
		op_ser			=> tb_op_ser,			
		op_snei			=> tb_op_snei,			
		op_sner			=> tb_op_sner,			

		vx_in			=> tb_vx_in,		
		vy_in			=> tb_vy_in,			
		kk_in			=> tb_kk_in,			
		nnn_in			=> tb_nnn_in,			
		stack_data_in	=> tb_stack_data_in,	
		pc_out			=> tb_pc_out,			
		stack_addr		=> tb_stack_addr,		
		stack_data_out	=> tb_stack_data_out,	
		stack_data_w	=> tb_stack_data_w
	
	);


	process
	begin

		tb_op_sys	<= '0';
		tb_op_ret	<= '0';
		tb_op_jp	<= '0';
		tb_op_call	<= '0';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 200 ns;


		tb_op_sys	<= '0';
		tb_op_ret	<= '0';
		tb_op_jp	<= '1';
		tb_op_call	<= '0';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 10 ns;


		tb_op_sys	<= '0';
		tb_op_ret	<= '0';
		tb_op_jp	<= '0';
		tb_op_call	<= '0';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 200 ns;


		
		tb_nnn_in	<= x"431";
		tb_op_sys	<= '0';
		tb_op_ret	<= '0';
		tb_op_jp	<= '0';
		tb_op_call	<= '0';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 200 ns;


		tb_op_sys	<= '0';
		tb_op_ret	<= '0';
		tb_op_jp	<= '0';
		tb_op_call	<= '1';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 10 ns;


		tb_op_sys	<= '0';
		tb_op_ret	<= '0';
		tb_op_jp	<= '0';
		tb_op_call	<= '0';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 200 ns;

		tb_nnn_in	<= x"534";
		tb_op_sys	<= '0';
		tb_op_ret	<= '0';
		tb_op_jp	<= '0';
		tb_op_call	<= '0';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 200 ns;


		tb_op_sys	<= '0';
		tb_op_ret	<= '0';
		tb_op_jp	<= '0';
		tb_op_call	<= '1';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 10 ns;


		tb_op_sys	<= '0';
		tb_op_ret	<= '0';
		tb_op_jp	<= '0';
		tb_op_call	<= '0';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 200 ns;




		tb_nnn_in	<= x"352";
		tb_op_sys	<= '0';
		tb_op_ret	<= '0';
		tb_op_jp	<= '0';
		tb_op_call	<= '0';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 200 ns;


		tb_op_sys	<= '0';
		tb_op_ret	<= '1';
		tb_op_jp	<= '0';
		tb_op_call	<= '0';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 10 ns;


		tb_op_sys	<= '0';
		tb_op_ret	<= '0';
		tb_op_jp	<= '0';
		tb_op_call	<= '0';
		tb_op_sei	<= '0';
		tb_op_ser	<= '0';
		tb_op_snei	<= '0';
		tb_op_sner	<= '0';
		wait for 200 ns;

		
		wait;

	end process;




end branch_tb_arch;

