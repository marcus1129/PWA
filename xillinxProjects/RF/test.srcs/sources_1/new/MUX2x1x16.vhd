library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2x1x16 is
    Port ( high : in STD_LOGIC_VECTOR (15 downto 0);
           low : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end MUX2x1x16;

architecture Behavioral of MUX2x1x16 is

component MUX2x1x8 is
    port (  R,S: in std_logic_vector (7 downto 0); 
            MUX_Select: in std_logic;
            Y: out std_logic_vector (7 downto 0));
end component;

begin

MSB: MUX2x1x8 port map (high(15 downto 8), low(15 downto 8), sel, output(15 downto 8) );
LSB: MUX2x1x8 port map (high(7 downto 0), low(7 downto 0), sel, output(7 downto 0) );

end Behavioral;
