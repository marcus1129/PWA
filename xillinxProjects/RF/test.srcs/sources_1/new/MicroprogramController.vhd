library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity MicroprogramController is 
    port (  RESET, CLK: in std_logic;
            Address_In: in std_logic_vector (7 downto 0);
            Address_Out: out std_logic_vector (7 downto 0);
            Instruction_In: in std_logic_vector (15 downto 0);
            Constant_Out: out std_logic_vector (7 downto 0);
            V,C,N,Z: in std_logic;
            DX,AX,BX,FS: out std_logic_vector (3 downto 0);
            MB,MD,RW,MM,MW: out std_logic
            );
End MicroprogramController;

Architecture MCU_Behavorial of MicroprogramController is 

component ProgramCounter is 
    Port (  RESET: in std_logic;
            CLK: in std_logic;
            Address_In: in std_logic_vector(7 downto 0); 
            PS: in std_logic_vector(1 downto 0); 
            Offset: in std_logic_vector(7 downto 0); 
            PC: out std_logic_vector (7 downto 0));
end component;

component InstructionRegister is 
    port (  RESET: in std_logic;
            CLK: in std_logic;
            Instruction_In: in std_logic_vector (15 downto 0); 
            IL: in std_logic;
            IR: out std_logic_vector (15 downto 0) );
End component;

component SignExtender is 
    port (  IR: in std_logic_vector (15 downto 0); 
            Extended_8: out std_logic_vector ( 7 downto 0));
End component;

component ZeroFiller 
  port (  IR: in std_logic_vector (15 downto 0); 
          ZeroFilled_8: out std_logic_vector ( 7 downto 0) );
end component;

component IDC is
    Port ( Reset, CLK : in STD_LOGIC;
           IR : in STD_LOGIC_VECTOR (15 downto 0);
           V, C, N, Z : in STD_LOGIC;
           IL : out STD_LOGIC;
           PS : out STD_LOGIC_VECTOR (1 downto 0);
           DX, AX, BX : out STD_LOGIC_VECTOR (3 downto 0);
           MB : out STD_LOGIC;
           FS : out STD_LOGIC_VECTOR (3 downto 0);
           MD : out STD_LOGIC;
           RW : out STD_LOGIC;
           MM : out STD_LOGIC;
           MW : out STD_LOGIC);
end component;

signal IL: std_logic;
signal PS: std_logic_vector (1 downto 0);
signal Offset: std_logic_vector (7 downto 0);
signal IR_out: std_logic_vector (15 downto 0);

Begin

PC: ProgramCounter port map(RESET, CLK, Address_In, PS, Offset, Address_Out);
IR: InstructionRegister port map(RESET, CLK, Instruction_In, IL, IR_out);
SE: SignExtender port map(IR_out, Offset);
ZF: ZeroFiller port map(IR_out, Constant_Out);
IDC3: IDC port map (RESET, CLK, IR_out, V,C,N,Z,IL,PS,DX,AX,BX,MB,FS,MD,RW,MM,MW);
    
End;