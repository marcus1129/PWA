library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_tb is
end MUX_tb;

architecture Behavioral of MUX_tb is

component MUX16x1x8
    port(Input0,Input1,Input2,Input3,Input4,Input5,Input6,Input7,Input8,Input9,Input10,Input11,Input12,Input13,Input14,Input15 : in STD_LOGIC_VECTOR(0 to 7);
         SelectAddress : in STD_LOGIC_VECTOR(0 to 3);
         Output : out STD_LOGIC_VECTOR(0 to 7));
end component;

Signal Input0 : STD_LOGIC_VECTOR(0 to 7) := x"00";
Signal Input1 : STD_LOGIC_VECTOR(0 to 7) := x"11";
Signal Input2 : STD_LOGIC_VECTOR(0 to 7) := x"22";
Signal Input3 : STD_LOGIC_VECTOR(0 to 7) := x"33";
Signal Input4 : STD_LOGIC_VECTOR(0 to 7) := x"44";
Signal Input5 : STD_LOGIC_VECTOR(0 to 7) := x"55";
Signal Input6 : STD_LOGIC_VECTOR(0 to 7) := x"66";
Signal Input7 : STD_LOGIC_VECTOR(0 to 7) := x"77";
Signal Input8 : STD_LOGIC_VECTOR(0 to 7) := x"88";
Signal Input9 : STD_LOGIC_VECTOR(0 to 7) := x"99";
Signal Input10 : STD_LOGIC_VECTOR(0 to 7) := x"AA";
Signal Input11 : STD_LOGIC_VECTOR(0 to 7) := x"BB";
Signal Input12 : STD_LOGIC_VECTOR(0 to 7) := x"CC";
Signal Input13 : STD_LOGIC_VECTOR(0 to 7) := x"DD";
Signal Input14 : STD_LOGIC_VECTOR(0 to 7) := x"EE";
Signal Input15 : STD_LOGIC_VECTOR(0 to 7) := x"FF";
Signal SelectAddress : STD_LOGIC_VECTOR(0 to 3);
Signal Output : STD_LOGIC_VECTOR(0 to 7);

begin

UUT : MUX16x1x8 port map(Input0,Input1,Input2,Input3,Input4,Input5,Input6,Input7,Input8,Input9,Input10,Input11,Input12,Input13,Input14,Input15,SelectAddress, Output);

stimulus : process
begin

SelectAddress <= "0000";
wait for 10ns;
SelectAddress <= "0001";
wait for 10ns;
SelectAddress <= "0010";
wait for 10ns;
SelectAddress <= "0011";
wait for 10ns;
SelectAddress <= "0100";
wait for 10ns;
SelectAddress <= "0101";
wait for 10ns;
SelectAddress <= "0110";
wait for 10ns;
SelectAddress <= "0111";
wait for 10ns;
SelectAddress <= "1000";
wait for 10ns;
SelectAddress <= "1001";
wait for 10ns;
SelectAddress <= "1010";
wait for 10ns;
SelectAddress <= "1011";
wait for 10ns;
SelectAddress <= "1100";
wait for 10ns;
SelectAddress <= "1101";
wait for 10ns;
SelectAddress <= "1110";
wait for 10ns;
SelectAddress <= "1111";
wait for 10ns;

end process;

end Behavioral;
