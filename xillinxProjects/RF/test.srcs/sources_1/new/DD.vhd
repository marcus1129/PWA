library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder4x16M is
    port( Enable : in STD_LOGIC;
          Input : in STD_LOGIC_VECTOR (3 downto 0);
          Output : out STD_LOGIC_VECTOR (15 downto 0));
end Decoder4x16M;

architecture Behavioral_4x16 of Decoder4x16M is

component SubDecoder
    Port(Input : in STD_LOGIC_VECTOR(1 downto 0);
         enable : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal SubOutput: STD_LOGIC_VECTOR(3 downto 0);

begin
SubDecoder1 : SubDecoder port map(Input(3 downto 2), enable, SubOutput);
SubDecoder2 : SubDecoder port map(Input(1 downto 0), SubOutput(0), Output(3 downto 0));
SubDecoder3 : SubDecoder port map(Input(1 downto 0), SubOutput(1), Output(7 downto 4));
SubDecoder4 : SubDecoder port map(Input(1 downto 0), SubOutput(2), Output(11 downto 8));
SubDecoder5 : SubDecoder port map(Input(1 downto 0), SubOutput(3), Output(15 downto 12));


end Behavioral_4x16;
