library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlop is
    Port (Enable : in STD_LOGIC;
          DataIn : in STD_LOGIC;
          Reset : in STD_LOGIC;
          CLK : in STD_LOGIC;
          DataOut : out STD_LOGIC);
end FlipFlop;

architecture Behavioral of FlipFlop is
signal OutputSig: STD_LOGIC;
signal InputSig: STD_LOGIC;
signal S: STD_LOGIC;
signal R: STD_LOGIC;
signal Q: STD_LOGIC;
signal Qnot: STD_LOGIC;


begin

--InputSig <= DataIn and (not Reset);
--S <= (not InputSig) and (CLK and Enable);
--R <= InputSig and (CLK and Enable);
--Q <= S nor Qnot;
--Qnot <= R nor Q;
--DataOut <= Q;



process(CLK, Reset)
begin
if Reset='1' then
    DataOut <= '0';
elsif rising_edge(CLK) then
    if Enable='1' then
       DataOut <= DataIn;
    else null;
    end if;
end if;
end process;

end Behavioral;
