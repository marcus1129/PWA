library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And8 is
    port(Vec : in STD_LOGIC_VECTOR(0 to 7);
         Sig : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR(0 to 7));
end And8;

architecture Behavioral of And8 is

begin

Output(0) <= Vec(0) and Sig;
Output(1) <= Vec(1) and Sig;
Output(2) <= Vec(2) and Sig;
Output(3) <= Vec(3) and Sig;
Output(4) <= Vec(4) and Sig;
Output(5) <= Vec(5) and Sig;
Output(6) <= Vec(6) and Sig;
Output(7) <= Vec(7) and Sig;

end Behavioral;
