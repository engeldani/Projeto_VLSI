library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity dd_tb is
end entity;
    
architecture dd of ddd_tb is
    signal bin: std_logic_vector (7 downto 0) := (others => '0');

    signal bcd: std_logic_vector (11 downto 0);

begin

DUT:
    entity work.bin8bcd
        port map (
            bin => bin,
            bcd => bcd
        );

STIMULUS:
    process

    begin
        for i in 0 to 255 loop
            bin <= std_logic_vector(to_unsigned(i,8));
            wait for 1 ns;
        end loop;
        wait for 1 ns;
        wait;
    end process;
end architecture;