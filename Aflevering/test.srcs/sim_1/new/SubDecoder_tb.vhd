library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SubDecoder_tb is
end SubDecoder_tb;

architecture Behavioral of SubDecoder_tb is

component SubDecoder
    Port(Input : in STD_LOGIC_VECTOR(0 to 1);
         enable : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR(0 to 3));
end component;

Signal Input : STD_LOGIC_VECTOR(0 to 1);
Signal enable : STD_LOGIC;
Signal Output : STD_LOGIC_VECTOR(0 to 3);

begin

UUT : SubDecoder port map(Input, enable, Output);

stimulus: process
begin

enable <= '1';
Input <= "00";
wait for 10ns;
Input <= "01";
wait for 10ns;
Input <= "10";
wait for 10ns;
Input <= "11";
wait for 10ns;



end process;


end Behavioral;
