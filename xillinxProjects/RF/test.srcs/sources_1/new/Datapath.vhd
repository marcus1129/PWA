library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity Datapath is 
    port (  RESET, CLK, RW, MB, FS3,FS2,FS1,FS0, MD: in std_logic;
            DA,AA,BA: in std_logic_vector (3 downto 0);
            ConstantIn, DataIn: in std_logic_vector (7 downto 0);
            Address_Out, Data_Out: out std_logic_vector (7 downto 0);
            V,C,N,Z: out std_logic);
End Datapath;

architecture Datapath_Behavioral of Datapath is

--component RF is
--    Port (  Reset, CLK, RW: in std_logic;
--            DA, AA, BA: in std_logic_vector (3 downto 0);
--            D_Data: in std_logic_vector (7 downto 0);
--            A_Data,B_Data: out std_logic_vector (7 downto 0);
--end component;

component FunctionUnit is 
    port (  A,B: in std_logic_vector (7 downto 0); 
            FS3,FS2,FS1,FS0: in std_logic;
            V,C,N,Z: out std_logic;
            F: out std_logic_vector (7 downto 0) );
end component; 

component MUX2x1x8 is
    port (  A,B: in std_logic_vector (7 downto 0); 
            Sel: in std_logic;
            Output: out std_logic_vector (7 downto 0));
end component;

signal A, B, F, D, B_Data: std_logic_vector (7 downto 0);

begin

--RF: RF port map (RESET, CLK, RW, DA,AA,BA, D, A, B_Data);
FU: FunctionUnit port map (A,B,FS3,FS2,FS1,FS0,V,C,N,Z,F);
MUXD: MUX2x1x8 port map (F, DataIn, MD, D);
MUXB: MUX2x1x8 port map (B_Data, ConstantIn, MB, B);

end Datapath_Behavioral;
