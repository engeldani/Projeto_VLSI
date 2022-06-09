library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity decoder_sourde is
   Port (
      clock : in std_logic;
      reset : in std_logic;

      opcode_in : in std_logic_vector(15 downto 0);
      
      nnn_out   : out std_logic_vector(11 downto 0);		-- address
      kk_out    : out std_logic_vector(7 downto 0);
      x_out     : out std_logic_vector(3 downto 0);
      y_out     : out std_logic_vector(3 downto 0);
      n_out     : out std_logic_vector(3 downto 0);
      
      instruction_out : out std_logic_vector(34 downto 0)
   );
end decoder_sourde;

architecture rtl of decoder_sourde is
   signal nnn   : std_logic_vector(11 downto 0);
   signal kk    : std_logic_vector(7 downto 0);
   signal x     : std_logic_vector(3 downto 0);
   signal y     : std_logic_vector(3 downto 0);
   signal n     : std_logic_vector(3 downto 0);
   
   signal instruction : std_logic_vector(34 downto 0);
begin

   nnn  <= opcode_in(11 downto 0);
   kk   <= opcode_in(7 downto 0);
   x    <= opcode_in(11 downto 8);
   y    <= opcode_in(7 downto 4);
   n    <= opcode_in(3 downto 0);

   process (clock, reset)
   begin
      if reset = '1' then

      elsif clock'event and clock = '1' then
         nnn_out <= nnn;
         kk_out  <= kk;
         x_out   <= x;
         y_out   <= y;
         n_out   <= n;
         instruction_out <= instruction;
      end if;
   end process;


   process(opcode_in)
   begin
		case opcode_in(15 downto 12) is
			when x"0" =>
				case opcode_in(11 downto 0) is
					when x"0E0" =>
						instruction <= "00000000000000000000000000000000010"; -- CLS
					when x"0EE" =>
						instruction <= "00000000000000000000000000000000100"; -- RET
					when others =>
						instruction <= "00000000000000000000000000000000001"; -- SYS
				end case;

			when x"1" => 
				instruction <= "00000000000000000000000000000001000"; -- JP ADDR.
			when x"2" => 
				instruction <= "00000000000000000000000000000010000"; -- CALL ADDR.
			when x"3" => 
				instruction <= "00000000000000000000000000000100000"; --  SE Vx, byte.
			when x"4" => 
				instruction <= "00000000000000000000000000001000000"; --  SNE Vx, byte.
			when x"5" => 
				instruction <= "00000000000000000000000000010000000"; -- SE Vx, Vy
			when x"6" => 
				instruction <= "00000000000000000000000000100000000"; -- LD Vx, byte
			when x"7" =>		
				instruction <= "00000000000000000000000001000000000"; --ADD Vx, byte
            when x"8" =>
				case opcode_in(3 downto 0) is
					when x"0" =>
						instruction <= "00000000000000000000000010000000000"; -- LD Vx, Vy
					when x"1" =>
						instruction <= "00000000000000000000000100000000000"; -- OR Vx, Vy
					when x"2" =>
						instruction <= "00000000000000000000001000000000000"; -- AND Vx, Vy
               		when x"3" =>
						instruction <= "00000000000000000000010000000000000"; -- XOR Vx, Vy
               		when x"4" =>
						instruction <= "00000000000000000000100000000000000"; -- ADD Vx, Vy
               		when x"5" =>
						instruction <= "00000000000000000001000000000000000"; -- SUB Vx, Vy
               		when x"6" =>
						instruction <= "00000000000000000010000000000000000"; -- SHR Vx {, Vy}
               		when x"7" =>
						instruction <= "00000000000000000100000000000000000"; -- SUBN Vx, Vy
					when others =>
						instruction <= "00000000000000001000000000000000000";
				end case;

			when x"E" =>
				case opcode_in(7 downto 0) is
					when x"9E" =>
						instruction <= "00000000000000010000000000000000000";
					when x"A1" =>
						instruction <= "00000000000000100000000000000000000";
					when others =>
						instruction <= "00000000000001000000000000000000000"
				end case;

			when x"F" =>
				case opcode_in(7 downto 0) is
					when x"07" =>
						instruction <= "00000000000010000000000000000000000"
					when x"0A" =>
						instruction <= "00000000000100000000000000000000000"
					when x"15" =>
						instruction <= "00000000001000000000000000000000000"
					when x"18" =>
						instruction <= "00000000010000000000000000000000000"
					when x"1E" =>
						instruction <= "00000000100000000000000000000000000"
					when x"29" =>
						instruction <= "00000001000000000000000000000000000"
					when x"33" =>
						instruction <= "00000010000000000000000000000000000"
					when x"55" =>
						instruction <= "00000100000000000000000000000000000"
					when x"65" =>
						instruction <= "00001000000000000000000000000000000"
					when others => 
						instruction <= "00010000000000000000000000000000000"
				end case;
   end process;

end architecture;
