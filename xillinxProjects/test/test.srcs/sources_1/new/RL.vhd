library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RL is
    Port(CLK : in STD_LOGIC;
         Load : in STD_LOGIC_VECTOR(0 to 15);
         DataIn : in STD_LOGIC_VECTOR(0 to 7);
         DataOutA : out STD_LOGIC_VECTOR(0 to 7);
         DataOutB : out STD_LOGIC_VECTOR(0 to 7));
end RL;

architecture Behavioral of RL is

component RegisterCell
    Port (Toggle : in STD_LOGIC;
          DataIn : in STD_LOGIC_VECTOR(0 to 7);
          DataOut : out STD_LOGIC_VECTOR(0 to 7));
end component;

begin

RC0 : RegisterCell port map(Load(0), DataIn, DataOutA);
RC1 : RegisterCell port map(Load(1), DataIn, DataOutA);
RC2 : RegisterCell port map(Load(2), DataIn, DataOutA);
RC3 : RegisterCell port map(Load(3), DataIn, DataOutA);
RC4 : RegisterCell port map(Load(4), DataIn, DataOutA);
RC5 : RegisterCell port map(Load(5), DataIn, DataOutA);
RC6 : RegisterCell port map(Load(6), DataIn, DataOutA);
RC7 : RegisterCell port map(Load(7), DataIn, DataOutA);
RC8 : RegisterCell port map(Load(8), DataIn, DataOutA);
RC9 : RegisterCell port map(Load(9), DataIn, DataOutA);
RC10 : RegisterCell port map(Load(10), DataIn, DataOutA);
RC11 : RegisterCell port map(Load(11), DataIn, DataOutA);
RC12 : RegisterCell port map(Load(12), DataIn, DataOutA);
RC13 : RegisterCell port map(Load(13), DataIn, DataOutA);
RC14 : RegisterCell port map(Load(14), DataIn, DataOutA);
RC15 : RegisterCell port map(Load(15), DataIn, DataOutA);

end Behavioral;
