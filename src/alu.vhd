
LIBRARY ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY alu IS
    PORT (
        clock   : IN STD_LOGIC;
        reset   : IN STD_LOGIC;
        op_addr : IN STD_LOGIC;
        op_addi : IN STD_LOGIC;
        op_or   : IN STD_LOGIC;
        op_and  : IN STD_LOGIC;
        op_xor  : IN STD_LOGIC;
        op_sub  : IN STD_LOGIC; 
        op_shr  : IN STD_LOGIC; --
        op_subn : IN STD_LOGIC;
        op_shl  : IN STD_LOGIC;
        vx      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);    --registrador1
        vy      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);    --registrador2
        kk      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);    --imediato
        alu_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        underflow: out std_logic;
        borrow   : out std_logic;
        overflow : out std_logic
    );
END alu;
ARCHITECTURE rtl OF alu IS
   
    SIGNAL res_addr  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL res_addi  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL res_or    : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL res_and   : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL res_xor   : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL res_sub   : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL res_shr   : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL res_subn  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL res_shl   : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL resposta  : STD_LOGIC_VECTOR(7 DOWNTO 0);
    
BEGIN
resposta <= res_addr when op_addr = '1' else
            res_addi when op_addi = '1' else
            res_or   when op_or   = '1' else
            res_and  when op_and  = '1' else
            res_xor  when op_xor  = '1' else
            res_sub  when op_sub  = '1' else
            res_shr  when op_shr  = '1' else
            res_subn when op_subn = '1' else
            res_shl  when op_shl  = '1';


        --terminar
    PROCESS (CLOCK, reset)
    BEGIN
        if reset = '1' then
            alu_out   <= (others => '0');
            underflow <='0';
            borrow    <= '0';
            overflow  <= '0';
        elsif(rising_edge(clock))then
            alu_out   <=resposta;
            underflow <= vx(0);
            --borrow    <= std_logic(to_integer(signed(vx)) < to_integer(signed(vy)));
            overflow  <= vx(7);
        end if;
    END PROCESS;
    res_addr <= std_logic_vector(signed(vx) + signed(vy));
    res_addi <= std_logic_vector(signed(vx) + signed(kk));
    res_or   <= vx or vy; --
    res_and  <= vx and vy; --
    res_xor  <= vx xor vy; --
    res_sub  <= std_logic_vector(signed(vx) - signed(vy));
    res_shr  <= std_logic_vector(shift_right(unsigned(vx), 1));
    res_subn <= std_logic_vector(signed(vx) - signed(vy));
    res_shl  <= std_logic_vector(shift_left(unsigned(vx), 1));
END ARCHITECTURE;