library ieee;
use ieee.std_logic_1164.all;
 
entity chip8 is
port(
    CLK         : in std_logic;
    KEY         : in std_logic_vector(15 downto 0);
    PROG_N      : in std_logic;
    PROG_ADDR   : in std_logic_vector(11 downto 0);
    PROG_DATA   : in std_logic_vector(7 downto 0);        
    OPCODES     : in std_logic_vector(15 downto 0)
    
);
end chip8;
    architecture decodificador of chip8 is
        
        constant OPCODES               : std_logic_vector(7 downto 0) := X"0C";
     
        signal VX_LOAD, VX_VAL, VY_VAL : std_logic_vector(7 downto 0);
        signal VX_ADDR, VY_ADDR        : std_logic_vector(15 downto 0);
        signal VX_SEL                  : std_logic_vector(3 downto 0);
        signal VX_LOAD_SEL             : std_logic_vector(7 downto 0);
        signal VX_EN                   : std_logic;
        
        signal IR_VAL                  : std_logic_vector(7 downto 0);
        signal IR_EN                   : std_logic;
        
        signal I_LOAD, I_VAL           : std_logic_vector(11 downto 0);
        signal I_SEL                   : std_logic_vector(2 downto 0);
        signal I_EN                    : std_logic;
begin

   -- Máquina de estados
    process(ESTADO_ATUAL, INICIAR, PROG_FLAG, ADDR_END)
    begin
       PROG_N <= '0';
       ADDR_RST <= '1';
       
       case ESTADO_ATUAL is
          when s_idle =>
             PROG_N <= '1';
             
             if INICIAR = '1' then
                ESTADO <= s_wait;
             else
                ESTADO <= s_idle;
             end if;
             
          when s_wait =>
             if PROG_FLAG = '1' then
                ESTADO <= s_program;
             else
                ESTADO <= s_wait;
             end if;
          
          when s_program =>
             ESTADO <= s_program;
             ADDR_RST <= '0';
             
             if ADDR_END = '1' then
                ESTADO <= s_end;
             end if;
             
          when s_end =>
             PROG_N <= '1';
             
             if INICIAR = '1' then
                ESTADO <= s_end;
             else
                ESTADO <= s_idle;
             end if;
             
       end case;
    end process;
    
    process(CLK)
    begin
       if rising_edge(CLK) then
          if ADDR_RST = '1' then
             ADDR <= (others => '0');
          else
             ADDR <= ADDR + 1;
          end if;
       end if;
    end process;
 
    process(CLK)
    begin
       if rising_edge(CLK) then
          ESTADO_ATUAL <= ESTADO;
          PROG_DATA <= ROM(to_integer(ADDR(11 downto 0)));
       end if;
    end process;
 
end decodificador;
