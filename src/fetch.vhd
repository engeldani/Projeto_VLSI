library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity fetch is
    port (
        --Entrada
        clock       : in std_logic;
        reset       : in std_logic;
        data_memory : in std_logic_vector(7 downto 0);
        --pc          : in std_logic_vector(11 downto 0);
        --Saida
        address_memory : out std_logic_vector(11 downto 0);
        instruction : out std_logic_vector(15 downto 0);
        decode : out std_logic
    );
end fetch;

architecture fetch of fetch is
    type state is (fetch1, fetch2);
    signal FSM : state;

    signal pc : std_logic_vector(11 downto 0);
begin
    decode <= '0' when FSM = fetch1 else
              '1' when FSM = fetch2;

    process(clock, reset)
    begin
        if reset = '1' then
            FSM <= fetch1;
            pc <= "000000000001";
            address_memory <= pc;
        elsif rising_edge(clock) then
        case FSM is
                when fetch1 =>
                    pc <= pc + 1;
                    address_memory <= pc;
                    instruction <= data_memory;
                    FSM <= fetch2;
                when fetch2 =>
                    pc <= pc + 1;
                    address_memory <= pc;
                    instruction <= data_memory;
                    FSM <= fetch1;
            end case;
        end if;
    end process;
end architecture;