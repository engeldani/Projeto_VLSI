library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture testbench of testbench is
    signal clock : std_logic;
    signal reset : std_logic;

    --Sinais que sao gerados pelo testbench. Sao a entrada de vga_controller.vhd
    signal pixel_clk    : std_logic := '0';
    signal tb_fa         : std_logic := '0';
    signal tb_ff         : std_logic := '0';
    
    --Sinais que sao lidos pelo testbench. Sao a saida de vga_controller.vhd
    signal h_sync    : STD_LOGIC;  --horiztonal sync pulse
    signal v_sync    : STD_LOGIC;  --vertical sync pulse
    signal disp_ena  : STD_LOGIC;  --display enable ('1' = display time, '0' = blanking time)
    signal column    : INTEGER;    --horizontal pixel coordinate
    signal row       : INTEGER;    --vertical pixel coordinate
    signal n_blank   : STD_LOGIC;  --direct blacking output to DAC
    signal n_sync    : STD_LOGIC;    
begin

    controller : entity work.vga_controller
        port map(
            pixel_clk => clock,
            reset => reset,
            h_sync => h_sync,
            v_sync => v_sync,
            disp_ena => disp_ena,
            column   => column,
            row => row,
            n_blank => n_blank,
            n_sync => n_sync
        );

    reset     <= '1', '0' after 100 ns;
	-- 192 MHz
    clock     <= not clock after 5.2 ns;
    
    process --configura as entrada do troca bits
    begin
        --só declarar o clock
        wait;
    end process;


end architecture;
