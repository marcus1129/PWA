library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder4x16_tb is
end Decoder4x16_tb;

architecture Behavioral of Decoder4x16_tb is

component Decoder4x16
    port( Enable : in STD_LOGIC;
          Input : in STD_LOGIC_VECTOR (0 to 3);
          Output : out STD_LOGIC_VECTOR (0 to 15));
end component;

Signal Enable : STD_LOGIC;
Signal Input : STD_LOGIC_VECTOR(0 to 3);
Signal Output : STD_LOGIC_VECTOR(0 to 15);

begin

UUT : Decoder4x16 port map(Enable, Input, Output);

stimulus : process
begin
Enable <= '1';
Input <= "0000";
Wait for 10ns;
Input <= "0001";
Wait for 10ns;
Input <= "0010";
Wait for 10ns;
Input <= "0011";
Wait for 10ns;
Input <= "0100";
Wait for 10ns;
Input <= "0101";
Wait for 10ns;
Input <= "0110";
Wait for 10ns;
Input <= "0111";
Wait for 10ns;
Input <= "1000";
Wait for 10ns;
Input <= "1001";
Wait for 10ns;
Input <= "1010";
Wait for 10ns;
Input <= "1011";
Wait for 10ns;
Input <= "1100";
Wait for 10ns;
Input <= "1101";
Wait for 10ns;
Input <= "1110";
Wait for 10ns;
Input <= "1111";
Wait for 10ns;
Enable <= '0';
Wait for 10ns;

end process;

end Behavioral;
