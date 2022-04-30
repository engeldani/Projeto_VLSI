library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity lsu is
    port (
        --Entrada
        clock       : in std_logic;
        reset       : in std_logic;
        data        : in std_logic_vector(7 downto 0);
        --data_memory : in std_logic_vector(7 downto 0);
        --Saida
        address_memory : out std_logic_vector(11 downto 0);
        instruction : out std_logic_vector(15 downto 0);
        decode : out std_logic
    );
end lsu;

architecture lsu of lsu is
    type load is (l1, l2);
    signal FSM1 : load;
    type store is (s1, s2);
    signal FSM2 : store;

    signal pc : std_logic_vector(11 downto 0);
    signal data_memory : std_logic_vector(7 downto 0);
begin
    decode <= '0' when FSM1 = l1 else
              '1' when FSM1 = l2;

    process(clock, reset)
    begin
        if reset = '1' then
            FSM1 <= l1;
            pc <= x"200";
            address_memory <= pc;
        elsif rising_edge(clock) then
            pc <= pc + 1;
            case FSM1 is
                when l1 =>
                    address_memory <= pc;
                    instruction(7 downto 0) <= data_memory;
                    FSM1 <= l2;
                when l2 =>
                    address_memory <= pc;
                    instruction(15 downto 8) <= data_memory;
                    FSM1 <= l1;
            end case;
        end if;
    end process;

    process(clock, reset)
    begin
        if reset = '1' then
            FSM2 <= s1;
            pc <= x"200";
            address_memory <= pc;
        elsif rising_edge(clock) then
            pc <= pc + 1;
            case FSM2 is
                when s1 =>
                    address_memory <= pc;
                    data_memory(7 downto 0) <= data;
                    FSM2 <= s2;
                when s2 =>
                    address_memory <= pc;
                    data_memory(7 downto 0) <= data;
                    FSM2 <= s1;
            end case;
        end if;
    end process;
end architecture;