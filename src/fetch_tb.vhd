library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity fetch_tb is
end fetch_tb;
    
architecture fetch_tb of fetch_tb is
    signal clock : std_logic := '0';
    signal reset : std_logic;
    
    signal data_memory_tb : std_logic_vector(7 downto 0);
    signal address_memory_tb : std_logic_vector(11 downto 0);
    signal instruction_tb : std_logic_vector(15 downto 0);
    signal decode_tb : std_logic;

begin

    entity work.fetch
        port map (
            clock => clock,
            reset => reset,
            data_memory => data_memory_tb,
            address_memory => address_memory_tb,
            instruction => instruction_tb,
            decode => decode_tb
        );

    reset     <= '1', '0' after 100 ns;
    -- 100 MHz
    clock     <= not clock after 5 ns;

    process

    begin
        for i in 0 to 7 loop
            data_memory_tb <= std_logic_vector(to_unsigned(i,8));
            wait for 1 ns;
        end loop;
        wait for 1 ns;
        wait;
    end process;
end architecture;