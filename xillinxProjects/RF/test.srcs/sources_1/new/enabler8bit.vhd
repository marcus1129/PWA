library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity enabler8bit is
    Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
           E : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end enabler8bit;

architecture Behavioral of enabler8bit is

component Enabler is
    Port ( input : in STD_LOGIC;
           enable : in STD_LOGIC;
           output : out STD_LOGIC);
end component;

begin

GEN_Enabler: for i in 0 to 7 generate
    ENABLE: Enabler port map(X(i),E,Y(i));     
end generate GEN_Enabler;

end Behavioral;
