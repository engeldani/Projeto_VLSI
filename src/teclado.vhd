LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY teclado IS
    PORT (
        --add reset
        CLOCK : IN STD_LOGIC;
        A, B,C, D : IN STD_LOGIC;
        E, F, G, H : OUT STD_LOGIC;
        TECLA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END teclado;
--
ARCHITECTURE teclado OF teclado IS
    SIGNAL SEQUENCIA : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Registrador usado para guardar os valores das colunas
    TYPE estados IS (ATIVA_COLUNA, ATIVA_LINHA); -- criação do tipo para a maquina de estados
    SIGNAL teclado : estados := ATIVA_COLUNA; -- Declaração da maquina de estado e definição do estado inicial.
BEGIN
    PROCESS (A,B,C,D,E,F,G,H)--Fazer em forma de flipflop
        CASE teclado IS
                -- Caso o estado seja ATIVA_COLUNA, grava as colunas em SEQUENCIA e muda o estado
            WHEN ATIVA_COLUNA =>
                IF (A = '1' OR B = '1' OR C = '1' OR D ='1') THEN
                    SEQUENCIA (3 DOWNTO 0) <= A and B and C and D;
                    teclado <= ATIVA_LINHA;
                END IF;
            WHEN OTHERS => -- (ou seja, quando "ATIVA_LINHA")
                -- Verifica se o botão foi solto, se não continua em ATIVA_LINHA
                IF E = '0' AND F = '0' AND G = '0' AND H = '0' THEN
                    teclado <= ATIVA_COLUNA;
                END IF;
        END CASE;
    END PROCESS;
    PROCESS (teclado)
        -- Nesse processo serão selecionados F, E, D, K, J, H, G como entrada ou saída
        CASE teclado IS

                -- Caso o estado seja ATIVA_COLUNA, seleciona F, E, D como entrada e K, H, J, G como saídas
            WHEN ATIVA_COLUNA =>
                A <='1';
                B <='1';
                C <='1';
                D <='1';
                E <='0';
                F <='0';
                G <='0';
                H <='0';

                -- Caso o estado seja ATIVA_LINHA, seleciona F, E, D, como saida e K, H, J, G como entradas
            WHEN OTHERS =>
                A <='0';
                B <='0';
                C <='0';
                D <='0';
                E <='1';
                F <='1';
                G <='1';
                H <='1';

        END CASE;
    END PROCESS;