library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DestinationDecoder is
    port(Write : in STD_LOGIC;
         D_Address : in STD_LOGIC_VECTOR(0 to 3);
         Load : out STD_LOGIC_VECTOR(0 to 15));
end DestinationDecoder;

architecture DD_Behavioral of DestinationDecoder is

component Decoder4x16
    port( Enable : in STD_LOGIC;
          Input : in STD_LOGIC_VECTOR (0 to 3);
          Output : out STD_LOGIC_VECTOR (0 to 15));
end component;

begin

Decoder : Decoder4x16 port map(Write, D_Address, Load);

end DD_Behavioral;
