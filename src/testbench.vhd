library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture testbench of testbench is
    signal clock_tb : std_logic;
    signal reset_tb :std_logic;
    signal tecla_out : std_logic_vector(3 DOWNTO 0);
    signal a_in : std_logic;
    signal b_in : std_logic;
    signal c_in : std_logic;
    signal d_in: std_logic;
    signal e_out :std_logic;
    signal f_out : std_logic;
    signal g_out : std_logic;
    signal h_out :std_logic;
    
    
    

   -- signal led_tb : std_logic_vector(0 to 3);
begin

    reset_tb     <= '1', '0' after 100 ns;
	-- 50 MHz
	clock_tb     <= not clock_tb after 20 ns;

    teclado : entity work.teclado
        port map(
            CLOCK   => clock_tb,
            reset   => reset_tb,
            TECLA_OUT   => tecla_out,
            A       => a_in,
            B       => b_in,
            C       => c_in,
            D       => d_in,
            E       => e_out,
            F       => f_out,
            G       => g_out,
            H       => h_out
              
            
            --led_out    => led_tb
        );
    
    a_in <= h_out;
    b_in <= '0';
    c_in <= '0';
    d_in <= '0';
   
end architecture;