library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_SUBB_8bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C_in : in STD_LOGIC;
           S_in : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (7 downto 0);
           C_out: out STD_LOGIC);
end ADD_SUBB_8bit;

architecture Behavioral of ADD_SUBB_8bit is

component Adder_Subtractor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S_out : out STD_LOGIC);
end component;

signal cc: std_logic_vector (7 downto 0);

begin

GEN_ADD_SUB: for i in 0 to 7 generate

    lsb: if i=0 generate
        U0: Adder_Subtractor port map(A(i),B(i),C_in,S_in,cc(i),Sum(i));
    end generate lsb;
    
    bits: if (i>0 and i<7) generate
        UX: Adder_Subtractor port map(A(i),B(i),cc(i-1),S_in,cc(i),Sum(i));
    end generate bits;
    
    msb: if i=7 generate
        U7: Adder_Subtractor port map(A(i),B(i),cc(i-1),S_in,C_out,Sum(i));
    end generate msb;
        
end generate GEN_ADD_SUB;


end Behavioral;
