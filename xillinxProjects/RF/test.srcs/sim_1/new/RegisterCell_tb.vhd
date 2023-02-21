library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterCell_tb is
end RegisterCell_tb;

architecture Behavioral of RegisterCell_tb is

component RegisterCell
    Port (Enable : in STD_LOGIC;
          CLK : in STD_LOGIC;
          DataIn : in STD_LOGIC_VECTOR(0 to 7);
          DataOut : out STD_LOGIC_VECTOR(0 to 7));
end component;

signal Enable: STD_LOGIC;
signal Reset: STD_LOGIC;
signal CLK: STD_LOGIC;
signal DataIn: STD_LOGIC_VECTOR(0 to 7);
signal DataOut: STD_LOGIC_VECTOR(0 to 7);
constant clk_period: time:= 10ns;
signal end_test: std_logic:= '1';

begin

UUT : RegisterCell port map(Enable, CLK, DataIn, DataOut);

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
DataIn <= "10010000";
Enable <= '1';
wait for clk_period;
Enable <= '0';
DataIn <= "00000000";
wait for clk_period*3;
Enable <= '1';
wait for clk_period;
Enable <= '0';
wait for clk_period;
DataIn <= "00011001";
Enable <= '1';
wait for clk_period;
Enable <= '0';
DataIn <= "00000000";
wait for clk_period*2;
Reset <= '1';
wait for clk_period;
end_test <= '0';

end process;

end Behavioral;
