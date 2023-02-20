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

begin

process(CLK, Reset)

begin
DataOut <= OutputSig;
if Reset='1' then
    OutputSig <= '0';
elsif rising_edge(CLK) then
    if Enable='1' then
        OutputSig <= DataIn;
    else null;
    end if;
end if;



end process;

end Behavioral;
