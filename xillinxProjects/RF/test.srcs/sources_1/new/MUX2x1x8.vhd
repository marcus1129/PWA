library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2x1x8 is
    port (  R,S: in std_logic_vector (7 downto 0); 
            MUX_Select: in std_logic;
            Y: out std_logic_vector (7 downto 0));
end MUX2x1x8;

architecture MUX2x1x8_Behavorial of MUX2x1x8 is

component MUX2x1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Sel : in STD_LOGIC;
           Output : out STD_LOGIC);
end component;

begin

MUX: for i in 0 to 7 generate
    MUX: component MUX2x1
        port map (R(i),S(i),MUX_Select,Y(i));
end generate MUX;


end MUX2x1x8_Behavorial;
