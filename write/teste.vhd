
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
            busy          : out std_logic; --enquanto ta realizando fica em 1 pra não receber mais instruções 
    );
end draw;

architecture draw of draw is

signal counter : std_logic_vector (7 downto 0);
signal x : std_logic_vector (63 downto 0);
signal y : std_logic_vector (31 downto 0);
 

begin
--maquina de estados (inicial, ) cls 2 e drw 3 
type SM_Main_t is (start,CLS_1, CLS_2, DRW_1, DRW_2,DRW_3);
signal SM_Main_r : SM_Main_t := start;

process(clock) 
    begin
        if reset = '1' then           -- faz teu reset aqui
            fb_data_in <= (others '0');
            op_cls <= 0;
            op_drw <= 0;

            estado <= start;
        if rising_edge(clock) then
            case SM_Main_r is
                when start =>
                    if op_cls= '1' then
                        estado <= CLS_1;
                   
                    when CLS_1=>
                   -- Para ler:

                    --1o ciclo:
                    --addr_x <= endereço em x para leitura do fb
                    --addr_y <= endereço em y para leitura do fb
                    
                    --2o ciclo: dado está disponível no barramento
                    --dado <= fb_data_in
                    when CLS_2=>
                    --Para escrever:

                    --1o ciclo:
                    --addr_x <= endereço em x
                    --addr_y <= endereçõ em y
                    --fb_data_OUT <= valor para escrever
                    --write_enable <= '1'

                    --2o ciclo: o dado está escrito, parar de escrever
                    --write_enable <= '0';
            
                        -- op do cls aqui dentro
                    elsif op_drw = '1' then
                                        -- primeiro ciclo do drw aqui 
                                        --Ciclo 1 do DRW:
                                        --Prepara a leitura da memória conforme I + contador
                                        --Prepara a leitura do FB conforme VX e (VY + contador)
                        estado <= DRW_1;
                    end if;
                when DRW_1 =>
                                        -- primeiro ciclo do drw aqui 
                                        --Ciclo 1 do DRW:
                                        --Prepara a leitura da memória conforme I + contador
                                        --Prepara a leitura do FB conforme VX e (VY + contador)
                    estado <= DRW_2;
                when DRW_2 =>
                                  -- segundo ciclo do drw aqui... pode permanecer por vários ciclos pq é um 'loop'
                                  --Verifica a colisão: fb_data_in AND mem_data_in --> verificar se o resultado dessa operação produz algum bit 1 e escrever em "VF_OUT"
                                  --fb_data_out <= fb_data_in XOR mem_data_in -- essa é a op de desenhar no fb
                                  --fb_addr <= conforme Vx e (Vy + contador), o mesmo do ciclo anterior
                                  --fb_write_enable <= '1'
                    estado <= DRW_3;                                  
                when DRW_3=>
                    if counter = n then
                        estado <= start;
                        counter<= (others => '0');
                    else
                        estado <= DRW_1;
                        counter <= counter + 1; 

                
                                  --Ciclo 3 do DRW:
                                  --fb_write_enable <= '1'
                                  --se contador = 15, estado = inicial e contador <= 0, senao contador <= contador + 1 e estado <= ciclo 1 do   DRW
            end case;
        end if;
    end process;
end architecture; 
