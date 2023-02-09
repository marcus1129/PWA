library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF is
    Port ( CLK : in STD_LOGIC;
           RW : in STD_LOGIC;
           D_Data : in STD_LOGIC_VECTOR (0 to 7);
           DA : in STD_LOGIC_VECTOR (0 to 3);
           AA : in STD_LOGIC_VECTOR (0 to 3);
           BA : in STD_LOGIC_VECTOR (0 to 3);
           A_Data : out STD_LOGIC_VECTOR(0 to 7);
           B_Data : out STD_LOGIC_VECTOR(0 to 7));
end RF;

architecture Behavioral of RF is

component DD
    port( Write : in STD_LOGIC;
          D_Address : in STD_LOGIC_VECTOR (0 to 3);
          Load : out STD_LOGIC_VECTOR (0 to 15));
end component;

component RL
    Port(CLK : in STD_LOGIC;
         Load : in STD_LOGIC_VECTOR(0 to 15);
         DataIn : in STD_LOGIC_VECTOR(0 to 7);
         DataOutA : out STD_LOGIC_VECTOR(0 to 7);
         DataOutB : out STD_LOGIC_VECTOR(0 to 7));
end component;

component MUX
    port(Input : in STD_LOGIC_VECTOR(0 to 7);
         SelectAddress : in STD_LOGIC_VECTOR(0 to 3);
         Output : out STD_LOGIC_VECTOR(0 to 7));
end component;

signal LoadSig: STD_LOGIC_VECTOR(0 to 15);
signal DataOutASig: STD_LOGIC_VECTOR(0 to 7);
signal DataOutBSig: STD_LOGIC_VECTOR(0 to 7);

begin

DestinationDecoder: DD port map(RW, DA, LoadSig);
RegisterLogic: RL port map(CLK, LoadSig, D_Data, DataOutASig, DataOutBSig);
MUXA: MUX port map(DataOutASig, AA, A_Data);
MUXB: MUX port map(DataOutBSig, BA, B_Data);

end Behavioral;
