library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_arith.all;

entity testbench is

end testbench;

architecture tb of testbench is

    signal  tb_clock 			: std_logic := '1';
    signal  tb_reset 			: std_logic := '1';
    signal  tb_opcode_in 		: std_logic_vector(15 downto 0) := x"0000";
    signal  tb_nnn_out   		: std_logic_vector(11 downto 0);		-- address
    signal  tb_kk_out    		: std_logic_vector(7 downto 0);
    signal  tb_x_out     		: std_logic_vector(3 downto 0);
    signal  tb_y_out     		: std_logic_vector(3 downto 0);
    signal  tb_n_out     		: std_logic_vector(3 downto 0);
    signal  tb_instruction_out 	: std_logic_vector(34 downto 0);

begin

	tb_clock <= not tb_clock after 10 ns;

	tb_reset <= '1', '0' after 123 ns;


	tb_opcode_in <= x"0000", 
					x"00E0" after 200 ns,
					x"0123" after 400 ns,
					x"1BBB" after 600 ns,
					x"2FFF" after 800 ns,
                    x"3EEE" after 1000 ns,
					x"4BBB" after 1200 ns,
					x"5AAA" after 1400 ns,
                    x"6AED" after 1600 ns,
					x"7BCD" after 1800 ns,
					x"8ADA" after 2000 ns;


	decoder: entity work.DECODER_SOURCE
	port map 
	(
		clock 			=> tb_clock, 			
		reset 			=> tb_reset, 			
		opcode_in 		=> tb_opcode_in, 		
		nnn_out   		=> tb_nnn_out,   		
		kk_out    		=> tb_kk_out,    		
		x_out     		=> tb_x_out,     		
		y_out     		=> tb_y_out,     		
		n_out     		=> tb_n_out,     		
		instruction_out => tb_instruction_out 	
	);


end tb;