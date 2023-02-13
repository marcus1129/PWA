library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DD is
    port( Write : in STD_LOGIC;
          D_Address : in STD_LOGIC_VECTOR (0 to 3);
          Load : out STD_LOGIC_VECTOR (0 to 15));
end DD;

architecture Behavioral of DD is

component SubDecoder
    Port(Input : in STD_LOGIC_VECTOR(0 to 1);
         enable : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR(0 to 3));
end component;

signal SubOutput: STD_LOGIC_VECTOR(0 to 3);

begin
SubDecoder1 : SubDecoder port map(D_Address(0 to 1), '1', SubOutput);
SubDecoder2 : SubDecoder port map(D_Address(2 to 3), SubOutput(0), Load(0 to 3));
SubDecoder3 : SubDecoder port map(D_Address(2 to 3), SubOutput(1), Load(4 to 7));
SubDecoder4 : SubDecoder port map(D_Address(2 to 3), SubOutput(2), Load(8 to 11));
SubDecoder5 : SubDecoder port map(D_Address(2 to 3), SubOutput(3), Load(12 to 15));


end Behavioral;
