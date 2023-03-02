library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_Subtractor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S_out : out STD_LOGIC);
end Adder_Subtractor;

architecture Behavioral of Adder_Subtractor is

component Full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC);
end component;

signal X: std_logic;

begin

X <= S_in xor B;

ADD_SUB: Full_adder port map(A,X,C_in,C_out,S_out);

end Behavioral;
