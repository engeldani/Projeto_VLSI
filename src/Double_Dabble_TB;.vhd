library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity dd_tb is
end dd_tb;
    
architecture dd of dd_tb is
    signal clock : std_logic := '0';
    signal reset : std_logic;

    signal bin_tb: std_logic_vector (7 downto 0) := (others => '0');

    signal bcd_tb: std_logic_vector (11 downto 0);

begin

DUT:
    entity work.lsu
        port map (
            bin => bin_tb,
            bcd => bcd_tb
        );

STIMULUS:
    process

    begin
        for i in 0 to 255 loop
            bin_tb <= std_logic_vector(to_unsigned(i,8));
            wait for 1 ns;
        end loop;
        wait for 1 ns;
        wait;
    end process;
end architecture;