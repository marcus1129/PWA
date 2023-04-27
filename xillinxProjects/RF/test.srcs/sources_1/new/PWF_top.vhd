library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PWF_top is
    Port (  Clk, Reset : in std_logic;
            BTNC, BTNU, BTNL, BTNR, BTND : in std_logic;
            SW: in std_logic_vector (7 downto 0);
            LED : out std_logic_vector (7 downto 0);
            Anode : out std_logic_vector (3 downto 0);
            Catode: out std_logic_vector(6 downto 0));
end PWF_top;

architecture Behavioral of PWF_top is

component MicroprogramController is 
    port (  RESET, CLK: in std_logic;
            Address_In: in std_logic_vector (7 downto 0);
            Address_Out: out std_logic_vector (7 downto 0);
            Instruction_In: in std_logic_vector (15 downto 0);
            Constant_Out: out std_logic_vector (7 downto 0);
            V,C,N,Z: in std_logic;
            DX,AX,BX,FS: out std_logic_vector (3 downto 0);
            MB,MD,RW,MM,MW: out std_logic
            );
End component;

component Datapath is 
    port (  RESET, CLK, RW, MB, FS3,FS2,FS1,FS0, MD: in std_logic;
            DA,AA,BA: in std_logic_vector (3 downto 0);
            ConstantIn, DataIn: in std_logic_vector (7 downto 0);
            Address_Out, Data_Out: out std_logic_vector (7 downto 0);
            V,C,N,Z: out std_logic);
End component;

component MUX2x1x8 is
    port (  R,S: in std_logic_vector (7 downto 0); 
            MUX_Select: in std_logic;
            Y: out std_logic_vector (7 downto 0));
end component;

component Ram256X16 is
        Port (  clk, Reset : in STD_LOGIC;
                Data_in : in STD_LOGIC_VECTOR (15 downto 0); 
                Address_in : in STD_LOGIC_VECTOR (9 downto 0); 
                MW : in STD_LOGIC_vector (1 downto 0);
                Data_out : out STD_LOGIC_VECTOR (15 downto 0)); 
end component;

component PortReg8x8 is
    Port (  clk, reset, MW : in STD_LOGIC;
            Data_In, Address_in, SW : STD_LOGIC_VECTOR ( 7 downto 0);
            BTNC, BTNU, BTNL, BTNR, BTND : in STD_LOGIC;
            MMR : out STD_LOGIC;
            D_word, Data_outR : out STD_LOGIC_VECTOR ( 15 downto 0);
            LED : out STD_LOGIC_VECTOR ( 7 downto 0));
end component;

component MUX2x1x16 is
    Port ( high : in STD_LOGIC_VECTOR (15 downto 0);
           low : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component SevenSeg8 is
    Port ( Rst,Clk: in  std_logic;    
	       Data :   in  std_logic_vector (15 downto 0); -- Binary data
           cat :    out std_logic_vector(6 downto 0);  -- Common cathodes
           an :     out std_logic_vector(3 downto 0)); -- Common Anodes
end component;

signal V,C,N,Z,MB,MD,RW,MM,MW, MMR: std_logic;
signal MW_sig: std_logic_vector(1 downto 0);
signal DX,AX,BX,FS : std_logic_vector (3 downto 0);
signal address1, address2, address3, Const, bus2 : std_logic_vector (7 downto 0);
signal address_sig : std_logic_vector (9 downto 0);
signal bus1, D_word, bus3, Data_outR, Data_OutM : std_logic_vector (15 downto 0);

begin

MW_sig <= MW & MW;
address_sig <= "00" & address3;

MC: MicroprogramController port map(reset, clk, address1, address2, bus1, Const, V,C,N,Z, DX,AX,BX,FS, MB,MD,RW,MM,MW);
DP: Datapath port map(reset, clk, RW, MB, FS(3), FS(2), FS(1), FS(0), MD, DX, AX, BX, Const, bus1(7 downto 0), address1, bus2, V,C,N,Z);
MUXM: MUX2x1x8 port map(address2, address1, MM, address3);
RAM: Ram256X16 port map(clk, reset, bus3, address_sig, MW_sig, Data_OutM);
PR: PortReg8x8 port map(clk, reset, MW, bus2, address3, SW, BTNC, BTNU, BTNL, BTNR, BTND, MMR, D_word, Data_outR, LED);
MUXMR: MUX2x1x16 port map(Data_outR, Data_outM, MMR, bus1);
SS8: SevenSeg8 port map(reset, clk, D_word, Catode, Anode);

ZeroFiller2: process(bus2)
begin
    bus3 <= x"00" & bus2;
end process ZeroFiller2;

end Behavioral;
