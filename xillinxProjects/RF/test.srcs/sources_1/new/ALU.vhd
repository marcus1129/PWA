library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port(   A,B: in std_logic_vector (7 downto 0); 
            J_Select: in std_logic_vector (3 downto 0); 
            V,C: out std_logic;
            J: out std_logic_vector (7 downto 0));
end ALU;

architecture ALU_Behavorial of ALU is

component enabler8bit is
    Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
           E : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component decoder4x16 is
    Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component ADD_SUBB_8bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C_in : in STD_LOGIC;
           S_in : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (7 downto 0);
           C_out: out STD_LOGIC);
end component;

component logic_unit8bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC);
end component;

component MUX2x1x8 is
    port (  A,B: in std_logic_vector (7 downto 0); 
            Sel: in std_logic;
            Output: out std_logic_vector (7 downto 0));
end component;

signal plus_one, invert,B_En : std_logic; --logisk værdi afgører arytmetriske funktioenr.
signal C_out: std_logic;
signal SUB_Res,LU_Res: std_logic_vector (7 downto 0);
signal B_out: std_logic_vector(7 downto 0);
signal func : std_logic_vector(15 downto 0);

begin

V <= C_out xor SUB_Res(7);
C <= C_out;

--MF Select tabel
B_EN <= func(2) or func(3) or func(4) or func(5);
invert <= func(4) or func(5) or func(6);
plus_one <= func(1) or func(3) or func(5); 

ADD_SUB: ADD_SUBB_8bit port map(A,B_out,plus_one,invert, SUB_Res, C_out);
DEC: decoder4x16 port map(J_Select, func);
ENABLE: enabler8bit port map(B,B_En,B_out);
LU: logic_unit8bit port map(A,B,LU_Res,J_Select(0),J_Select(1));
MUX: MUX2x1x8 port map(SUB_Res,LU_Res, J_Select(3),J);

end ALU_Behavorial;
