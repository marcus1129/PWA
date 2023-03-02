library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_tb is
end RF_tb;

architecture Behavioral of RF_tb is

component RF is
    Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           RW : in STD_LOGIC;
           D_Data : in STD_LOGIC_VECTOR (0 to 7);
           DA : in STD_LOGIC_VECTOR (0 to 3);
           AA : in STD_LOGIC_VECTOR (0 to 3);
           BA : in STD_LOGIC_VECTOR (0 to 3);
           A_Data : out STD_LOGIC_VECTOR(0 to 7);
           B_Data : out STD_LOGIC_VECTOR(0 to 7));
end component;

signal Reset : STD_LOGIC;
signal RW : STD_LOGIC;
signal D_Data : STD_LOGIC_VECTOR(0 to 7);
signal DA : STD_LOGIC_VECTOR(0 to 3);
signal AA : STD_LOGIC_VECTOR(0 to 3);
signal BA : STD_LOGIC_VECTOR(0 to 3);
signal A_Data : STD_LOGIC_VECTOR(0 to 7);
signal B_Data : STD_LOGIC_VECTOR(0 to 7);
signal CLK: STD_LOGIC;
constant clk_period: time:= 10ns;
signal end_test: std_logic:= '1';

begin

UUT : RF port map (CLK, Reset, RW, D_Data, DA, AA, BA, A_Data, B_Data);

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
Reset <= '1';
wait for clk_period;
Reset <= '0';
RW <= '0';

D_Data <= x"00";
wait for clk_period;
RW <= '1';
DA <= "0000";
wait for clk_period;
RW <= '0';
AA <= "0000";
wait for clk_period;

D_Data <= x"11";
RW <= '1';
DA <= "0001";
wait for clk_period;
RW <= '0';
AA <= "0001";
BA <= "0000";
wait for clk_period;

D_Data <= x"22";
RW <= '1';
DA <= "0010";
wait for clk_period;
RW <= '0';
AA <= "0010";
BA <= "0001";
wait for clk_period;

D_Data <= x"33";
RW <= '1';
DA <= "0011";
wait for clk_period;
RW <= '0';
AA <= "0011";
BA <= "0010";
wait for clk_period;

D_Data <= x"44";
RW <= '1';
DA <= "0100";
wait for clk_period;
RW <= '0';
AA <= "0100";
BA <= "0011";
wait for clk_period;

D_Data <= x"55";
RW <= '1';
DA <= "0101";
wait for clk_period;
RW <= '0';
AA <= "0101";
BA <= "0100";
wait for clk_period;

D_Data <= x"66";
RW <= '1';
DA <= "0110";
wait for clk_period;
RW <= '0';
AA <= "0110";
BA <= "0101";
wait for clk_period;

D_Data <= x"77";
RW <= '1';
DA <= "0111";
wait for clk_period;
RW <= '0';
AA <= "0111";
BA <= "0110";
wait for clk_period;

D_Data <= x"88";
RW <= '1';
DA <= "1000";
wait for clk_period;
RW <= '0';
AA <= "1000";
BA <= "0111";
wait for clk_period;

D_Data <= x"99";
RW <= '1';
DA <= "1001";
wait for clk_period;
RW <= '0';
AA <= "1001";
BA <= "1000";
wait for clk_period;

D_Data <= x"AA";
RW <= '1';
DA <= "1010";
wait for clk_period;
RW <= '0';
AA <= "1010";
BA <= "1001";
wait for clk_period;

D_Data <= x"BB";
RW <= '1';
DA <= "1011";
wait for clk_period;
RW <= '0';
AA <= "1011";
BA <= "1010";
wait for clk_period;

D_Data <= x"CC";
RW <= '1';
DA <= "1100";
wait for clk_period;
RW <= '0';
AA <= "1100";
BA <= "1011";
wait for clk_period;

D_Data <= x"DD";
RW <= '1';
DA <= "1101";
wait for clk_period;
RW <= '0';
AA <= "1101";
BA <= "1100";
wait for clk_period;

D_Data <= x"EE";
RW <= '1';
DA <= "1110";
wait for clk_period;
RW <= '0';
AA <= "1110";
BA <= "1101";
wait for clk_period;

D_Data <= x"FF";
RW <= '1';
DA <= "1111";
wait for clk_period;
RW <= '0';
AA <= "1111";
BA <= "1110";
wait for clk_period;

end process;


end Behavioral;
