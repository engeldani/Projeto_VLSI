--     A B C D
-- E-1-|-|-|-|-
-- F-0-|-+-|-|-
-- G-1-|-|-|-|-
-- H-1-|-|-|-|-
--     R R R R
--     0 0 0 0

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY teclado IS
    PORT (
        CLOCK : IN STD_LOGIC;
        reset : in STD_LOGIC;

        A, B, C, D : IN STD_LOGIC;
        E, F, G, H : OUT STD_LOGIC;
        TECLA_OUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END teclado;
--

ARCHITECTURE rtl OF teclado IS
    TYPE estados IS (ESPERA_COLUNAS, ATIVA_E, ATIVA_F, ATIVA_G, ATIVA_H); -- criação do tipo para a maquina de estados
    
    SIGNAL estado_ativo : estados := ESPERA_COLUNAS; -- Declaração da maquina de estado e definição do estado inicial.
    SIGNAL estado_proximo : estados := ESPERA_COLUNAS;

    signal col_state : std_logic_vector(3 downto 0);
    signal col_prev  : std_logic_vector(3 downto 0);
    signal tecla  :  std_logic_vector(3 downto 0); -- Escolher representar como 16 bits (1 bit por tecla) ou 4 bits (formato hexa, numerico);
BEGIN

    -- COMB?

    -- SINCRONO
    process (clock, reset)
        begin
        if reset = '1' then
            E <= '1';
            F <= '1';
            G <= '1';
            H <= '1';
            estado_ativo <= ESPERA_COLUNAS;
            col_state <= "0000";
        elsif clock'event and clock = '1' then
            -- Sincronizando a entrada
            col_state <= A & B & C & D;

            estado_ativo <= estado_proximo;
            if estado_proximo = ESPERA_COLUNAS then
                col_prev <= col_state;
            elsif estado_proximo = ESPERA_COLUNAS then
                tecla_out <= tecla;
            end if;
        end if;
    end process;

    -- TRANSICAO
    PROCESS (estado_ativo, col_state)--Fazer em forma de flipflop
    begin    
        CASE estado_ativo IS
            -- Caso o estado seja ATIVA_COLUNA, grava as colunas em SEQUENCIA e muda o estado
            WHEN ESPERA_COLUNAS =>
                IF (col_state(3) = '1' OR col_state(2) = '1' OR col_state(1) = '1' OR col_state(0) ='1') THEN
                    -- Alguma das colunas teve clique!
                    estado_proximo <= ATIVA_E;

                    -- Salvar o col_state no col_prev
                else 
                    estado_proximo <= ESPERA_COLUNAS;
                end if;
            WHEN ATIVA_E =>
            if(col_prev(3) = '1' and col_state(3) = '0') then
                tecla = x"c";
                estado_proximo <= ESPERA_COLUNAS;
            elsif(col_prev(2) = '1' and col_state(2) = '0') then
                tecla = x"d";
                estado_proximo <= ESPERA_COLUNAS;
            elsif(col_prev(1) = '1' and col_state(2) = '0') then
                tecla = x"e";
                estado_proximo <= ESPERA_COLUNAS;
            elsif(col_prev(0) = '1' and col_state(2) = '0') then
                tecla = x"f";
                estado_proximo <= ESPERA_COLUNAS;
            else
                estado_proximo <= ATIVA_F;
            end if;

            WHEN ATIVA_F =>
                if(col_prev(3) = '1' and col_state(3) = '0') then
                    tecla = x"8";
                    estado_proximo <= ESPERA_COLUNAS;
                elsif(col_prev(2) = '1' and col_state(2) = '0') then
                    tecla = x"9";
                    estado_proximo <= ESPERA_COLUNAS;
                elsif(col_prev(1) = '1' and col_state(2) = '0') then
                    tecla = x"a";
                    estado_proximo <= ESPERA_COLUNAS;
                elsif(col_prev(0) = '1' and col_state(2) = '0') then
                    tecla = x"b";
                    estado_proximo <= ESPERA_COLUNAS;
                else
                    estado_proximo <= ATIVA_G;
                end if;
            WHEN ATIVA_G =>
            if(col_prev(3) = '1' and col_state(3) = '0') then
                tecla = x"4";
                estado_proximo <= ESPERA_COLUNAS;
            elsif(col_prev(2) = '1' and col_state(2) = '0') then
                tecla = x"5";
                estado_proximo <= ESPERA_COLUNAS;
            elsif(col_prev(1) = '1' and col_state(2) = '0') then
                tecla = x"6";
                estado_proximo <= ESPERA_COLUNAS;
            elsif(col_prev(0) = '1' and col_state(2) = '0') then
                tecla = x"7";
                estado_proximo <= ESPERA_COLUNAS;
            else
                
                    estado_proximo <= ATIVA_H;
                end if;      

            WHEN ATIVA_H =>
            if(col_prev(3) = '1' and col_state(3) = '0') then
                tecla = x"0";
                estado_proximo <= ESPERA_COLUNAS;
            elsif(col_prev(2) = '1' and col_state(2) = '0') then
                tecla = x"1";
                estado_proximo <= ESPERA_COLUNAS;
            elsif(col_prev(1) = '1' and col_state(2) = '0') then
                tecla = x"2";
                estado_proximo <= ESPERA_COLUNAS;
            elsif(col_prev(0) = '1' and col_state(2) = '0') then
                tecla = x"3";
                estado_proximo <= ESPERA_COLUNAS;
            else
            
                end if;     
            
        END CASE;
    END PROCESS;
end architecture;
