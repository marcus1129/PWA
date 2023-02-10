library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
    port(Input0,Input1,Input2,Input3,Input4,Input5,Input6,Input7,Input8,Input9,Input10,Input11,Input12,Input13,Input14,Input15 : in STD_LOGIC_VECTOR(0 to 7);
         SelectAddress : in STD_LOGIC_VECTOR(0 to 3);
         Output : out STD_LOGIC_VECTOR(0 to 7));
end MUX;

architecture Behavioral of MUX is

component SubMUX
    port(InputA : in STD_LOGIC_VECTOR(0 to 7);
         InputB : in STD_LOGIC_VECTOR(0 to 7);
         InputC : in STD_LOGIC_VECTOR(0 to 7);
         InputD : in STD_LOGIC_VECTOR(0 to 7);
         Toggle : in STD_LOGIC_VECTOR(0 to 1);
         Output : out STD_LOGIC_VECTOR(0 to 7));
end component;

Signal SubMUXOutA : STD_LOGIC_VECTOR(0 to 7);
Signal SubMUXOutB : STD_LOGIC_VECTOR(0 to 7);
Signal SubMUXOutC : STD_LOGIC_VECTOR(0 to 7);
Signal SubMUXOutD : STD_LOGIC_VECTOR(0 to 7);

begin

SubMUX0 : SubMUX port map(Input0, Input1, Input2, Input3, SelectAddress(0 to 1), SubMUXOutA);
SubMUX1 : SubMUX port map(Input4, Input5, Input6, Input7, SelectAddress(0 to 1), SubMUXOutB);
SubMUX2 : SubMUX port map(Input8, Input9, Input10, Input11, SelectAddress(0 to 1), SubMUXOutC);
SubMUX3 : SubMUX port map(Input12, Input13, Input14, Input15, SelectAddress(0 to 1), SubMUXOutD);
SubMUX4 : SubMUX port map(SubMUXOutA, SubMUXOutB, SubMUXOutC, SubMUXOutD, SelectAddress(2 to 3), Output);

end Behavioral;
