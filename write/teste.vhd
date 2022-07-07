
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity draw is


    port (
            --entradas
            op_cls        : in std_logic;
            op_drw        : in std_logic; -- vem da memória? --decodificador -- escrever no testbench junto com o fb
            fb_data_in    : in std_logic_vector(7 downto 0);
            --saídas  
            clear_Display : out std_logic; 
            fb_write      : out std_logic; --só um pulso pra realizar a escrita?  fp 64 x 32 bits 256 posições -- write controla a escrita
            fb_addr       : out std_logic_vector(7 downto 0); --veirificar se é a posição do objeto na matriz -8 bits
            fb_data       : out std_logic_vector(7 downto 0);
            busy          : out std_logic --enquanto ta realizando fica em 1 pra não receber mais instruções 
    );
end draw;

architecture draw of draw is

begin
--maquina de estados (inicial, ) cls 2 e drw 3 
	type SM_Main_t is (start, cls1, cls2, wrt1, wrt2, wrt3);
  signal SM_Main_r : SM_Main_t := Idle_s;
	process(clock) 
        begin
            if rising_edge(clock) then

            end if;
        end process;
end architecture; 
