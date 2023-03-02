library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder4x16 is
    Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (15 downto 0));
end decoder4x16;

architecture Behavioral of decoder4x16 is

component decoder2x4 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           E : in STD_LOGIC;
           out0 : out STD_LOGIC;
           out1 : out STD_LOGIC;
           out2 : out STD_LOGIC;
           out3 : out STD_LOGIC);
end component;

signal E: std_logic_vector(3 downto 0);

begin

GEN_DEC: for i in 0 to 4 generate

    DEC0: if i=0 generate
        DEC0: decoder2x4 port map(X(3),X(2),'1',E(0),E(1),E(2),E(3));
    end generate DEC0;
    
    DECX: if (i>0) generate
        DECX: decoder2x4 port map(X(1), X(0), E(i-1), Y((i-1)*4), Y((i-1)*4 + 1),Y((i-1)*4 +2),Y((i-1)*4 + 3));
    end generate DECX;
        
end generate GEN_DEC;

end Behavioral;
