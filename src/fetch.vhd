library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity fetch is
    port (
        --Entrada
        data_memory : in std_logic_vector(7 downto 0);
        program_counter : in std_logic_vector(11 downto 0);
        --Saida
        address_memory : out std_logic_vector(11 downto 0);
        instruction : out std_logic_vector(15 downto 0)
    );
end fetch;




architecture fetch of fetch is
begin
    
end architecture;