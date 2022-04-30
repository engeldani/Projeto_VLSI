LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY teclado IS
    PORT (
        CLOCK : IN STD_LOGIC;
        F, E, D : IN STD_LOGIC;
        K, J, H, G : OUT STD_LOGIC;
        TECLA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END teclado;

ARCHITECTURE teclado OF teclado IS
    SIGNAL SEQUENCIA : STD_LOGIC_VECTOR (2 DOWNTO 0); -- Registrador usado para guardar os valores das colunas
    TYPE estados IS (ATIVA_COLUNA, ATIVA_LINHA); -- criação do tipo para a maquina de estados

    SIGNAL teclado : estados := ATIVA_COLUNA; -- Declaração da maquina de estado e definição do estado inicial.
BEGIN
    PROCESS (F, E, D, K, J, H, G)
        CASE teclado IS
                -- Caso o estado seja ATIVA_COLUNA, grava as colunas em SEQUENCIA e muda o estado
            WHEN ATIVA_COLUNA =>
                IF (F = '0' OR E = '0' OR D = '0') THEN
                    SEQUENCIA (2 DOWNTO 0) <= F and E and D;
                    teclado <= ATIVA_LINHA;
                END IF;
            WHEN OTHERS => -- (ou seja, quando "ATIVA_LINHA")
                -- Verifica se o botão foi solto, se não continua em ATIVA_LINHA
                IF K = 'H' AND J = 'H' AND H = 'H' AND G = 'H' THEN
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