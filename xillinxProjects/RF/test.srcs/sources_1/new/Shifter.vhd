library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shifter is
    port (  B: in std_logic_vector (7 downto 0); 
            H_Select: in std_logic_vector (1 downto 0); 
            H: out std_logic_vector (7 downto 0));
end Shifter;

architecture Shifter_Behavorial of Shifter is

component MUX2x1x8 is
    port (  A,B: in std_logic_vector (7 downto 0); 
            Sel: in std_logic;
            Output: out std_logic_vector (7 downto 0));
end component;

signal MUX1_sel: std_logic;
signal MUX0_res, B_sr, B_sl: std_logic_vector(7 downto 0);

begin

B_sr <= '0' & B(7 downto 1);
B_sl <= B(6 downto 0) & '0';
MUX1_sel <= H_Select(1) xor H_Select(0);

MUX0: MUX2x1x8 port map (B_sr, B_sl, H_Select(1), MUX0_res);
MUX1: MUX2x1x8 port map (B, MUX0_res, MUX1_sel, H);


end Shifter_Behavorial;
