library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_arith.all;

entity branch is
port
(
	clock	:	in	std_logic;
	reset	:	in	std_logic;

	op_sys	:	in	std_logic;		-- 0nnn - SYS addr.	 
	op_ret	:	in	std_logic;		-- 00EE - RET
	op_jp	:	in	std_logic;		-- 1nnn - JP addr
	op_call	:	in	std_logic;		-- 2nnn - CALL addr
	op_sei	:	in	std_logic;		-- 3xkk - SE Vx, byte
	op_ser	:	in	std_logic;		-- 5xy0 - SE Vx, Vy
	op_snei	:	in	std_logic;		-- 4xkk - SNE Vx, byte
	op_sner	:	in	std_logic;		-- 9xy0 - SNE Vx, Vy


	vx_in	:	in	std_logic_vector(7 downto 0);
	vy_in	:	in	std_logic_vector(7 downto 0);
	kk_in	:	in	std_logic_vector(7 downto 0);
	nnn_in	:	in	std_logic_vector(11 downto 0);

	stack_data_in	:	in	std_logic_vector(11 downto 0);

	pc_out			:	out	std_logic_vector(11 downto 0);
	stack_addr		:	out	std_logic_vector(7 downto 0);
	stack_data_out	:	out	std_logic_vector(11 downto 0);
	stack_data_w	:	out	std_logic

);

end branch;

architecture branch_arch of branch is

	signal pc	:	std_logic_vector(11 downto 0) 	:= x"000";
	signal sp	:	std_logic_vector(7 downto 0) 	:= x"00";

	signal estado		:	integer	:= 0;	
	signal estado_ret	:	integer	:= 0;	

begin


	process(clock, reset)

	begin
		if reset = '1' then
			pc 				<= x"000";
			sp 				<= x"00";
			stack_data_w	<= '0';
			stack_addr		<= x"00";
			stack_data_out 	<= x"000";
			estado			<= 0;
			estado_ret		<= 0;

		else
			if clock'event and clock = '1' then

				-- FSM do CALL.
				if estado > 0 then
					estado <= estado - 1;
				else
					estado <= 0;
				end if;

				case estado is
					when 1 =>
						stack_data_w <= '0';
						pc <= nnn_in;
					when 2 =>
						stack_data_w 	<= '1';
						stack_addr		<= sp;

					when others =>
						stack_data_w <= '0';
				end case;

				-- fsm do RET.
				if estado_ret > 0 then
					estado_ret <= estado_ret - 1;
				else
					estado_ret <= 0;
				end if;


				case estado_ret is
					when 1 =>
						pc	<= stack_data_in;
						
					when 2 =>
						stack_addr		<= sp;

					when others =>

				end case;



				if op_sys = '1' then		-- 0nnn - SYS addr.	 
					pc <= nnn_in;


				elsif op_ret = '1' then		-- 00EE - RET
					estado_ret	<= 2;
					sp	<= sp - 1;



				elsif op_jp	= '1' then		-- 1nnn - JP addr
					pc <= nnn_in;


				elsif op_call = '1' then	-- 2nnn - CALL addr
					estado 			<= 2;
					sp 				<= sp + 1;
					stack_data_out 	<= pc;


				elsif op_sei = '1' then		-- 3xkk - SE Vx, byte
					if Vx_in = kk_in then
						pc <= pc + 2;
					else
						pc <= pc + 1;						
					end if;

				elsif op_ser = '1' then		-- 5xy0 - SE Vx, Vy
					if Vx_in = Vy_in then
						pc <= pc + 2;
					else
						pc <= pc + 1;						
					end if;

				elsif op_snei = '1' then	-- 4xkk - SNE Vx, byte
					if Vx_in /= kk_in then
						pc <= pc + 2;
					else
						pc <= pc + 1;						
					end if;

				elsif op_sner = '1' then	-- 9xy0 - SNE Vx, Vy
					if Vx_in /= Vy_in then
						pc <= pc + 2;
					else
						pc <= pc + 1;						
					end if;

				else

				end if;
			end if;
		end if;
	end process;


	pc_out <= pc;


end branch_arch;

