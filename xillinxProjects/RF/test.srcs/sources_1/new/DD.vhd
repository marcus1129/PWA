library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder4x16 is
    port( Enable : in STD_LOGIC;
          Input : in STD_LOGIC_VECTOR (0 to 3);
          Output : out STD_LOGIC_VECTOR (0 to 15));
end Decoder4x16;

architecture Behavioral_4x16 of Decoder4x16 is

component SubDecoder
    Port(Input : in STD_LOGIC_VECTOR(0 to 1);
         enable : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR(0 to 3));
end component;

signal SubOutput: STD_LOGIC_VECTOR(0 to 3);

begin
SubDecoder1 : SubDecoder port map(Input(0 to 1), '1', SubOutput);
SubDecoder2 : SubDecoder port map(Input(2 to 3), SubOutput(0), Output(0 to 3));
SubDecoder3 : SubDecoder port map(Input(2 to 3), SubOutput(1), Output(4 to 7));
SubDecoder4 : SubDecoder port map(Input(2 to 3), SubOutput(2), Output(8 to 11));
SubDecoder5 : SubDecoder port map(Input(2 to 3), SubOutput(3), Output(12 to 15));


end Behavioral_4x16;
