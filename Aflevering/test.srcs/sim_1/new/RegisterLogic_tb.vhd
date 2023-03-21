library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterLogic_tb is
end RegisterLogic_tb;

architecture Behavioral of RegisterLogic_tb is

component RegisterR16
    Port(CLK : in STD_LOGIC;
         Reset : in STD_LOGIC;
         Load : in STD_LOGIC_VECTOR(0 to 15);
         DataIn : in STD_LOGIC_VECTOR(0 to 7);
         DataOut0, DataOut1, DataOut2, DataOut3, DataOut4, DataOut5, DataOut6, DataOut7, DataOut8, DataOut9, DataOut10, DataOut11, DataOut12, DataOut13, DataOut14, DataOut15 : out STD_LOGIC_VECTOR(0 to 7));
end component;

signal CLK: STD_LOGIC;
signal Reset: STD_LOGIC;
signal Load: STD_LOGIC_VECTOR(0 to 15);
signal DataIn: STD_LOGIC_VECTOR(0 to 7);
signal DataOut0, DataOut1, DataOut2, DataOut3, DataOut4, DataOut5, DataOut6, DataOut7, DataOut8, DataOut9, DataOut10, DataOut11, DataOut12, DataOut13, DataOut14, DataOut15: STD_LOGIC_VECTOR(0 to 7);
constant clk_period: time:= 10ns;
signal end_test: std_logic:= '1';

begin

RegisterLogic: RegisterR16 port map(CLK, Reset, Load, DataIn, DataOut0, DataOut1, DataOut2, DataOut3, DataOut4, DataOut5, DataOut6, DataOut7, DataOut8, DataOut9, DataOut10, DataOut11, DataOut12, DataOut13, DataOut14, DataOut15);

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
DataIn <= "10010000";
Load <= X"FFFF";
wait for clk_period;
Load <= X"0000";
wait for clk_period;
DataIn <= "01101111";
Load <= "0000000000000001";
wait for clk_period;
Load <= "0000000000000010";
wait for clk_period;
Load <= "0000000000000100";
wait for clk_period;
Load <= "0000000000001000";
wait for clk_period;
Load <= "0000000000010000";
wait for clk_period;
Load <= "0000000000100000";
wait for clk_period;
Load <= "0000000001000000";
wait for clk_period;
Load <= "0000000010000000";
wait for clk_period;
Load <= "0000000100000000";
wait for clk_period;
Load <= "0000001000000000";
wait for clk_period;
Load <= "0000010000000000";
wait for clk_period;
Load <= "0000100000000000";
wait for clk_period;
Load <= "0001000000000000";
wait for clk_period;
Load <= "0010000000000000";
wait for clk_period;
Load <= "0100000000000000";
wait for clk_period;
Load <= "1000000000000000";
wait for clk_period*2;
Reset <= '1';
wait for clk_period;
end_test <= '0';

end process;

end Behavioral;
