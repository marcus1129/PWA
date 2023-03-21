library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SubMUX is
    port(InputA : in STD_LOGIC_VECTOR(0 to 7);
         InputB : in STD_LOGIC_VECTOR(0 to 7);
         InputC : in STD_LOGIC_VECTOR(0 to 7);
         InputD : in STD_LOGIC_VECTOR(0 to 7);
         Toggle : in STD_LOGIC_VECTOR(0 to 3);
         Output : out STD_LOGIC_VECTOR(0 to 7));
end SubMUX;

architecture Behavioral of SubMUX is

component And8 is
    port(Vec : in STD_LOGIC_VECTOR(0 to 7);
         Sig : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR(0 to 7));
end component;

Signal AndSig1 : STD_LOGIC_VECTOR(0 to 7);
Signal AndSig2 : STD_LOGIC_VECTOR(0 to 7);
Signal AndSig3 : STD_LOGIC_VECTOR(0 to 7);
Signal AndSig4 : STD_LOGIC_VECTOR(0 to 7);

begin

And1 : And8 port map(InputA, Toggle(0), AndSig1); 
And2 : And8 port map(InputB, Toggle(1), AndSig2); 
And3 : And8 port map(InputC, Toggle(2), AndSig3); 
And4 : And8 port map(InputD, Toggle(3), AndSig4); 
Output <= AndSig1 or AndSig2 or AndSig3 or AndSig4;

end Behavioral;
