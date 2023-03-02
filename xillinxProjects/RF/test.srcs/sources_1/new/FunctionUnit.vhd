library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FunctionUnit is 
    port (  A,B: in std_logic_vector (7 downto 0); 
            FS3,FS2,FS1,FS0: in std_logic;
            V,C,N,Z: out std_logic;
            F: out std_logic_vector (7 downto 0) );
            
end FunctionUnit; 

architecture FU_Behavorial of FunctionUnit is

component ALU is
    Port(   A,B: in std_logic_vector (7 downto 0); 
            J_Select: in std_logic_vector (3 downto 0); 
            V,C: out std_logic;
            J: out std_logic_vector (7 downto 0));
end component;

component FunctionSelect is 
    port (  FS3,FS2: in std_logic;
            MF: out std_logic );
End component;

component Shifter is
    port (
            B: in std_logic_vector (7 downto 0); 
            H_Select: in std_logic_vector (1 downto 0); 
            H: out std_logic_vector (7 downto 0));
end component;

component MUX2x1x8 is
    port (  A,B: in std_logic_vector (7 downto 0); 
            Sel: in std_logic;
            Output: out std_logic_vector (7 downto 0));
end component;

component NegZero is
    Port(   MUXF: in std_logic_vector (7 downto 0);
            N,Z: out std_logic);
end component;

signal J_Select: STD_LOGIC_VECTOR (3 downto 0);
signal J: STD_LOGIC_VECTOR (7 downto 0);
signal MF: std_logic;
signal H: STD_LOGIC_VECTOR (7 downto 0);
signal H_Select: STD_LOGIC_VECTOR (1 downto 0);
signal Y: std_logic_vector (7 downto 0);

begin

F <= Y;
J_Select <= (FS3,FS2,FS1,FS0);
H_Select <= (FS1, FS0);


ALU_1: ALU port map(A,B,J_Select,V,C,J);
Fsel: FunctionSelect port map(FS3,FS2,MF);
Shifter_1: Shifter port map(B,H_Select,H);
MUXF: MUX2x1x8 port map(J,H,MF,Y);
NegZero_1: NegZero port map(Y,N,Z);


end FU_Behavorial;
