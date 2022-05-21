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

    process(clock, reset)
    begin
        -- Receber o PC
        -- Usar o PC para endereçar a memória (ARRAY)
        -- Escrever a saída no data_memory
        -- Printar o byte escrito no data_emmory
        -- data_memory <= memoria(pc)

        -- Receber o 'decode'
        -- if(decode = '1')
            -- Printar o instruction
    end process;

end architecture;