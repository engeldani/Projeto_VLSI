LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY teclado IS
    PORT (
        CLOCK : IN STD_LOGIC;
        A, B,C, D : IN STD_LOGIC;
        E, F, G, H : OUT STD_LOGIC;
        TECLA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END teclado;

ARCHITECTURE teclado OF teclado IS
    SIGNAL SEQUENCIA : STD_LOGIC_VECTOR (2 DOWNTO 0); -- Registrador usado para guardar os valores das colunas
    TYPE estados IS (ATIVA_COLUNA, ATIVA_LINHA); -- criação do tipo para a maquina de estados

    SIGNAL teclado : estados := ATIVA_COLUNA; -- Declaração da maquina de estado e definição do estado inicial.
BEGIN
    PROCESS (A,B,C,D,E,F,G,H)
        CASE teclado IS
                -- Caso o estado seja ATIVA_COLUNA, grava as colunas em SEQUENCIA e muda o estado
            WHEN ATIVA_COLUNA =>
                IF (A = '0' OR B = '0' OR C = '0' OR D ='0') THEN
                    SEQUENCIA (2 DOWNTO 0) <= F and E and D;
                    teclado <= ATIVA_LINHA;
                END IF;
            WHEN OTHERS => -- (ou seja, quando "ATIVA_LINHA")
                -- Verifica se o botão foi solto, se não continua em ATIVA_LINHA
                IF E = '1' AND F = '1' AND G = '1' AND H = '1' THEN
                    teclado <= ATIVA_COLUNA;
                END IF;
        END CASE;
    END PROCESS;
    PROCESS (teclado)
        -- Nesse processo serão selecionados F, E, D, K, J, H, G como entrada ou saída
        CASE teclado IS

                -- Caso o estado seja ATIVA_COLUNA, seleciona F, E, D como entrada e K, H, J, G como saídas
            WHEN ATIVA_COLUNA =>
                K <='0';
                H <='0';
                J <='0';
                G <='0';
                F <='Z';
                E <='Z';
                D <='Z';

                -- Caso o estado seja ATIVA_LINHA, seleciona F, E, D, como saida e K, H, J, G como entradas
            WHEN OTHERS =>
                K =>'Z';
                H =>'Z';
                J =>'Z';
                G =>'Z';
                F =>'0';
                E =>'0';
                D =>'0';

        END CASE;
    END PROCESS;