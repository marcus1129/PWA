library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Datapath_tb is
end Datapath_tb;

architecture Behavioral of Datapath_tb is

component Datapath
    port (  RESET, CLK, RW, MB, FS3,FS2,FS1,FS0, MD: in std_logic;
            DA,AA,BA: in std_logic_vector (3 downto 0);
            ConstantIn, DataIn: in std_logic_vector (7 downto 0);
            Address_Out, Data_Out: out std_logic_vector (7 downto 0);
            V,C,N,Z: out std_logic);
end component;

Signal RESET, CLK, RW, MB, MD: std_logic;
Signal DA,AA,BA, FS: std_logic_vector (3 downto 0);
Signal ConstantIn, DataIn: std_logic_vector (7 downto 0);
Signal Address_Out, Data_Out: std_logic_vector (7 downto 0);
Signal V,C,N,Z: std_logic;
signal DataOut: STD_LOGIC_VECTOR(0 to 7);
constant clk_period: time:= 10ns;
signal end_test: std_logic:= '1';

begin

UUT: Datapath port map(RESET, CLK, RW, MB, FS(3), FS(2), FS(1), FS(0), MD, DA, AA, BA, ConstantIn, DataIn, Address_Out, Data_Out, V, C, N, Z);

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

stimulus : process
begin

--Setup
RESET <= '1';
wait for clk_period;
RESET <= '0';
RW <= '0';
MB <= '1';
FS <="0000";
DA <= "0000";
AA <= x"0";
BA <= x"1";
ConstantIn <= X"00";
DataIn <= x"AA";
MD <= '0';


--Load values to A and B
wait for clk_period;
DA <= x"0";
RW <= '1';
wait for clk_period;
RW <= '0';
wait for clk_period;
DA <= x"1";
DataIn <= x"01";
RW <= '1';
wait for clk_period;
RW <= '0';
wait for clk_period;


--Try different micro operations
FS <= "0000";
wait for clk_period;
FS <= "0001";
wait for clk_period;
FS <= "0010";
wait for clk_period;
FS <= "0011";
wait for clk_period;
FS <= "0100";
wait for clk_period;
FS <= "0101";
wait for clk_period;
FS <= "0110";
wait for clk_period;
FS <= "0111";
wait for clk_period;
FS <= "1000";
wait for clk_period;
FS <= "1001";
wait for clk_period;
FS <= "1010";
wait for clk_period;
FS <= "1011";
wait for clk_period;
FS <= "1100";
wait for clk_period;
FS <= "1101";
wait for clk_period;
FS <= "1110";
wait for clk_period;
FS <= "1111";
wait for clk_period;




wait for 2*clk_period;

end process;

end Behavioral;
