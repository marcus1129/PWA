library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX16x1x8 is
    port(Input0,Input1,Input2,Input3,Input4,Input5,Input6,Input7,Input8,Input9,Input10,Input11,Input12,Input13,Input14,Input15 : in STD_LOGIC_VECTOR(0 to 7);
         SelectAddress : in STD_LOGIC_VECTOR(0 to 3);
         Output : out STD_LOGIC_VECTOR(0 to 7));
end MUX16x1x8;

architecture MUX16x1x8_Behavioral of MUX16x1x8 is

component SubMUX
    port(InputA : in STD_LOGIC_VECTOR(0 to 7);
         InputB : in STD_LOGIC_VECTOR(0 to 7);
         InputC : in STD_LOGIC_VECTOR(0 to 7);
         InputD : in STD_LOGIC_VECTOR(0 to 7);
         Toggle : in STD_LOGIC_VECTOR(0 to 3);
         Output : out STD_LOGIC_VECTOR(0 to 7));
end component;

component SubDecoder
    Port(Input : in STD_LOGIC_VECTOR(0 to 1);
         enable : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR(0 to 3));
end component;

Signal DecodedSig1 : STD_LOGIC_VECTOR(0 to 3);
Signal DecodedSig2 : STD_LOGIC_VECTOR(0 to 3);
Signal SubMUXOutA : STD_LOGIC_VECTOR(0 to 7);
Signal SubMUXOutB : STD_LOGIC_VECTOR(0 to 7);
Signal SubMUXOutC : STD_LOGIC_VECTOR(0 to 7);
Signal SubMUXOutD : STD_LOGIC_VECTOR(0 to 7);

begin

SD1 : SubDecoder port map(SelectAddress(2 to 3), '1', DecodedSig1);
SubMUX0 : SubMUX port map(Input0, Input1, Input2, Input3, DecodedSig1, SubMUXOutA);
SubMUX1 : SubMUX port map(Input4, Input5, Input6, Input7, DecodedSig1, SubMUXOutB);
SubMUX2 : SubMUX port map(Input8, Input9, Input10, Input11, DecodedSig1, SubMUXOutC);
SubMUX3 : SubMUX port map(Input12, Input13, Input14, Input15, DecodedSig1, SubMUXOutD);

SD2 : SubDecoder port map(SelectAddress(0 to 1), '1', DecodedSig2);
SubMUX4 : SubMUX port map(SubMUXOutA, SubMUXOutB, SubMUXOutC, SubMUXOutD, DecodedSig2, Output);

end MUX16x1x8_Behavioral;
