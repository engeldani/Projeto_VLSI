library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DECODER_SOURCE is
   Port (
      clock : in std_logic;
      reset : in std_logic;

      opcode_in : in STD_LOGIC_VECTOR(15 downto 0);
      
      nnn_out : out STD_LOGIC_VECTOR(11 downto 0);
      -- kk
      -- x
      -- y
      -- n
      instruction_out : out STD_LOGIC_VECTOR(34 downto 0);
   );
end DECODER_SOURCE;

architecture rtl of DECODER_SOURCE is
   signal nnn : STD_LOGIC_VECTOR(11 downto 0);
   -- kk
   -- x
   -- y
   -- n
   signal instruction : STD_LOGIC_VECTOR(34 downto 0);
begin

   nnn <= opcode_in(11 downto 0);
   -- kk
   -- x
   -- y
   -- n

   process (clock, reset)
   begin
      if reset = '1' then

      elsif clock'event and clock = '1' then
         nnn_out <= nnn;
         -- kk_out
         -- x_out
         -- y_out
         -- n_out
         instruction_out <= instruction;
      end if;
   end process;


   process(opcode_in)
   begin
      case opcode_in(15 downto 12) is
         when x"0" =>
            case opcode_in(11 downto 0) is
               when x"0E0" =>
                  instruction <= '00000000000000000000000000000000010'; -- CLS
               when x"0EE" =>
                  instruction <= '00000000000000000000000000000000100'; -- RET
               when others =>
                  instruction <= '00000000000000000000000000000000001'; -- SYS
            end case;
         when x"1" => 
            -- instruction <= ?
         when x"8" =>
            case opcode_in(3 downto 00) is
               when x"0" =>
                  -- ?
               when x"1" =>
                  -- ?
               -- .....
            end case;
         -- ......
         when others => 
            -- ERRO?
      end case;
   end process;

end architecture;
