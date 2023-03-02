library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_unit8bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC);
end logic_unit8bit;

architecture Behavioral of logic_unit8bit is

component logic_unit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Res : out STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC);
end component;

begin

GEN_LU: for i in 0 to 7 generate
    LU: logic_unit port map(A(i),B(i),Y(i),S0,S1);
end generate GEN_LU;

end Behavioral;
