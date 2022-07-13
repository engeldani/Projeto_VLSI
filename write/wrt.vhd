library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity draw is


    port (
            --entradas
            --op_cls        : in std_logic;
            clock        : in std_logic;
            reset        : in std_logic;
            op_drw        : in std_logic; -- vem da memória? --decodificador -- escrever no testbench junto com o fb
            fb_data_in    : in std_logic_vector(7 downto 0);
            --saídas
            fb_write      : out std_logic; --só um pulso pra realizar a escrita?  fp 64 x 32 bits 256 posições -- write controla a escrita
            fb_addr       : out std_logic_vector(7 downto 0); --veirificar se é a posição do objeto na matriz -8 bits
            fb_data       : out std_logic_vector(7 downto 0);
            collision     : out std_logic_vector(2047 downto 0);
            busy          : out std_logic --enquanto ta realizando fica em 1 pra não receber mais instruções 
    );
end draw;

architecture draw of draw is



signal i : std_logic_vector (7 downto 0);
signal n : std_logic_vector (3 downto 0) ;
signal Vx : std_logic_vector (31 downto 0);
signal Vy : std_logic_vector (63 downto 0);
signal j : std_logic_vector (7 downto 0);
signal mem_byte : std_logic_vector (7 downto 0);
signal mem : std_logic_vector (7 downto 0);
signal x : std_logic_vector(7 downto 0);
signal fb_byte : std_logic_vector(2047 downto 0);
signal count_fb_byte : std_logic_vector(2047 downto 0);

--maquina de estados (inicial + 3 estados do DRW ) 
type SM_Main_t is (start, DRW_1, DRW_2, DRW_3);
signal SM_Main_r : SM_Main_t := start;

begin
process(clock, reset) 
    begin
        if reset = '1' then           -- reset aqui
            n <= (others => '0');
            i <= (others => '0');
            j <= (others => '0');
            x <= (others => '0');
            fb_addr <= (others => '0');
            fb_data <= (others => '0');
            Vx <= (others => '0');
            Vy <= (others => '0');
            fb_write <= '0';
            SM_Main_r <= start;
            busy <= '0';
        end if;
        if rising_edge(clock) then
            case SM_Main_r is
                when start =>
                    if op_drw = '1' then
                        SM_Main_r <= DRW_1;
                    end if;

                when DRW_1 =>                       --Leitura memória
                    if i = "00001000" then
                        SM_Main_r <= DRW_2;
                        i <= (others => '0');
                        x <= (others => '0');
                    else
                        mem_byte(x) <= mem(i);
                        i <= i + '1';
                        x <= x + '1';
                    end if;

                when DRW_2 =>                       --Leitura frame buffer
                    if Vy = "01000000" then
                        if Vx = "00100000" then
                            Vx <= (others => '0');
                            Vy <= (others => '0');
                            SM_Main_r <= DRW_3;
                        else
                            Vx <= Vx + '1';
                            Vy <= (others => '0');
                        end if;
                    else
                        fb_byte(count_fb_byte) <= fb_data(Vx, Vy);
                        count_fb_byte <= count_fb_byte + '1';
                        Vy <= Vy + '1';
                    end if;
                                  -- segundo ciclo do drw aqui... pode permanecer por vários ciclos pq é um 'loop'
                                  --Verifica a colisão: fb_data_in AND mem_data_in --> verificar se o resultado dessa operação produz algum bit 1 e escrever em "VF_OUT"
                                  --fb_data_out <= fb_data_in XOR mem_data_in -- essa é a op de desenhar no fb
                                  -- fb_addr <= conforme Vx e (Vy + contador), o mesmo do ciclo anterior

                when DRW_3=>
                    collision() <= fb_byte(2047 downto 2039) xor mem_byte(x);
                

                                  --Ciclo 3 do DRW:
                                  --fb_write_enable <= '1'
                                  --se contador = n, SM_Main_r = inicial e contador <= 0, senao contador <= contador + 1 e SM_Main_r <= ciclo 1 do   DRW
            end case;
        end if;
    end process;
end architecture;
