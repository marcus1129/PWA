library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SubMUX is
    port(InputA : in STD_LOGIC_VECTOR(0 to 7);
         InputB : in STD_LOGIC_VECTOR(0 to 7);
         InputC : in STD_LOGIC_VECTOR(0 to 7);
         InputD : in STD_LOGIC_VECTOR(0 to 7);
         Toggle : in STD_LOGIC_VECTOR(0 to 1);
         Output : out STD_LOGIC_VECTOR(0 to 7));
end SubMUX;

architecture Behavioral of SubMUX is

begin


end Behavioral;
