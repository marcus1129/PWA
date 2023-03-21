library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlop_tb is
end FlipFlop_tb;

architecture Behavioral of FlipFlop_tb is

component FlipFlop is
    Port (Enable : in STD_LOGIC;
          DataIn : in STD_LOGIC;
          Reset : in STD_LOGIC;
          CLK : in STD_LOGIC;
          DataOut : out STD_LOGIC);
end component;

signal Enable: STD_LOGIC;
signal DataIn: STD_LOGIC;
signal Reset: STD_LOGIC;
signal DataOut: STD_LOGIC;
signal CLK: STD_LOGIC;
constant clk_period: time:= 10ns;
signal end_test: std_logic:= '1';

begin

UUT : FlipFlop port map(Enable, DataIn, Reset, CLK, DataOut);

clock: process
begin
while end_test='1' loop
CLK <='0';
wait for clk_period*0.5;
CLK <= '1';
wait for clk_period*0.5;
end loop;
wait;
end process;

stimulus: process
begin

Reset <= '0';
Enable <= '0';
wait for clk_period;
DataIn <= '1';
Enable <= '1';
wait for clk_period;
Enable <= '0';
DataIn <= '0';
wait for clk_period*3;
Enable <= '1';
wait for clk_period;
Enable <= '0';
wait for clk_period;
DataIn <= '1';
Enable <= '1';
wait for clk_period;
Enable <= '0';
DataIn <= '0';
wait for clk_period*2;
Reset <= '1';
wait for clk_period;
end_test <= '0';

end process;

end Behavioral;
