library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder2x4 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           E : in STD_LOGIC;
           out0 : out STD_LOGIC;
           out1 : out STD_LOGIC;
           out2 : out STD_LOGIC;
           out3 : out STD_LOGIC);
end decoder2x4;

architecture Behavioral of decoder2x4 is

signal A_not, B_not: std_logic;

begin

A_not <= not A;
B_not <= not B;

out0 <= (A_not and B_not) and E;
out1 <= (A_not and  B) and E;
out2 <= (A and B_not) and E;
out3 <= (A and B) and E;

end Behavioral;
