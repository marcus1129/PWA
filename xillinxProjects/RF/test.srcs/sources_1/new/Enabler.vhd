library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Enabler is
    Port ( input : in STD_LOGIC;
           enable : in STD_LOGIC;
           output : out STD_LOGIC);
end Enabler;

architecture Behavioral of Enabler is

begin

output <= input and enable;

end Behavioral;
