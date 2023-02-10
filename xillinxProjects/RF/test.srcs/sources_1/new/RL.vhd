library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RL is
    Port(CLK : in STD_LOGIC;
         Load : in STD_LOGIC_VECTOR(0 to 15);
         DataIn : in STD_LOGIC_VECTOR(0 to 7);
         DataOut0, DataOut1, DataOut2, DataOut3, DataOut4, DataOut5, DataOut6, DataOut7, DataOut8, DataOut9, DataOut10, DataOut11, DataOut12, DataOut13, DataOut14, DataOut15 : out STD_LOGIC_VECTOR(0 to 7));
end RL;

architecture Behavioral of RL is

component RegisterCell
    Port (Toggle : in STD_LOGIC;
          DataIn : in STD_LOGIC_VECTOR(0 to 7);
          DataOut : out STD_LOGIC_VECTOR(0 to 7));
end component;

begin

RC0 : RegisterCell port map(Load(0), DataIn, DataOut0);
RC1 : RegisterCell port map(Load(1), DataIn, DataOut1);
RC2 : RegisterCell port map(Load(2), DataIn, DataOut2);
RC3 : RegisterCell port map(Load(3), DataIn, DataOut3);
RC4 : RegisterCell port map(Load(4), DataIn, DataOut4);
RC5 : RegisterCell port map(Load(5), DataIn, DataOut5);
RC6 : RegisterCell port map(Load(6), DataIn, DataOut6);
RC7 : RegisterCell port map(Load(7), DataIn, DataOut7);
RC8 : RegisterCell port map(Load(8), DataIn, DataOut8);
RC9 : RegisterCell port map(Load(9), DataIn, DataOut9);
RC10 : RegisterCell port map(Load(10), DataIn, DataOut10);
RC11 : RegisterCell port map(Load(11), DataIn, DataOut11);
RC12 : RegisterCell port map(Load(12), DataIn, DataOut12);
RC13 : RegisterCell port map(Load(13), DataIn, DataOut13);
RC14 : RegisterCell port map(Load(14), DataIn, DataOut14);
RC15 : RegisterCell port map(Load(15), DataIn, DataOut15);

end Behavioral;
