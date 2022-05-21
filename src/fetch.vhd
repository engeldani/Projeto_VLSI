library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity fetch is
    port (
        --Entrada
        clock       : in std_logic;
        reset       : in std_logic;
        data_memory : in std_logic_vector(7 downto 0);
        --Saida
        address_memory : out std_logic_vector(11 downto 0);
        instruction : out std_logic_vector(15 downto 0);
        decode : out std_logic;
    );
end fetch;

architecture fetch of fetch is
    type state is (fetch1, fetch2);
    signal FSM : state;

    signal pc : std_logic_vector(11 downto 0);
begin

	process(clock, reset)
    begin
        if reset = '1' then
            FSM <= fetch1;
            pc <= x"200";
            address_memory <= pc;
        elsif rising_edge(clock) then
            pc <= pc + 1;
            case FSM is
                when fetch1 =>
                    address_memory <= pc;
                    instruction(7 downto 0) <= data_memory;
                    FSM <= fetch2;
					decode <= '0';
                when fetch2 =>
                    address_memory <= pc;
                    instruction(15 downto 8) <= data_memory;
                    FSM <= fetch1;
					decode <= '1';
            end case;
        end if;
    end process;
	
end architecture;