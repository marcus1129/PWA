library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2x1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Sel : in STD_LOGIC;
           Output : out STD_LOGIC);
end MUX2x1;

architecture Behavioral of MUX2x1 is

begin

Output <= (A and (not Sel)) or (B and Sel);

end Behavioral;
