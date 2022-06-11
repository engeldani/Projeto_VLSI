library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture testbench of testbench is

    type FB is array (0 to 2, 0 to 2) of std_logic;

    
    signal clk : std_logic := '1';   
   -- signal reset : std_logic;

    --Sinais que sao gerados pelo testbench. Sao a entrada de controladordevideo.vhd
    --signal   clk      :  std_logic;
    signal   rgb_in   :  std_logic;
    
    --Sinais que sao lidos pelo testbench. Sao a saida de controladordevideo.vhd
    signal    rgb_out :  std_logic_vector (2 downto 0);
    signal    hsync   :  std_logic;
    signal    vsync   :  std_logic;
    signal    hpos    :  integer;
    signal    vpos    :  integer;
    
begin
    
    controller : entity work.VgaController
        port map(
            clk => clk,
            rgb_in => rgb_in,
            rgb_out => rgb_out,
            hsync => hsync,
            vsync => vsync,
            hpos => hpos,
            vpos => vpos
            );

    --reset     <= '1', '0' after 100 ns;
	-- 192 MHz
    clk     <= not clk after 5 ns;
    
 process is --configura as entrada do troca bits
    variable framebuffer : FB := (('1','1','1'),
                                  ('1','1','1'), 
                                  ('1','1','1'));
    begin
        wait for 0 ns;
        rgb_in <= framebuffer (hpos, vpos);

    wait; 
 end process;


end architecture;
