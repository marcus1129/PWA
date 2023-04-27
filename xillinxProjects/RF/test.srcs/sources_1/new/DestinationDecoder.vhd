library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DestinationDecoder is
    port(Write : in STD_LOGIC;
         D_Address : in STD_LOGIC_VECTOR(3 downto 0);
         Load : out STD_LOGIC_VECTOR(15 downto 0));
end DestinationDecoder;

architecture DD_Behavioral of DestinationDecoder is

component Decoder4x16M
    port( Enable : in STD_LOGIC;
          Input : in STD_LOGIC_VECTOR (3 downto 0);
          Output : out STD_LOGIC_VECTOR (15 downto 0));
end component;

begin

Decoder : Decoder4x16M port map(Write, D_Address, Load);
--load <= tempLoad(0)&tempLoad(1)&tempLoad(2)&tempLoad(3)&tempLoad(4)&tempLoad(5)&tempLoad(6)&tempLoad(7)&tempLoad(8)&tempLoad(9)&tempLoad(10)&tempLoad(11)&tempLoad(12)&tempLoad(13)&tempLoad(14)&tempLoad(15);


end DD_Behavioral;