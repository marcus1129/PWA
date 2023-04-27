library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterR16 is
    Port(CLK : in STD_LOGIC;
         Reset : in STD_LOGIC;
         Load : in STD_LOGIC_VECTOR(15 downto 0);
         DataIn : in STD_LOGIC_VECTOR(7 downto 0);
         DataOut0, DataOut1, DataOut2, DataOut3, DataOut4, DataOut5, DataOut6, DataOut7, DataOut8, DataOut9, DataOut10, DataOut11, DataOut12, DataOut13, DataOut14, DataOut15 : out STD_LOGIC_VECTOR(7 downto 0));
end RegisterR16;

architecture RR16_Behavioral of RegisterR16 is

component RegisterCell
    Port (Enable : in STD_LOGIC;
          Reset : in STD_LOGIC;
          CLK : in STD_LOGIC;
          DataIn : in STD_LOGIC_VECTOR(7 downto 0);
          DataOut : out STD_LOGIC_VECTOR(7 downto 0));
end component;

begin

RC0 : RegisterCell port map(Load(0), Reset, CLK, DataIn, DataOut0);
RC1 : RegisterCell port map(Load(1), Reset, CLK, DataIn, DataOut1);
RC2 : RegisterCell port map(Load(2), Reset, CLK, DataIn, DataOut2);
RC3 : RegisterCell port map(Load(3), Reset, CLK, DataIn, DataOut3);
RC4 : RegisterCell port map(Load(4), Reset, CLK, DataIn, DataOut4);
RC5 : RegisterCell port map(Load(5), Reset, CLK, DataIn, DataOut5);
RC6 : RegisterCell port map(Load(6), Reset, CLK, DataIn, DataOut6);
RC7 : RegisterCell port map(Load(7), Reset, CLK, DataIn, DataOut7);
RC8 : RegisterCell port map(Load(8), Reset, CLK, DataIn, DataOut8);
RC9 : RegisterCell port map(Load(9), Reset, CLK, DataIn, DataOut9);
RC10 : RegisterCell port map(Load(10), Reset, CLK, DataIn, DataOut10);
RC11 : RegisterCell port map(Load(11), Reset, CLK, DataIn, DataOut11);
RC12 : RegisterCell port map(Load(12), Reset, CLK, DataIn, DataOut12);
RC13 : RegisterCell port map(Load(13), Reset, CLK, DataIn, DataOut13);
RC14 : RegisterCell port map(Load(14), Reset, CLK, DataIn, DataOut14);
RC15 : RegisterCell port map(Load(15), Reset, CLK, DataIn, DataOut15);

end RR16_Behavioral;