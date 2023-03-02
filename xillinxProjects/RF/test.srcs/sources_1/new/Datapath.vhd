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

component RF is
    Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           RW : in STD_LOGIC;
           D_Data : in STD_LOGIC_VECTOR (0 to 7);
           DA : in STD_LOGIC_VECTOR (0 to 3);
           AA : in STD_LOGIC_VECTOR (0 to 3);
           BA : in STD_LOGIC_VECTOR (0 to 3);
           A_Data : out STD_LOGIC_VECTOR(0 to 7);
           B_Data : out STD_LOGIC_VECTOR(0 to 7));
end component;

component FunctionUnit is 
    port (  A,B: in std_logic_vector (7 downto 0); 
            FS3,FS2,FS1,FS0: in std_logic;
            V,C,N,Z: out std_logic;
            F: out std_logic_vector (7 downto 0) );
end component; 

component MUX2x1x8 is
    port (  R,S: in std_logic_vector (7 downto 0); 
            MUX_Select: in std_logic;
            Y: out std_logic_vector (7 downto 0));
end component;

signal A_out, D_out, F, D, B_Data: std_logic_vector (7 downto 0);
signal Vsig, Csig, Nsig, Zsig : STD_LOGIC;
signal Fsig : STD_LOGIC_VECTOR(0 to 7);

begin

RegisterFile: RF port map (CLK, RESET, RW, D, DA, AA, BA, A_out, B_Data);
FU: FunctionUnit port map (A_out, D_out,FS3,FS2,FS1,FS0,Vsig,Csig,Nsig,Zsig,Fsig);
MUXD: MUX2x1x8 port map (F, DataIn, MD, D);
MUXB: MUX2x1x8 port map (B_Data, ConstantIn, MB, D_out);

V <= Vsig;
C <= Csig;
N <= Nsig;
Z <= Zsig;
F <= Fsig;
Address_out <= A_out;
Data_out <= D_out;



end Datapath_Behavioral;
