library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity write is
Port ( Clk : in std_logic;  --clock
write_enable : in std_logic; --ativa o sinal de write
write_address : in std_logic_vector(7 downto 0); --escrita de endereço
read_address : in std_logic_vector(7 downto 0);  -- le o endereçco
data_in : in std_logic_vector(7 downto 0); -- input do framebuffer
data_out : out std_logic_vector(7 downto 0)); --saida do fb 
end write;
architecture Behavioral of write is

type framebuffer is array(7 downto 0) of std_logic_vector(7 downto 0);
signal fb : framebuffer;

signal address : std_logic_vector(7 downto 0);


begin

process(Clk, write_enable)
begin
if Clk'event and Clk = '1' then
if write_enable = '1' then -- quando = 1 escreve a entrada no fb 
fb(conv_integer(write_address)) <= data_in;
end if;
address <= read_address;
end if;
end process;

data_out <= fb(conv_integer(address)); -- le o dado do endereço do fb 

end Behavioral;
