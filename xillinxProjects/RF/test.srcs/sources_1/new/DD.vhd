library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DD is
    port( Write : in STD_LOGIC;
          D_Address : in STD_LOGIC_VECTOR (0 to 3);
          Load : out STD_LOGIC_VECTOR (0 to 15));
end DD;

architecture Behavioral of DD is

begin

process(Write, D_Address) is
begin

end process;

end Behavioral;
