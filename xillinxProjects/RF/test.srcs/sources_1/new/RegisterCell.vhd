library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterCell is
    Port (Toggle : in STD_LOGIC;
          Reset : in STD_LOGIC;
          CLK : in STD_LOGIC;
          DataIn : in STD_LOGIC_VECTOR(0 to 7);
          DataOut : out STD_LOGIC_VECTOR(0 to 7));
end RegisterCell;

architecture Behavioral of RegisterCell is

component FlipFlop is
    Port (Toggle : in STD_LOGIC;
          DataIn : in STD_LOGIC;
          Reset : in STD_LOGIC;
          CLK : in STD_LOGIC;
          DataOut : out STD_LOGIC);
end component;

begin

FlipFlop0 : FlipFlop port map(Toggle, DataIn(0), Reset, CLK, DataOut(0));
FlipFlop1 : FlipFlop port map(Toggle, DataIn(1), Reset, CLK, DataOut(1));
FlipFlop2 : FlipFlop port map(Toggle, DataIn(2), Reset, CLK, DataOut(2));
FlipFlop3 : FlipFlop port map(Toggle, DataIn(3), Reset, CLK, DataOut(3));
FlipFlop4 : FlipFlop port map(Toggle, DataIn(4), Reset, CLK, DataOut(4));
FlipFlop5 : FlipFlop port map(Toggle, DataIn(5), Reset, CLK, DataOut(5));
FlipFlop6 : FlipFlop port map(Toggle, DataIn(6), Reset, CLK, DataOut(6));
FlipFlop7 : FlipFlop port map(Toggle, DataIn(7), Reset, CLK, DataOut(7));



end Behavioral;
