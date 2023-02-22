library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And8_tb is
end And8_tb;

architecture Behavioral of And8_tb is

component And8 is
    port(Vec : in STD_LOGIC_VECTOR(0 to 7);
         Sig : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR(0 to 7));
end component;

Signal Vec : STD_LOGIC_VECTOR(0 to 7);
Signal Sig : STD_LOGIC;
Signal Output : STD_LOGIC_VECTOR(0 to 7);

begin

UUT : And8 port map(Vec, Sig, Output);

stimulus: process
begin

Vec <= "00101011";
Sig <= '1';
wait for 10ns;
Sig <= '0';
wait for 10ns;

end process;

end Behavioral;
