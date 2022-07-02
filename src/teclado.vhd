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
        reset : IN STD_LOGIC;

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

    SIGNAL col_state : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL col_prev : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL tecla : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Escolher representar como 16 bits (1 bit por tecla) ou 4 bits (formato hexa, numerico);
BEGIN

    -- COMB?

    -- SINCRONO
    PROCESS (CLOCK, reset)
    BEGIN
        IF reset = '1' THEN
            E <= '1';
            F <= '1';
            G <= '1';
            H <= '1';
            estado_ativo <= ESPERA_COLUNAS;
            col_state <= "0000";
        ELSIF clock'event AND clock = '1' THEN
            -- Sincronizando a entrada
            col_state <= A & B & C & D;

            estado_ativo <= estado_proximo;
            -- if estado_proximo = ESPERA_COLUNAS then
            CASE estado_proximo IS
                WHEN ESPERA_COLUNAS =>
                    tecla_out <= tecla;
                    E <= '1';
                    F <= '1';
                    G <= '1';
                    H <= '1';
                WHEN ATIVA_E =>
                    E <= '0';
                    F <= '1';
                    G <= '1';
                    H <= '1';
                WHEN ATIVA_F =>
                    E <= '1';
                    F <= '0';
                    G <= '1';
                    H <= '1';
                WHEN ATIVA_G =>
                    E <= '1';
                    F <= '1';
                    G <= '0';
                    H <= '1';
                WHEN ATIVA_H =>
                    E <= '1';
                    F <= '1';
                    G <= '1';
                    H <= '0';
            END CASE;
        END IF;
    END PROCESS;

    -- TRANSICAO
    PROCESS (estado_ativo, col_state)--Fazer em forma de flipflop
    BEGIN
        CASE estado_ativo IS
                -- Caso o estado seja ATIVA_COLUNA, grava as colunas em SEQUENCIA e muda o estado
            WHEN ESPERA_COLUNAS =>
                IF (col_state(3) = '1' OR col_state(2) = '1' OR col_state(1) = '1' OR col_state(0) = '1') THEN
                    -- Alguma das colunas teve clique!
                    estado_proximo <= ATIVA_E;

                    col_prev <= col_state;
                ELSE
                    estado_proximo <= ESPERA_COLUNAS;
                END IF;
            WHEN ATIVA_E =>
                IF (col_prev(3) = '1' AND col_state(3) = '0') THEN
                    tecla <= x"c";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(2) = '1' AND col_state(2) = '0') THEN
                    tecla <= x"d";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(1) = '1' AND col_state(1) = '0') THEN
                    tecla <= x"e";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(0) = '1' AND col_state(0) = '0') THEN
                    tecla <= x"f";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSE
                    estado_proximo <= ATIVA_F;
                END IF;

            WHEN ATIVA_F =>
                IF (col_prev(3) = '1' AND col_state(3) = '0') THEN
                    tecla <= x"8";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(2) = '1' AND col_state(2) = '0') THEN
                    tecla <= x"9";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(1) = '1' AND col_state(1) = '0') THEN
                    tecla <= x"a";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(0) = '1' AND col_state(0) = '0') THEN
                    tecla <= x"b";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSE
                    estado_proximo <= ATIVA_G;
                END IF;
            WHEN ATIVA_G =>
                IF (col_prev(3) = '1' AND col_state(3) = '0') THEN
                    tecla <= x"4";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(2) = '1' AND col_state(2) = '0') THEN
                    tecla <= x"5";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(1) = '1' AND col_state(1) = '0') THEN
                    tecla <= x"6";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(0) = '1' AND col_state(0) = '0') THEN
                    tecla <= x"7";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSE

                    estado_proximo <= ATIVA_H;
                END IF;

            WHEN ATIVA_H =>
                IF (col_prev(3) = '1' AND col_state(3) = '0') THEN
                    tecla <= x"0";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(2) = '1' AND col_state(2) = '0') THEN
                    tecla <= x"1";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(1) = '1' AND col_state(1) = '0') THEN
                    tecla <= x"2";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSIF (col_prev(0) = '1' AND col_state(0) = '0') THEN
                    tecla <= x"3";
                    estado_proximo <= ESPERA_COLUNAS;
                ELSE
                    estado_proximo <= ATIVA_E;

                END IF;

        END CASE;
    END PROCESS;
END ARCHITECTURE;