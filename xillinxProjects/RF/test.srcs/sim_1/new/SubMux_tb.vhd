library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SubMux_tb is
end SubMux_tb;

architecture Behavioral of SubMux_tb is

component SubMUX
    port(InputA : in STD_LOGIC_VECTOR(0 to 7);
         InputB : in STD_LOGIC_VECTOR(0 to 7);
         InputC : in STD_LOGIC_VECTOR(0 to 7);
         InputD : in STD_LOGIC_VECTOR(0 to 7);
         Toggle : in STD_LOGIC_VECTOR(0 to 3);
         Output : out STD_LOGIC_VECTOR(0 to 7));
end component;

Signal InputA : STD_LOGIC_VECTOR(0 to 7) := x"AA";
Signal InputB : STD_LOGIC_VECTOR(0 to 7) := x"BB";
Signal InputC : STD_LOGIC_VECTOR(0 to 7) := x"CC";
Signal InputD : STD_LOGIC_VECTOR(0 to 7) := x"DD";
Signal Toggle : STD_LOGIC_VECTOR(0 to 3);
Signal Output : STD_LOGIC_VECTOR(0 to 7);

begin

UUT : SubMux port map(InputA, InputB, InputC, InputD, Toggle, Output);

stimulus : process
begin

Toggle <= "1000";
wait for 10ns;
Toggle <= "0100";
wait for 10ns;
Toggle <= "0010";
wait for 10ns;
Toggle <= "0001";
wait for 10ns;

end process;

end Behavioral;
