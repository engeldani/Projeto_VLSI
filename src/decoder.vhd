library ieee;
use ieee.std_logic_1164.all;
 
entity chip8 is
port(
    CLK         : in std_logic;
    KEY         : in std_logic_vector(15 downto 0);
    PROG_N      : in std_logic;
    PROG_ADDR   : in std_logic_vector(11 downto 0);
    PROG_DATA   : in std_logic_vector(7 downto 0);        
    op_code     : in std_logic_vector(15 downto 0);
            
                : out std_logic_vector(3 downto 0)
);
end chip8;
    architecture decodificador of chip8 is
        
        constant OPCODES : std_logic_vector(7 downto 0) := X"0C";
     
        signal VX_LOAD, VX_VAL, VY_VAL : std_logic_vector(7 downto 0);
        signal VX_ADDR, VY_ADDR : natural range 0 to 15;
        signal VX_SEL : natural range 0 to 3;
        signal VX_LOAD_SEL : natural range 0 to 7;
        signal VX_EN : std_logic;
        
        signal IR_VAL : std_logic_vector(7 downto 0);
        signal IR_EN : std_logic;
        
        signal I_LOAD, I_VAL : std_logic_vector(11 downto 0);
        signal I_SEL : natural range 0 to 2;
        signal I_EN : std_logic;
begin
 
process(a)
begin
case a is

end case;
end process;
 
end decodificador;
