library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity RF is
    Port (  Reset, CLK, RW: in std_logic;
            DA, AA, BA: in std_logic_vector (3 downto 0);
            D_Data: in std_logic_vector (7 downto 0);
            A_Data,B_Data: out std_logic_vector (7 downto 0);
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
         DataOut0, DataOut1, DataOut2, DataOut3, DataOut4, DataOut5, DataOut6, DataOut7, DataOut8, DataOut9, DataOut10, DataOut11, DataOut12, DataOut13, DataOut14, DataOut15 : out STD_LOGIC_VECTOR(0 to 7));
end component;

component MUX
    port(Input0,Input1,Input2,Input3,Input4,Input5,Input6,Input7,Input8,Input9,Input10,Input11,Input12,Input13,Input14,Input15 : in STD_LOGIC_VECTOR(0 to 7);
         SelectAddress : in STD_LOGIC_VECTOR(0 to 3);
         Output : out STD_LOGIC_VECTOR(0 to 7));
end component;

signal LoadSig: STD_LOGIC_VECTOR(0 to 15);
signal DataOut0Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut1Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut2Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut3Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut4Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut5Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut6Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut7Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut8Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut9Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut10Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut11Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut12Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut13Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut14Sig: STD_LOGIC_VECTOR(0 to 7);
signal DataOut15Sig: STD_LOGIC_VECTOR(0 to 7);


begin

DestinationDecoder: DD port map(RW, DA, LoadSig);
RegisterLogic: RL port map(CLK, LoadSig, D_Data, DataOut0Sig, DataOut1Sig, DataOut2Sig, DataOut3Sig, DataOut4Sig, DataOut5Sig, DataOut6Sig, DataOut7Sig, DataOut8Sig, DataOut9Sig, DataOut10Sig, DataOut11Sig, DataOut12Sig, DataOut13Sig, DataOut14Sig, DataOut15Sig);
MUXA: MUX port map(DataOut0Sig, DataOut1Sig, DataOut2Sig, DataOut3Sig, DataOut4Sig, DataOut5Sig, DataOut6Sig, DataOut7Sig, DataOut8Sig, DataOut9Sig, DataOut10Sig, DataOut11Sig, DataOut12Sig, DataOut13Sig, DataOut14Sig, DataOut15Sig, AA, A_Data);
MUXB: MUX port map(DataOut0Sig, DataOut1Sig, DataOut2Sig, DataOut3Sig, DataOut4Sig, DataOut5Sig, DataOut6Sig, DataOut7Sig, DataOut8Sig, DataOut9Sig, DataOut10Sig, DataOut11Sig, DataOut12Sig, DataOut13Sig, DataOut14Sig, DataOut15Sig, BA, B_Data);


end Behavioral;
