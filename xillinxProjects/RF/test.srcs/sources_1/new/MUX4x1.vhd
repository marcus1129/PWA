library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4x1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Y : out STD_LOGIC);
end MUX4x1;

architecture Behavioral of MUX4x1 is

component MUX2x1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Sel : in STD_LOGIC;
           Output : out STD_LOGIC);
end component;

signal MUX1_res,MUX2_res: std_logic;

begin

MUX1: MUX2x1 port map(A,B,S0,MUX1_res);
MUX2: MUX2x1 port map(C,D,S0,MUX2_res);
MUX3: MUX2x1 port map(MUX1_res,MUX2_res,S1,Y);


end Behavioral;
