library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SubDecoder is
    Port(Input : in STD_LOGIC_VECTOR(0 to 1);
         enable : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR(0 to 3));
end SubDecoder;

architecture Behavioral of SubDecoder is

signal A : STD_LOGIC_VECTOR(0 to 1);
signal D : STD_LOGIC_VECTOR(0 to 3);

begin
A <= Input;
D(0) <= (not A(1)) and (not A(0)) and enable;
D(1) <= A(1) and (not A(0)) and enable;
D(2) <= (not A(1)) and A(0) and enable;
D(3) <= A(1) and A(0) and enable;
Output <= D;

end Behavioral;
